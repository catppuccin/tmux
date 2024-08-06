# Requires https://github.com/tmux-plugins/tmux-net-speed
show_network() {
  local index icon color text module

  index=$1
  icon="$(get_tmux_option "@catppuccin_weather_icon" "")"
  color="$(get_tmux_option "@catppuccin_weather_color" "$thm_green")"
  text="$(get_tmux_option "@catppuccin_weather_text" "#{net_speed}")"

  module=$(build_status_module "$index" "$icon" "$color" "$text")

  echo "$module"
}
