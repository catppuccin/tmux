show_battery() {
  tmux set-option -g @batt_icon_charge_tier8 '󰁹'
  tmux set-option -g @batt_icon_charge_tier7 '󰂁'
  tmux set-option -g @batt_icon_charge_tier6 '󰁿'
  tmux set-option -g @batt_icon_charge_tier5 '󰁾'
  tmux set-option -g @batt_icon_charge_tier4 '󰁽'
  tmux set-option -g @batt_icon_charge_tier3 '󰁼'
  tmux set-option -g @batt_icon_charge_tier2 '󰁻'
  tmux set-option -g @batt_icon_charge_tier1 '󰁺'
  tmux set-option -g @batt_icon_status_charged '󰚥'
  tmux set-option -g @batt_icon_status_charging '󰂄'
  tmux set-option -g @batt_icon_status_discharging '󰂃'
  tmux set-option -g @batt_icon_status_unknown '󰂑'

  local index=$1
  local icon=$(get_tmux_option "@catppuccin_battery_icon" "#{battery_icon}")
  local color=$(get_tmux_option "@catppuccin_battery_color" "$thm_yellow")
  local text=$(get_tmux_option "@catppuccin_battery_text" "#{battery_percentage}")

  local module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}
