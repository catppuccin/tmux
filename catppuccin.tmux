#!/usr/bin/env bash
PLUGIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEFAULT_STATUS_LINE_FILE=src/default.conf
PILL_STATUS_LINE_FILE=src/pill-status-line.conf
POWERLINE_STATUS_LINE_FILE=src/powerline-status-line.conf
POWERLINE_ICONS_STATUS_LINE_FILE=src/powerline-icons-status-line.conf
NO_PATCHED_FONTS_STATUS_LINE_FILE=src/no-patched-fonts-status-line.conf

get_tmux_option() {
  local option value default
  option="$1"
  default="$2"
  value="$(tmux show-option -gqv "$option")"

  if [ -n "$value" ]; then
    echo "$value"
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

load_modules() {
  local loaded_modules

  local modules_path=$1
  local modules_list=$2

  local modules_array
  read -a modules_array <<< "$modules_list"

  local module_index=0;
  local module_name
  for module_name in ${modules_array[@]}
  do
    local module_path=$modules_path/$module_name.sh
    source $module_path

    if [[ 0 -eq $? ]]
    then
      loaded_modules="$loaded_modules$( show_$module_name $module_index )"
      module_index=$module_index+1
    fi

  done

  echo $loaded_modules
}

main() {
  local theme
  theme="$(get_tmux_option "@catppuccin_flavour" "mocha")"

  # Aggregate all commands in one array
  local tmux_commands=()

  # NOTE: Pulling in the selected theme by the theme that's being set as local
  # variables.
  # shellcheck source=catppuccin-frappe.tmuxtheme
  source /dev/stdin <<<"$(sed -e "/^[^#].*=/s/^/local /" "${PLUGIN_DIR}/catppuccin-${theme}.tmuxtheme")"

  # status
  set status "on"
  set status-bg "${thm_bg}"
  set status-justify "left"
  set status-left-length "100"
  set status-right-length "100"

  # messages
  set message-style "fg=${thm_cyan},bg=${thm_gray},align=centre"
  set message-command-style "fg=${thm_cyan},bg=${thm_gray},align=centre"

  # panes
  set pane-border-style "fg=${thm_gray}"
  set pane-active-border-style "fg=${thm_blue}"

  # windows
  setw window-status-activity-style "fg=${thm_fg},bg=${thm_bg},none"
  setw window-status-separator ""
  setw window-status-style "fg=${thm_fg},bg=${thm_bg},none"

  # --------=== Statusline

  local window_left_separator="$(get_tmux_option "@catppuccin_window_left_separator" "█")"
  local window_right_separator="$(get_tmux_option "@catppuccin_window_right_separator" "█")"
  local window_middle_separator="$(get_tmux_option "@catppuccin_window_middle_separator" "█")"
  local window_color_fill="$(get_tmux_option "@catppuccin_window_color_fill" "number")"
  local window_icon_position="$(get_tmux_option "@catppuccin_window_icon_position" "right")"

  local window_module="$(get_tmux_option "@catppuccin_window_module" "directory_in_window")"
  local window_current_module="$(get_tmux_option "@catppuccin_window_current_module" "directory_in_window_current")"

  local window_format=$( load_modules "$PLUGIN_DIR/window" "$window_module")
  local window_current_format=$( load_modules "$PLUGIN_DIR/window" "$window_current_module")

  setw window-status-format "${window_format}"
  setw window-status-current-format "${window_current_format}"

  local status_left_separator="$(get_tmux_option "@catppuccin_status_left_separator" " ")"
  local status_right_separator="$(get_tmux_option "@catppuccin_status_right_separator" "█")"
  local status_connect_separator="$(get_tmux_option "@catppuccin_status_connect_separator" "yes")"

  local status_modules="$(get_tmux_option "@catppuccin_status_modules" "application session")"
  local loaded_modules=$( load_modules "$PLUGIN_DIR/status" "$status_modules")

  set status-left ""
  set status-right "${loaded_modules}"

  # --------=== Modes
  #
  setw clock-mode-colour "${thm_blue}"
  setw mode-style "fg=${thm_pink} bg=${thm_black4} bold"

  tmux "${tmux_commands[@]}"
}

main "$@"
