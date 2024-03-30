show_window_default_format() {
  local number color background text fill default_window_format

  number="#I"
  color=$(get_tmux_option "@catppuccin_window_default_color" "$thm_blue")
  background=$(get_tmux_option "@catppuccin_window_default_background" "$thm_gray")
  text="$(get_tmux_option "@catppuccin_window_default_text" "#{b:pane_current_path}")" # use #W for application instead of directory
  fill="$(get_tmux_option "@catppuccin_window_default_fill" "number")"                 # number, all, none

  default_window_format=$(build_window_format "$number" "$color" "$background" "$text" "$fill")

  echo "$default_window_format"
}
