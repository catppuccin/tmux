show_load() {
  local index=$1
  local icon="$(get_tmux_option "@catppuccin_load_icon" "󰊚")"
  local color="$(get_tmux_option "@catppuccin_load_color" "$thm_blue")"
  local text="$(get_tmux_option "@catppuccin_load_text" "#{load_full}")"

  local module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}

