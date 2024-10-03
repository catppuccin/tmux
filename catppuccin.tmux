#!/usr/bin/env bash

# Set path of script
PLUGIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

tmux source "${PLUGIN_DIR}/catppuccin_options_tmux.conf"
tmux source "${PLUGIN_DIR}/catppuccin_tmux.conf"
