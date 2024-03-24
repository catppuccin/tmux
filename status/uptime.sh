show_uptime() {
  local index=$1
  local icon="$(get_tmux_option "@catppuccin_uptime_icon" "󰔟")"
  local color="$(get_tmux_option "@catppuccin_uptime_color" "$thm_green")"
  local text="$(get_tmux_option "@catppuccin_uptime_text" "#(uptime | sed 's/^[^,]*up *//; s/, *[[:digit:]]* users.*//; s/ day.*, */d /; s/:/h /; s/ min//; s/$/m/')")"

  local module=$(build_status_module "$index" "$icon" "$color" "$text")

  echo "$module"
}
