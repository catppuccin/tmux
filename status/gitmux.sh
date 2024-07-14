# Requires https://github.com/arl/gitmux

show_gitmux() {
  local index icon color text module

  tmux_batch_setup_module "application"
  run_tmux_batch_commands

  index=$1
  icon="$(get_tmux_batch_option "@catppuccin_gitmux_icon"  "󰊢")"
  color="$(get_tmux_batch_option "@catppuccin_gitmux_color" "$thm_green")"
  text="$(get_tmux_batch_option "@catppuccin_gitmux_text"  "#(gitmux \"#{pane_current_path}\")")"

  module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}
