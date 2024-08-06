# Requires https://github.com/vascomfnunes/tmux-clima
show_clima() {
  local index icon color text module

  index=$1
  icon="$(get_tmux_option "@catppuccin_clima_icon" "")"
  color="$(get_tmux_option "@catppuccin_clima_color" "$thm_yellow")"
  text="$(get_tmux_option "@catppuccin_clima_text" "#{clima}")"

  module=$(build_status_module "$index" "$icon" "$color" "$text")

  echo "$module"
}
