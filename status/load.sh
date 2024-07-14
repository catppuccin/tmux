show_load() {
  local index icon color text module

  tmux_batch_setup_module "application"
  run_tmux_batch_commands

  index=$1
  icon="$(get_tmux_batch_option "@catppuccin_load_icon" "󰊚")"
  color="$(get_tmux_batch_option "@catppuccin_load_color" "$thm_blue")"
  text="$(get_tmux_batch_option "@catppuccin_load_text" "#{load_full}")"

  module=$(build_status_module "$index" "$icon" "$color" "$text")

  echo "$module"
}
