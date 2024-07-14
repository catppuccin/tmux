show_window_default_format() {
  local number color background text fill default_window_format
  # shellcheck disable=SC2034
  local tmux_batch_options_commands=()
  # shellcheck disable=SC2034
  local tmux_batch_options=()

  add_tmux_batch_option "@catppuccin_window_default_color"
  add_tmux_batch_option "@catppuccin_window_default_background"
  add_tmux_batch_option "@catppuccin_window_default_text"
  add_tmux_batch_option "@catppuccin_window_default_fill"

  run_tmux_batch_commands

  number="#I"
  color=$(get_tmux_batch_option "@catppuccin_window_default_color" "$thm_blue")
  background=$(get_tmux_batch_option "@catppuccin_window_default_background" "$thm_gray")
  text="$(get_tmux_batch_option "@catppuccin_window_default_text" "#{b:pane_current_path}")" # use #W for application instead of directory
  fill="$(get_tmux_batch_option "@catppuccin_window_default_fill" "number")"                 # number, all, none

  default_window_format=$(build_window_format "$number" "$color" "$background" "$text" "$fill")

  echo "$default_window_format"
}
