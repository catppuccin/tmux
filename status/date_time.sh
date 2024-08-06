show_date_time() {
  local index icon color text module

  index=$1
  icon="$(get_tmux_option "@catppuccin_date_time_icon" "󰃰")"
  color="$(get_tmux_option "@catppuccin_date_time_color" "$thm_blue")"
  text="$(get_tmux_option "@catppuccin_date_time_text" "%Y-%m-%d %H:%M")"

  module=$(build_status_module "$index" "$icon" "$color" "$text")

  echo "$module"
}
