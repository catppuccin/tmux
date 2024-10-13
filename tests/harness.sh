#!/usr/bin/env bash

set -Euo pipefail
trap cleanup SIGINT SIGTERM ERR EXIT

usage() {
  trap - EXIT
  cat <<EOF
Usage: $(basename "${BASH_SOURCE[0]}") [-h] [-v] [-f] -p param_value arg1 [arg2...]

Checks that running the given script, specified with -t, matches the output
specified in the file with -e.

Available options:

-h, --help      Print this help and exit
-t, --test      The script to run to generate the test output
-e, --expected  File that contains the expected output of the test
-v, --verbose   Enable verbose messaging
--no-color      Do not use color in the output
EOF
  exit
}

DIFFCOLORS="never" NOFORMAT='' RED='' GREEN='' ORANGE='' BLUE='' PURPLE='' CYAN='' YELLOW=''
setup_colors() {
  if [[ -t 2 ]] && [[ -z "${NO_COLOR-}" ]] && [[ "${TERM-}" != "dumb" ]]; then
    DIFFCOLORS="always" NOFORMAT='\033[0m' RED='\033[0;31m' GREEN='\033[0;32m' ORANGE='\033[0;33m' BLUE='\033[0;34m' PURPLE='\033[0;35m' CYAN='\033[0;36m' YELLOW='\033[1;33m'
  else
    # shellcheck disable=SC2034
    DIFFCOLORS="never" NOFORMAT='' RED='' GREEN='' ORANGE='' BLUE='' PURPLE='' CYAN='' YELLOW=''
  fi
}

VERBOSE=false

msg() {
  echo >&2 -e "${1-}"
}

msg_verbose() {
  if [ "$VERBOSE" = true ]; then
    msg "$@"
  fi
}

SOCKET_NAME="${SOCKET_NAME:-test}"
SESSION_NAME="test-session"

tmux() {
  command tmux -L "$SOCKET_NAME" -f /dev/null "$@"
}

start_tmux_server() {
  msg_verbose "${CYAN}Starting tmux server on socket ${SOCKET_NAME}${NOFORMAT}"
  tmux new -s "$SESSION_NAME" -d "$(which bash)"
}

kill_tmux_server() {
  msg_verbose "${CYAN}Stopping tmux server${NOFORMAT}"
  tmux kill-session "$SESSION_NAME" 2>/dev/null
  tmux kill-server 2>/dev/null
}

cleanup() {
  trap - SIGINT SIGTERM ERR EXIT

  # If the session is still running then stop it.
  tmux has-session -t "$SESSION_NAME" 2>/dev/null
  if test $? -eq 0; then
    kill_tmux_server
  fi
}

die() {
  local msg=$1
  local code=${2-1} # default exit status 1
  msg "$msg"

  cleanup

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
    -v | --verbose)
      VERBOSE=true
      shift
      ;;
    -?*) die "Unknown option: $1" ;;
    *) break ;;
    esac
    shift
  done

  # shellcheck disable=SC2034
  args=("$@")

  # check required params and arguments
  [[ -z "${test_script-}" ]] && die "Missing required parameter: -t|--test"
  [[ -z "${expected_output-}" ]] && die "Missing required parameter: -e|--expected"

  return 0
}

parse_params "$@"
setup_colors

run_test() {
  msg_verbose "Running test ${test_script} and checking the output against ${expected_output}"

  start_tmux_server

  local script_name
  script_name=$(basename "${test_script}")

  local output
  # shellcheck disable=SC1090
  output=$(source "${test_script}")
  test_exit_code="$?"

  if test $test_exit_code -ne 0; then
    die "\n${RED}Test ${script_name} exited with code $test_exit_code ${NOFORMAT}"
  fi

  echo -e "${output}" | diff -abB --color=${DIFFCOLORS} "${expected_output}" -

  if test $? -eq 0; then
    msg "${GREEN}Test ${script_name} passed${NOFORMAT}"
  else
    die "\n${RED}Test ${script_name} failed${NOFORMAT}"
  fi

  cleanup
}

run_test
