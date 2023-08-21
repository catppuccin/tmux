show_example() {
  local index=$1
  local icon="$(get_tmux_option "@catppuccin_test_icon" "󰙨")"
  local color="$(get_tmux_option "@catppuccin_test_color" "$thm_blue")"
  local text="$(get_tmux_option "@catppuccin_test_text" "It works!")"

  local module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}
