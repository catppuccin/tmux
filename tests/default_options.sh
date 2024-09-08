#!/usr/bin/env bash

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

# Tests that the default options are set correctly
tmux source "${script_dir}/../catppuccin_options_tmux.conf"
tmux source "${script_dir}/../catppuccin_tmux.conf"

tmux show -g @catppuccin_flavor

echo -n "\n@catppuccin_menu_selected_style "
tmux display-message -p '#{E:@catppuccin_menu_selected_style}'

