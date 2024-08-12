show_directory() {
  local index icon color text module

  tmux_batch_setup_status_module "directory"
  run_tmux_batch_commands

  index=$1
  icon=$(get_tmux_batch_option "@catppuccin_directory_icon" "")
  color=$(get_tmux_batch_option "@catppuccin_directory_color" "$thm_pink")
  text=$(get_tmux_batch_option "@catppuccin_directory_text" "#{b:pane_current_path}")

  module=$(build_status_module "$index" "$icon" "$color" "$text")

  echo "$module"
}
