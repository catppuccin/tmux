# Requires https://github.com/xamut/tmux-weather.
show_weather() {
  local index=$1
  local icon="$(get_tmux_option "@catppuccin_weather_icon" "")"
  local color="$(get_tmux_option "@catppuccin_weather_color" "$thm_yellow")"
  local text="$(get_tmux_option "@catppuccin_weather_text" "#{weather}")"

  local module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}
