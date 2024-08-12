show_user() {
  local index icon color text module

  tmux_batch_setup_status_module "user"
  run_tmux_batch_commands

  index=$1
  icon=$(get_tmux_batch_option "@catppuccin_user_icon" "")
  color=$(get_tmux_batch_option "@catppuccin_user_color" "$thm_cyan")
  text=$(get_tmux_batch_option "@catppuccin_user_text" "#(whoami)")

  module=$(build_status_module "$index" "$icon" "$color" "$text")

  echo "$module"
}
