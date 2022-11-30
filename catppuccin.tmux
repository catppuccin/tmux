#!/usr/bin/env bash
PLUGIN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

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
  theme="$(get-tmux-option "@catppuccin_flavour" "mocha")"

  # NOTE: Pulling in the selected theme by the theme that's being set as local
  # variables.
  sed -E 's/^(.+=)/local \1/' \
      > "${PLUGIN_DIR}/catppuccin-selected-theme.tmuxtheme" \
      < "${PLUGIN_DIR}/catppuccin-${theme}.tmuxtheme"

  source "${PLUGIN_DIR}/catppuccin-selected-theme.tmuxtheme"

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

  # NOTE: Checking for the value of @catppuccin_window_tabs_enabled
  wt_enabled="$(get-tmux-option "@catppuccin_window_tabs_enabled" "off")"
  readonly wt_enabled

  # NOTE: Checking for the value of @catppuccin_window_tabs_enabled
  wi_enabled="$(get-tmux-option "@catppuccin_window_icons_enabled" "off")"
  readonly wi_enabled

  # README: Any variables marked `readonly` are the defaults so that it is
  # easier to understand what is a default value. Some variables are marked
  # `local` and that's because they will be used in place for the `setw` and
  # `set` commands to make it easier to parse what is happening.

  # Default Nerd Font zoom/mark icons
  readonly icon_window_current="  "
  readonly icon_window_last="  "
  readonly icon_window_activity="  "
  readonly icon_window_bell=" "
  readonly icon_window_silent=" "
  readonly icon_window_zoom="  "
  readonly icon_window_mark=" "

  # README: The following variables are set to the defaults above but can be
  # overwritten by the user.
  custom_icon_window_last="$(get-tmux-option "@catppuccin_icon_window_last" "${icon_window_last}")"
  readonly custom_icon_window_last

  custom_icon_window_current="$(get-tmux-option "@catppuccin_icon_window_current" "${icon_window_current}")"
  readonly custom_icon_window_current

  custom_icon_window_zoom="$(get-tmux-option "@catppuccin_icon_window_zoom" "${icon_window_zoom}")"
  readonly custom_icon_window_zoom

  custom_icon_window_mark="$(get-tmux-option "@catppuccin_icon_window_mark" "${icon_window_mark}")"
  readonly custom_icon_window_mark

  custom_icon_window_silent="$(get-tmux-option "@catppuccin_icon_window_silent" "${icon_window_silent}")"
  readonly custom_icon_window_silent

  custom_icon_window_activity="$(get-tmux-option "@catppuccin_icon_window_activity" "${icon_window_activity}")"
  readonly custom_icon_window_activity

  custom_icon_window_bell="$(get-tmux-option "@catppuccin_icon_window_bell" "${icon_window_bell}")"
  readonly custom_icon_window_bell

  # Set default the window status variable
  local show_window_status="#F "

  # NOTE: With the @catppuccin_window_icons_enabled set to on, we're going to
  # update the show_window_status with a custom command to replace all the
  # things that it would normally use according to the Tmux source.
  if [[ "${wi_enabled}" == "on" ]]
  then
    show_window_status="#(printf '%%s\n' '#F' | sed \"s/*/${custom_icon_window_current}/\" | sed \"s/-/${custom_icon_window_last}/\" | sed \"s/#/${custom_icon_window_activity}/\" | sed \"s/#//g\"| sed \"s/~/${custom_icon_window_silent}/\" | sed \"s/!/${custom_icon_window_bell}/\" | sed \"s/M/${custom_icon_window_mark}/\" | sed \"s/Z/${custom_icon_window_zoom}/\")"
  fi

  readonly show_directory="#[fg=$thm_pink,bg=$thm_bg,nobold,nounderscore,noitalics]#[fg=$thm_bg,bg=$thm_pink,nobold,nounderscore,noitalics]  #[fg=$thm_fg,bg=$thm_gray] #{b:pane_current_path} #{?client_prefix,#[fg=$thm_red]"
  readonly show_window="#[fg=$thm_pink,bg=$thm_bg,nobold,nounderscore,noitalics]#[fg=$thm_bg,bg=$thm_pink,nobold,nounderscore,noitalics]${show_window_status} #[fg=$thm_fg,bg=$thm_gray] #W #{?client_prefix,#[fg=$thm_red]"
  readonly show_session="#[fg=$thm_green]}#[bg=$thm_gray]#{?client_prefix,#[bg=$thm_red],#[bg=$thm_green]}#[fg=$thm_bg] #[fg=$thm_fg,bg=$thm_gray] #S "
  readonly show_directory_in_window_status="#[fg=$thm_bg,bg=$thm_blue] #I #[fg=$thm_fg,bg=$thm_gray] #{b:pane_current_path} "
  readonly show_directory_in_window_status_current="#[fg=$thm_bg,bg=$thm_orange] #I #[fg=$thm_fg,bg=$thm_bg] #{b:pane_current_path} "
  readonly show_window_in_window_status="#[fg=$thm_fg,bg=$thm_bg] #W #[fg=$thm_bg,bg=$thm_blue] ${show_window_status}#I#[fg=$thm_blue,bg=$thm_bg]#[fg=$thm_fg,bg=$thm_bg,nobold,nounderscore,noitalics] "
  readonly show_window_in_window_status_current="#[fg=$thm_fg,bg=$thm_gray] #W #[fg=$thm_bg,bg=$thm_orange] ${show_window_status}#I#[fg=$thm_orange,bg=$thm_bg]#[fg=$thm_fg,bg=$thm_bg,nobold,nounderscore,noitalics] "

  # Right column 1 by default shows the Window name.
  local right_column1=$show_window

  # Right column 2 by default shows the current Session name.
  local right_column2=$show_session

  # Window status by default shows the current directory basename.
  local window_status_format=$show_directory_in_window_status
  local window_status_current_format=$show_directory_in_window_status_current

  # NOTE: With the @catppuccin_window_tabs_enabled set to on, we're going to
  # update the right_column1 and the window_status_* variables.
  if [[ "${wt_enabled}" == "on" ]]
  then
    right_column1=$show_directory
    window_status_format=$show_window_in_window_status
    window_status_current_format=$show_window_in_window_status_current
  fi

  set status-left ""

  set status-right "${right_column1},${right_column2}"

  setw window-status-format "${window_status_format}"
  setw window-status-current-format "${window_status_current_format}"

  # --------=== Modes
  #
  setw clock-mode-colour "${thm_blue}"
  setw mode-style "fg=${thm_pink} bg=${thm_black4} bold"
}

main "$@"
