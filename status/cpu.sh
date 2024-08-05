show_cpu() {
  local index icon color text module

  tmux_batch_setup_status_module "cpu"

  tmux_batch_options_commands+=("set-option -gq @cpu_low_bg_color $thm_yellow ;")    # background color when cpu is low
  tmux_batch_options_commands+=("set-option -gq @cpu_medium_bg_color $thm_orange ;") # background color when cpu is medium
  tmux_batch_options_commands+=("set-option -gq @cpu_high_bg_color $thm_red ;")      # background color when cpu is high

  run_tmux_batch_commands

  index=$1
  icon=$(get_tmux_batch_option "@catppuccin_cpu_icon" "")
  color="$(get_tmux_batch_option "@catppuccin_cpu_color" "#{cpu_bg_color}")"
  text="$(get_tmux_batch_option "@catppuccin_cpu_text" "#{cpu_percentage}")"

  module=$(build_status_module "$index" "$icon" "$color" "$text")

  echo "$module"
}
