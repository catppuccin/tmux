#!/usr/bin/env bash

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)
# shellcheck disable=SC1091
source "${script_dir}/helpers.sh"

print_message_styles() {
  print_option message-style
  print_option message-command-style
}

tmux source "${script_dir}/../catppuccin_options_tmux.conf"
tmux set -g @catppuccin_status_background "none"
tmux source "${script_dir}/../catppuccin_tmux.conf"
print_message_styles

tmux set -g @catppuccin_status_background "red"
tmux source "${script_dir}/../catppuccin_tmux.conf"
print_message_styles
