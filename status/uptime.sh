show_uptime() {
  local index icon color text module

  tmux_batch_setup_status_module "uptime"
  run_tmux_batch_commands

  index=$1
  icon="$(get_tmux_batch_option "@catppuccin_uptime_icon" "󰔟")"
  color="$(get_tmux_batch_option "@catppuccin_uptime_color" "$thm_green")"
  text="$(get_tmux_batch_option "@catppuccin_uptime_text" "#(uptime | sed 's/^[^,]*up *//; s/, *[[:digit:]]* user.*//; s/ day.*, */d /; s/:/h /; s/ min//; s/$/m/')")"

  module=$(build_status_module "$index" "$icon" "$color" "$text")

  echo "$module"
}
