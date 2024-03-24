#!/usr/bin/env bash

# Set path of script
PLUGIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# import
source "${PLUGIN_DIR}/builder/module_builder.sh"
source "${PLUGIN_DIR}/builder/window_builder.sh"
source "${PLUGIN_DIR}/builder/pane_builder.sh"
source "${PLUGIN_DIR}/utils/tmux_utils.sh"
source "${PLUGIN_DIR}/utils/module_utils.sh"


main() {
  # Aggregate all commands in one array
  local tmux_commands=()

  # module directories
  local custom_path="$(get_tmux_option "@catppuccin_custom_plugin_dir" "${PLUGIN_DIR}/custom")"
  local modules_custom_path=$custom_path
  local modules_status_path=$PLUGIN_DIR/status
  local modules_window_path=$PLUGIN_DIR/window
  local modules_pane_path=$PLUGIN_DIR/pane

  # load local theme
  local theme="$(get_tmux_option "@catppuccin_flavour" "mocha")"
  # NOTE: Pulling in the selected theme by the theme that's being set as local
  # variables.
  # shellcheck source=catppuccin-frappe.tmuxtheme
  # https://github.com/dylanaraps/pure-sh-bible#parsing-a-keyval-file
  while IFS='=' read -r key val; do
      # Skip over lines containing comments.
      # (Lines starting with '#').
      [ "${key##\#*}" ] || continue

      # '$key' stores the key.
      # '$val' stores the value.
      eval "local $key"="$val"
  done < "${PLUGIN_DIR}/catppuccin-${theme}.tmuxtheme"

  # status general
  local status_default=$(get_tmux_option "@catppuccin_status_default" "on")
  set status "$status_default"

  local status_justify=$(get_tmux_option "@catppuccin_status_justify" "left")
  set status-justify "$status_justify"

  local status_background=$(get_tmux_option "@catppuccin_status_background" "theme")
  if [ "${status_background}" = "theme" ];
  then
    set status-bg "${thm_bg}"
  else
    if [ "${status_background}" = "default" ]
    then
      set status-style bg=default
    else
      set status-bg "${status_background}"
    fi
  fi

  set status-left-length "100"
  set status-right-length "100"


  # messages
  set message-style "fg=${thm_cyan},bg=${thm_gray},align=centre"
  set message-command-style "fg=${thm_cyan},bg=${thm_gray},align=centre"

  # panes
  local pane_status_enable=$(get_tmux_option "@catppuccin_pane_status_enabled" "no") # yes
  local pane_border_status=$(get_tmux_option "@catppuccin_pane_border_status" "off") # bottom
  local pane_border_style=$(get_tmux_option "@catppuccin_pane_border_style" "fg=${thm_gray}")
  local pane_active_border_style=$(\
    get_tmux_option "@catppuccin_pane_active_border_style" \
    "#{?pane_in_mode,fg=${thm_yellow},#{?pane_synchronized,fg=${thm_magenta},fg=${thm_orange}}}"
  )
  local pane_left_separator=$(get_tmux_option "@catppuccin_pane_left_separator" "█")
  local pane_middle_separator=$(get_tmux_option "@catppuccin_pane_middle_separator" "█")
  local pane_right_separator=$(get_tmux_option "@catppuccin_pane_right_separator" "█")
  local pane_number_position=$(get_tmux_option "@catppuccin_pane_number_position" "left") # right, left
  local pane_format=$(load_modules "pane_default_format" "$modules_custom_path" "$modules_pane_path")

  setw pane-border-status "$pane_border_status"
  setw pane-active-border-style "$pane_active_border_style"
  setw pane-border-style "$pane_border_style"
  setw pane-border-format "$pane_format"

  # window
  local window_status_separator=$(get_tmux_option "@catppuccin_window_separator" "")
  setw window-status-separator "$window_status_separator"

  setw window-status-activity-style "fg=${thm_fg},bg=${thm_bg},none"
  setw window-status-style "fg=${thm_fg},bg=${thm_bg},none"

  local window_left_separator=$(get_tmux_option "@catppuccin_window_left_separator" "█")
  local window_right_separator=$(get_tmux_option "@catppuccin_window_right_separator" "█")
  local window_middle_separator=$(get_tmux_option "@catppuccin_window_middle_separator" "█ ")
  local window_number_position=$(get_tmux_option "@catppuccin_window_number_position" "left") # right, left
  local window_status_enable=$(get_tmux_option "@catppuccin_window_status_enable" "no") # right, left

  local window_format=$(load_modules "window_default_format" "$modules_custom_path" "$modules_window_path")
  setw window-status-format "$window_format"

  local window_current_format=$(load_modules "window_current_format" "$modules_custom_path" "$modules_window_path")
  setw window-status-current-format "$window_current_format"

  # status module
  local status_left_separator=$(get_tmux_option "@catppuccin_status_left_separator" "")
  local status_right_separator=$(get_tmux_option "@catppuccin_status_right_separator" "█")
  local status_right_separator_inverse=$(get_tmux_option "@catppuccin_status_right_separator_inverse" "no")
  local status_connect_separator=$(get_tmux_option "@catppuccin_status_connect_separator" "yes")
  local status_fill=$(get_tmux_option "@catppuccin_status_fill" "icon")

  local status_modules_left=$(get_tmux_option "@catppuccin_status_modules_left" "")
  local loaded_modules_left=$(load_modules "$status_modules_left" "$modules_custom_path" "$modules_status_path")
  set status-left "$loaded_modules_left"

  local status_modules_right=$(get_tmux_option "@catppuccin_status_modules_right" "application session")
  local loaded_modules_right=$(load_modules "$status_modules_right" "$modules_custom_path" "$modules_status_path")
  set status-right "$loaded_modules_right"

  # modes
  setw clock-mode-colour "${thm_blue}"
  setw mode-style "fg=${thm_pink} bg=${thm_black4} bold"

  tmux "${tmux_commands[@]}"
}

main "$@"
