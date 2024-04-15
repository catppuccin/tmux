# Requires https://github.com/arl/gitmux

show_git() {
  local index icon color text module

  index=$1
  icon="$(  get_tmux_option "@catppuccin_git_icon"  "󰊢"           )"
  color="$( get_tmux_option "@catppuccin_git_color" "$thm_green"  )"
  text="$(  get_tmux_option "@catppuccin_git_text"  "#(gitmux "#{pane_current_path}")")"
  # For custom gitmux you need to create a specific configuration file in .gitmux.conf
  # and use the following line instead of the one above. For all the details see the gitmux repository
  # text="$(  get_tmux_option "@catppuccin_git_text"  "#(gitmux -cfg $HOME/.gitmux.conf "#{pane_current_path}")")"

  module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}
