show_ram() {
  local index icon color text module

  tmux_batch_setup_status_module "ram"

  tmux_batch_options_commands+=("set-option -gq @ram_low_bg_color $thm_yellow ;")    # background color when ram is low
  tmux_batch_options_commands+=("set-option -gq @ram_medium_bg_color $thm_orange ;") # background color when ram is medium
  tmux_batch_options_commands+=("set-option -gq @ram_high_bg_color $thm_red ;")      # background color when ram is high

  run_tmux_batch_commands

  index=$1
  icon=$(get_tmux_option "@catppuccin_ram_icon" "󰍛")
  color="$(get_tmux_option "@catppuccin_ram_color" "#{ram_bg_color}")"
  text="$(get_tmux_option "@catppuccin_ram_text" "#{ram_percentage}")"

  module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}
