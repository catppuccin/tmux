#!/usr/bin/env bash
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

main() {
  get-tmux-option() {
    local option value default
    option="$1"
    default="$2"
    value="$(tmux show-option -gqv "$option")"

    if [ -n "$value" ]; then
      echo "$value"
    else
      echo "$default"
    fi
  }

  set() {
    local option=$1
    local value=$2
    tmux set-option -gq "$option" "$value"
  }

  setw() {
    local option=$1
    local value=$2
    tmux set-window-option -gq "$option" "$value"
  }

  local theme
  local window_tabs_enabled
  theme="$(get-tmux-option "@catppuccin_flavour" "mocha")"
  window_tabs_enabled="$(get-tmux-option "@catppuccin_window_tabs_enabled" "off")"

  # NOTE: Pulling in the selected theme by the theme that's being set as local
  # variables.
  sed -E 's/^(.+=)/local \1/' \
      > catppuccin-selected-theme.tmuxtheme \
      < "${CURRENT_DIR}/catppuccin-${theme}.tmuxtheme"

  source catppuccin-selected-theme.tmuxtheme

  # status
  set status "on"
  set status-bg "${thm_bg}"
  set status-justify "left"
  set status-left-length "100"
  set status-right-length "100"

  # messages
  set message-style "fg=${thm_cyan},bg=${thm_gray},align=centre"
  set message-command-style "fg=${thm_cyan},bg=${thm_gray},align=centre"

  # panes
  set pane-border-style "fg=${thm_gray}"
  set pane-active-border-style "fg=${thm_blue}"

  # windows
  setw window-status-activity-style "fg=${thm_fg},bg=${thm_bg},none"
  setw window-status-separator ""
  setw window-status-style "fg=${thm_fg},bg=${thm_bg},none"

  # --------=== Statusline

  set status-left ""
  set status-right "#[fg=$thm_pink,bg=$thm_bg,nobold,nounderscore,noitalics]#[fg=$thm_bg,bg=$thm_pink,nobold,nounderscore,noitalics] #[fg=$thm_fg,bg=$thm_gray] #W #{?client_prefix,#[fg=$thm_red],#[fg=$thm_green]}#[bg=$thm_gray]#{?client_prefix,#[bg=$thm_red],#[bg=$thm_green]}#[fg=$thm_bg] #[fg=$thm_fg,bg=$thm_gray] #S "

  # current_dir
  setw window-status-format "#[fg=$thm_bg,bg=$thm_blue] #I #[fg=$thm_fg,bg=$thm_gray] #{b:pane_current_path} "
  setw window-status-current-format "#[fg=$thm_bg,bg=$thm_orange] #I #[fg=$thm_fg,bg=$thm_bg] #{b:pane_current_path} "

  # parent_dir/current_dir
  # setw window-status-format "#[fg=colour232,bg=colour111] #I #[fg=colour222,bg=colour235] #(echo '#{pane_current_path}' | rev | cut -d'/' -f-2 | rev) "
  # setw window-status-current-format "#[fg=colour232,bg=colour208] #I #[fg=colour255,bg=colour237] #(echo '#{pane_current_path}' | rev | cut -d'/' -f-2 | rev) "

  # --------=== Modes
  setw clock-mode-colour "${thm_blue}"
  setw mode-style "fg=${thm_pink} bg=${thm_black4} bold"

  # set status "on"
  # set status-bg "${thm_bg}"
  # set status-justify "left"
  # set status-left-length "100"
  # set status-right-length "100"
  #
  # # messages
  # set message-style "fg=${thm_cyan},bg=${thm_gray},align=centre"
  # set message-command-style "fg=${thm_cyan},bg=${thm_gray},align=centre"
  #
  # # panes
  # set pane-border-style "fg=${thm_gray}"
  # set pane-active-border-style "fg=${thm_blue}"
  #
  # # windows
  # setw window-status-activity-style "fg=${thm_fg},bg=${thm_bg},none"
  # setw window-status-separator ""
  # setw window-status-style "fg=${thm_fg},bg=${thm_bg},none"
  #
  # # --------=== Statusline
  #
  # # TODO: continue implementing this later today...
  # wt_enabled=$(tmux show -gqv @catppuccin_window_tabs_enabled)
  #
  # status_left=""
  # if [[ "${wt_enabled}" == "on" ]]
  # then
  #   status_left="window_tabs_enabled"
  # fi
  #
  # set status-left "#[fg=$thm_red,bg=$thm_bg,nobold,nounderscore,noitalics]$status_left#[fg=$thm_fg,bg=$thm_bg,nobold,nounderscore,noitalics]"
  # set status-right "#[fg=$thm_pink,bg=$thm_bg,nobold,nounderscore,noitalics]#[fg=$thm_bg,bg=$thm_pink,nobold,nounderscore,noitalics]  #[fg=$thm_fg,bg=$thm_gray] #(echo '#{pane_current_path}' | rev | cut -d'/' -f-2 | rev) #{?client_prefix,#[fg=$thm_red],#[fg=$thm_green]}#[bg=$thm_gray]#{?client_prefix,#[bg=$thm_red],#[bg=$thm_green]}#[fg=$thm_bg]  #[fg=$thm_fg,bg=$thm_gray] #S "
  #
  # # current_dir
  # setw window-status-format "#[fg=$thm_fg,bg=$thm_bg] #W #[fg=$thm_bg,bg=$thm_blue] #I#[fg=$thm_blue,bg=$thm_bg]#[fg=$thm_fg,bg=$thm_bg,nobold,nounderscore,noitalics] "
  # setw window-status-current-format "#[fg=$thm_fg,bg=$thm_gray] #W #[fg=$thm_bg,bg=$thm_orange] #I#[fg=$thm_orange,bg=$thm_bg]#[fg=$thm_fg,bg=$thm_bg,nobold,nounderscore,noitalics] "
  #
  # # parent_dir/current_dir
  # # setw window-status-format "#[fg=colour232,bg=colour111] #I #[fg=colour222,bg=colour235] #(echo '#{pane_current_path}' | rev | cut -d'/' -f-2 | rev) "
  # # setw window-status-current-format "#[fg=colour232,bg=colour208] #I #[fg=colour255,bg=colour237] #(echo '#{pane_current_path}' | rev | cut -d'/' -f-2 | rev) "
  #
  # # --------=== Modes
  # setw clock-mode-colour "${thm_blue}"
  # setw mode-style "fg=${thm_pink} bg=${thm_black4} bold"
}

main "$@"
