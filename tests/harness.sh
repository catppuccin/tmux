#!/usr/bin/env bash

set -Euo pipefail
trap cleanup SIGINT SIGTERM ERR EXIT

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

usage() {
  cat <<EOF
Usage: $(basename "${BASH_SOURCE[0]}") [-h] [-v] [-f] -p param_value arg1 [arg2...]

Checks that running the given script, specified with -t, matches the output
specified in the file with -e.

Available options:

-h, --help      Print this help and exit
-t, --test      The script to run to generate the test output
-e, --expected  File that contains the expected output of the test
--no-color      Do not use color in the output
EOF
  exit
}

setup_colors() {
  if [[ -t 2 ]] && [[ -z "${NO_COLOR-}" ]] && [[ "${TERM-}" != "dumb" ]]; then
    DIFFCOLORS="always" NOFORMAT='\033[0m' RED='\033[0;31m' GREEN='\033[0;32m' ORANGE='\033[0;33m' BLUE='\033[0;34m' PURPLE='\033[0;35m' CYAN='\033[0;36m' YELLOW='\033[1;33m'
  else
    DIFFCOLORS="never" NOFORMAT='' RED='' GREEN='' ORANGE='' BLUE='' PURPLE='' CYAN='' YELLOW=''
  fi
}

msg() {
  echo >&2 -e "${1-}"
}

SOCKET_NAME="${SOCKET_NAME:-test}"

tmux() {
  command tmux -L "$SOCKET_NAME" "$@"
}

start_tmux_server() {
  msg "${CYAN}Starting tmux server${NOFORMAT}\n"
  tmux new -s dummy -d
}

kill_tmux_server() {
  msg "${CYAN}Stopping tmux server${NOFORMAT}"
  tmux kill-server
}

cleanup() {
  trap - SIGINT SIGTERM ERR EXIT
  kill_tmux_server
}

die() {
  local msg=$1
  local code=${2-1} # default exit status 1
  msg "$msg"
  exit "$code"
}

parse_params() {
  # default values of variables set from params
  test_script=''
  expected_output=''

  while :; do
    case "${1-}" in
    -h | --help) usage ;;
    --no-color) NO_COLOR=1 ;;
    -t | --test)
      test_script="${2-}"
      shift
      ;;
    -e | --expected)
      expected_output="${2-}"
      shift
      ;;
    -?*) die "Unknown option: $1" ;;
    *) break ;;
    esac
    shift
  done

  args=("$@")

  # check required params and arguments
  [[ -z "${test_script-}" ]] && die "Missing required parameter: -t|--test"
  [[ -z "${expected_output-}" ]] && die "Missing required parameter: -e|--expected"

  return 0
}

parse_params "$@"
setup_colors

run_test() {
  msg "Running test ${test_script} and checking the output against ${expected_output}\n"
  msg "Using socket ${SOCKET_NAME}"

  kill_tmux_server
  start_tmux_server

  local output
  output=$(${test_script})

  echo ${output} | diff --color=${DIFFCOLORS} - ${expected_output}

  if test $? -eq 0; then
    kill_tmux_server
    msg "\n${GREEN}Test passed${NOFORMAT}"
  else
    kill_tmux_server
    die "\n${RED}Test failed${NOFORMAT}"
  fi
}

run_test
