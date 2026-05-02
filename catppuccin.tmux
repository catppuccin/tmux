#!/usr/bin/env bash

if [[ "$(tmux show -gvq @catppuccin_reset)" == 'true' ]]; then
  # Reset everything if requested.
  #
  # Useful for auto switching between themes:
  #
  # set-hook -g client-dark-theme {
  #   set -g @catppuccin_reset "true"
  #   run ~/code/github.com/catppuccin/tmux/catppuccin.tmux
  #
  #   set -g @catppuccin_flavor "frappe"
  #   # Other custom overrides.
  #   run ~/code/github.com/catppuccin/tmux/catppuccin.tmux
  # }
  # set-hook -g client-light-theme {
  #   set -g @catppuccin_reset "true"
  #   run ~/code/github.com/catppuccin/tmux/catppuccin.tmux
  #
  #   set -g @catppuccin_flavor "latte"
  #   # Other custom overrides.
  #   run ~/code/github.com/catppuccin/tmux/catppuccin.tmux
  # }
  opts="$(tmux show -gq | cut -d ' ' -f 1 | grep -E '@catppuccin_|@thm_')"
  for opt in ${opts}; do
    tmux set -Ugq "${opt}"
  done
else
  # Otherwise, set path of script and load plugin.
  PLUGIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  tmux source "${PLUGIN_DIR}/catppuccin_options_tmux.conf"
  tmux source "${PLUGIN_DIR}/catppuccin_tmux.conf"
fi
