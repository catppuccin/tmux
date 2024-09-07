#!/usr/bin/env bash

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

# Tests that the default options are set correctly
tmux source ${script_dir}/../catppuccin_options_tmux.conf

tmux show -g @catppuccin_flavor
