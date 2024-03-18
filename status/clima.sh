# Requires https://github.com/vascomfnunes/tmux-clima
show_clima() {
  local index=$1
  local icon="$(get_tmux_option "@catppuccin_weather_icon" "")"
  local color="$(get_tmux_option "@catppuccin_weather_color" "$thm_yellow")"
  local text="$(get_tmux_option "@catppuccin_weather_text" "#{clima}")"

  local module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}
