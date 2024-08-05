# Requires https://github.com/jonmosco/kube-tmux

show_kube() {
  local index icon color text context_color namespace_color symbol_enabled module

  tmux_batch_setup_status_module "kube"

  add_tmux_batch_option "@catppuccin_kube_context_color"
  add_tmux_batch_option "@catppuccin_kube_namespace_color"

  run_tmux_batch_commands

  index=$1
  icon=$(get_tmux_batch_option "@catppuccin_kube_icon" "󱃾")
  color=$(get_tmux_batch_option "@catppuccin_kube_color" "$thm_blue")
  context_color=$(get_tmux_batch_option "@catppuccin_kube_context_color" "#{thm_red}")
  namespace_color=$(get_tmux_batch_option "@catppuccin_kube_namespace_color" "#{thm_cyan}")
  symbol_enabled=${KUBE_TMUX_SYMBOL_ENABLE:-false}
  text=$(get_tmux_batch_option "@catppuccin_kube_text" "#(KUBE_TMUX_SYMBOL_ENABLE=$symbol_enabled ${TMUX_PLUGIN_MANAGER_PATH}kube-tmux/kube.tmux 250 '$context_color' '$namespace_color')")

  module=$(build_status_module "$index" "$icon" "$color" "$text")

  echo "$module"
}
