# Requires https://github.com/thewtex/tmux-mem-cpu-load

show_cpu_mem() {
  local index icon color text module

  index=$1
  icon="$(get_tmux_option "@catppuccin_cpu_mem_icon" "")"
  color="$(get_tmux_option "@catppuccin_cpu_mem_color" "$thm_blue")"
  text="$(get_tmux_option "@catppuccin_cpu_mem__text" "#($TMUX_PLUGIN_MANAGER_PATH/tmux-mem-cpu-load/tmux-mem-cpu-load --cpu-mode 2 --averages-count 0 --interval 2)")"

  module=$(build_status_module "$index" "$icon" "$color" "$text")

  echo "$module"
}
