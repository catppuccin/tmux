show_pane_current_format() {
  local number="#I"
  local color="$thm_orange"
  local background="$thm_bg"
  local text="$(get_tmux_option "@catppuccin_pane_current_text" "#{b:pane_current_path}")" # use #W for application instead of directory
  local fill="$(get_tmux_option "@catppuccin_pane_current_fill" "number")" # number, all, none

  local current_pane_format=$( build_pane_format "$number" "$color" "$background" "$text" "$fill" )

  echo "$current_pane_format"
}
