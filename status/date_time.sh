show_date_time() {
  local index=$1
  local icon="$(get_tmux_option "@catppuccin_date_time_icon" "󰃰")"
  local color="$(get_tmux_option "@catppuccin_date_time_color" "$thm_blue")"
  local text="$(get_tmux_option "@catppuccin_date_time_text" "%Y-%m-%d %H:%M")"

  local module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}

