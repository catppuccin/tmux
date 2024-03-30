#!/usr/bin/env bash

#
# Usage:
# ./test.bash catpuccin-tmux/catpuccin-tmux.tmux
# ./test.bash catpuccin-tmux/catpuccin-tmux.tmux ./config-example1
#

SOCKET_NAME="${SOCKET_NAME:-test}"

tmux() {
  command tmux -L "$SOCKET_NAME" "$@"
}

start_tmux_server() {
  echo "Starting tmux server" >&2
  tmux new -s dummy -d
}

kill_tmux_server() {
  echo "Stopping tmux server" >&2
  tmux kill-server
}

check() {
  local out exit_code
  exit_code="$1"
  out="$2"

  if [ "$exit_code" -ne 0 ] || [ -n "$out" ]; then
    echo "Failed with exit code $exit_code and output:"
    echo "$out"
    exit 1
  fi

}

main() {
  local config_file plugin output exit_code

  plugin="$1"
  config_file="$2"

  echo "Using socket '$SOCKET_NAME'" >&2

  # Make sure its a new/clean server
  kill_tmux_server 2>/dev/null
  start_tmux_server

  if [ -z "$config_file" ]; then
    echo "No config file provided" >&2
  else
    echo "sourcing config file '$config_file'" >&2
    tmux source-file "$config_file"
  fi

  if [ -z "$plugin" ]; then
    echo "ERROR: No path to the plugin provided" >&2
    exit 1
  else
    echo "Running plugin: $plugin" >&2
    output=$(tmux run-shell "$plugin" 2>&1)
    exit_code="$?"

    check "$exit_code" "$output"
  fi

  kill_tmux_server
}

main "$@"
