# Requires https://github.com/xwjdsh/tmux-nowplaying.
show_nowplaying() {
  local index=$1
  local icon="$(get_tmux_option "@catppuccin_nowplaying_icon" "󰎄")"
  local color="$(get_tmux_option "@catppuccin_nowplaying_color" "$thm_yellow")"
  local text="$(get_tmux_option "@catppuccin_nowplaying_text" "#{nowplaying}")"

  local module=$(build_status_module "$index" "$icon" "$color" "$text")

  echo "$module"
}
