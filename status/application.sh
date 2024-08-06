show_application() {
  local index icon color text module

  index=$1
  icon=$(get_tmux_option "@catppuccin_application_icon" "")
  color=$(get_tmux_option "@catppuccin_application_color" "$thm_pink")
  text=$(get_tmux_option "@catppuccin_application_text" "#{pane_current_command}")

  module=$(build_status_module "$index" "$icon" "$color" "$text")

  echo "$module"
}
