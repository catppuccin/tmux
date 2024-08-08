#!/bin/sh

tmux_echo() {
  local hook
  hook="after-new-session[$2]"

  tmux set-hook -g "$hook" "run-shell 'echo \"$1\"'; set-hook -gu \"$hook\""
}

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

get_interpolated_tmux_option() {
  local option value default
  option="$1"
  default="$2"
  value=$(tmux show-option -gqv "$option")

  if [ -n "$value" ]
  then
    if [ "$value" = "null" ]
    then
      echo ""

    else
      do_color_interpolation "$value"
    fi

  else
    echo "$default"
  fi
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
