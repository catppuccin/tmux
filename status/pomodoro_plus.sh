# Requires https://github.com/olimorris/tmux-pomodoro-plus

show_pomodoro_plus() {
  local index icon color text module

  tmux_batch_setup_status_module "pomodoro_plus"
  run_tmux_batch_commands

  index=$1
  icon="$(  get_tmux_batch_option "@catppuccin_pomodoro_plus_icon"  ""           )"
  color="$( get_tmux_batch_option "@catppuccin_pomodoro_plus_color" "$thm_orange" )"
  text="$(  get_tmux_batch_option "@catppuccin_pomodoro_plus_text"  "#{pomodoro_status}" )"

  module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}
