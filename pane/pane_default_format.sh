show_pane_default_format() {
  local number="#I"
  local color="$thm_blue"
  local background="$thm_gray"
  local text="$(get_tmux_option "@catppuccin_pane_default_text" "#{b:pane_current_path}")" # use #W for application instead of directory
  local fill="$(get_tmux_option "@catppuccin_pane_default_fill" "number")" # number, all, none

  local default_pane_format=$( build_pane_format "$number" "$color" "$background" "$text" "$fill" )

  echo "$default_pane_format"
}
