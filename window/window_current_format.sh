show_window_current_format() {
  local number color background text fill current_window_format

  number="#I"
  color=$(get_tmux_option "@catppuccin_window_current_color" "$thm_orange")
  background=$(get_tmux_option "@catppuccin_window_current_background" "$thm_bg")
  text="$(get_tmux_option "@catppuccin_window_current_text" "#{b:pane_current_path}")" # use #W for application instead of directory
  fill="$(get_tmux_option "@catppuccin_window_current_fill" "number")"                 # number, all, none

  current_window_format=$(build_window_format "$number" "$color" "$background" "$text" "$fill")

  echo "$current_window_format"
}
