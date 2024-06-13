# Requires https://github.com/MunifTanjim/tmux-mode-indicator

show_mode_indicator() {
  local index icon color text module

  index=$1

  icon="$(get_tmux_option "@catppuccin_mode_indicator_icon" "")"
  color="$(get_tmux_option "@catppuccin_mode_indicator_color" "$thm_yellow")"
  text="$(get_tmux_option "@catppuccin_mode_indicator_text" "#{tmux_mode_indicator}")"

  # Choose to Keep colour constant and only change text
  tmux set -g @mode_indicator_prefix_mode_style "bg=$color,fg=black"
  tmux set -g @mode_indicator_copy_mode_style "bg=$color,fg=black"
  tmux set -g @mode_indicator_sync_mode_style "bg=$color,fg=black"
  tmux set -g @mode_indicator_empty_mode_style "bg=$color,fg=black"

  # Displaying TMUX in normal mode is confusing, so let's make it more sensible
  tmux set -g @mode_indicator_empty_prompt '----'
  tmux set -g @mode_indicator_prefix_prompt 'WAIT'
  tmux set -g @mode_indicator_copy_prompt 'COPY'
  tmux set -g @mode_indicator_sync_prompt 'SYNC'

  module=$(build_status_module "$index" "$icon" "$color" "$text")

  echo "$module"
}
