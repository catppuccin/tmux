show_window_format() {
  local icon="#I"
  local color="$thm_blue"
  local background="$thm_gray"
  local text
  local fill="$(get_tmux_option "@catppuccin_window_color_fill" "number")" # number, all, none

  if [[ $window_format_style == "directory" ]]
  then
    text="$(get_tmux_option "@catppuccin_window_format_directory_text" "#{b:pane_current_path}")"
  fi

  if [[ $window_format_style == "application" ]]
  then
    text="#W"
  fi
  
  local current_window_format=$( build_window_format "$icon" "$color" "$background" "$text" "$fill")

  echo "$current_window_format"
}
