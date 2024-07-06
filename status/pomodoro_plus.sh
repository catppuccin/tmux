# Requires https://github.com/olimorris/tmux-pomodoro-plus

show_pomodoro_plus() {
  local index icon color text module

  index=$1
  icon="$(  get_tmux_option "@catppuccin_<module_name>_icon"  ""           )"
  color="$( get_tmux_option "@catppuccin_<module_name>_color" "$thm_orange" )"
  text="$(  get_tmux_option "@catppuccin_<module_name>_text"  "#{pomodoro_status}" )"

  module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}
