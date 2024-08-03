#!/bin/sh

tmux_echo() {
  local message="$1"
  tmux run-shell "echo '$message'"
}

get_tmux_option() {
  local option value default sep_before sep_after res
  option="$1"
  default="$2"
  sep_before="$3" # optional separator, prepended to the result if value not empty
  sep_after="$4"  # optional separator, appended to the result if value not empty

  value=$(tmux show-option -gqv "$option")
  res=""

  if [ -n "$value" ]
  then
    if [ "$value" = "null" ]
    then
      res=""
    else
      res="$value"
    fi
  else
    res="$default"
  fi

  if [ -n "$res" ]
  then
    echo "${sep_before}${res}${sep_after}"
  else
    echo "$res"
  fi
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
