#!/usr/bin/env bash
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

get-tmux-option() {
  local option value default
  option="$1"
  default="$2"
  value="$(tmux show-option -gqv "$option")"

  if [ -n "$value" ]; then
    echo "$value"
  else
    # README: Set the default option if it's not set originally.
    tmux set-option -gq "${option}" "${default}"
    echo "$default"
  fi
}

main() {
  local theme
  local window_tabs_enabled
  theme="$(get-tmux-option "@catppuccin_flavour" "mocha")"
  window_tabs_enabled="$(get-tmux-option "@catppuccin_window_tabs_enabled" "false")"
  tmux run -b "$CURRENT_DIR/catppuccin-${theme}.tmuxtheme"
}

main "$@"
