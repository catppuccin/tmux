show_pane_default_format() {
  local number="#{pane_index}"
  local color="$(get_tmux_option "@catppuccin_pane_color" "$thm_green")"
  local background="$(get_tmux_option "@catppuccin_pane_background_color" "$thm_gray")"
  local text="$(get_tmux_option "@catppuccin_pane_default_text" "#{b:pane_current_path}")"
  local fill="$(get_tmux_option "@catppuccin_pane_default_fill" "number")" # number, all, none
  local active="#{pane_active}"

  local default_pane_format=$( build_pane_format "$number" "$color" "$background" "$text" "$fill")

  echo "$default_pane_format"
}
