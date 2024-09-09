#!/usr/bin/env bash

# Prints the given tmux option to stdout.
# First argument is the option name, e.g. @catppuccin_flavor.
#
# Usage: `print-option @catppuccin_flavor`
# Would print: `@catppuccin_flavor mocha`
#
# The variable given is expanded as a format string.
print_option() {
  local option
  option=$1

  printf "\n%s " "${option}"
  tmux display-message -p "#{E:${option}}"
}
