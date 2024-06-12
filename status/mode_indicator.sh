# Requires https://github.com/MunifTanjim/tmux-mode-indicator

show_mode_indicator() {
  local index icon color text module

  index=$1

  icon="$(get_tmux_option "@catppuccin_mode_indicator_icon" "")"
  color="$(get_tmux_option "@catppuccin_mode_indicator_color" "$thm_teal")"
  text="$(get_tmux_option "@catppuccin_mode_indicator_text" "#{tmux_mode_indicator}")"

  # Choose to Keep colour constant and only change text
  set -g @mode_indicator_prefix_mode_style "bg=$color,fg=black"
  set -g @mode_indicator_copy_mode_style "bg=$color,fg=black"
  set -g @mode_indicator_sync_mode_style "bg=$color,fg=black"
  set -g @mode_indicator_empty_mode_style "bg=$color,fg=black"

  # Displaying TMUX in normal mode is confusing, so let's make it more sensible
  set -g @mode_indicator_empty_prompt '----'
  set -g @mode_indicator_prefix_prompt 'WAIT'
  set -g @mode_indicator_copy_prompt 'COPY'
  set -g @mode_indicator_sync_prompt 'SYNC'

  module=$(build_status_module "$index" "$icon" "$color" "$text")

  echo "$module"
}
