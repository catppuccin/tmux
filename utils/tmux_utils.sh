#!/bin/sh

get_tmux_option() {
    local option value default
    option="$1"
    default="$2"

    value="$(tmux show-option -gv "$option" 2>/dev/null)"
    if [ ! "${?}" -eq 0 ]; then
        # Option not set
        value="$default"
    fi

    echo "${value}"
}

set() {
  local option=$1
  local value=$2
  tmux_commands+=(set-option -gq "$option" "$value" ";")
}

setw() {
  local option=$1
  local value=$2
  tmux_commands+=(set-window-option -gq "$option" "$value" ";")
}
