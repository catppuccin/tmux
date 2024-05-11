#!/bin/sh

build_window_format() {
  local number="$1"
  local color="$2"
  local background="$3"
  local text="$4"
  local fill="$5"

  if [ "$window_status_enable" = "yes" ]; then
    local icon
    icon="$(build_window_icon)"
    text="$text$icon"
  fi

  if [ "$fill" = "none" ]; then
    local show_number="#[fg=$thm_fg,bg=$thm_gray]$number"
    local show_middle_separator="#[fg=$thm_fg,bg=$thm_gray,nobold,nounderscore,noitalics]$window_middle_separator"
    local show_text="#[fg=$thm_fg,bg=$thm_gray]$text"

    if [ "$status_connect_separator" = "yes" ]; then
      local show_left_separator="#[fg=$thm_gray,bg=$thm_bg,nobold,nounderscore,noitalics]$window_left_separator"
      local show_right_separator="#[fg=$thm_gray,bg=$thm_bg]$window_right_separator"

    else
      local show_left_separator="#[fg=$thm_gray,bg=default,nobold,nounderscore,noitalics]$window_left_separator"
      local show_right_separator="#[fg=$thm_gray,bg=default]$window_right_separator"

    fi

  fi

  if [ "$fill" = "all" ]; then
    local show_number="#[fg=$background,bg=$color]$number"
    local show_middle_separator="#[fg=$background,bg=$color,nobold,nounderscore,noitalics]$window_middle_separator"
    local show_text="#[fg=$background,bg=$color]$text"

    if [ "$status_connect_separator" = "yes" ]; then
      local show_left_separator="#[fg=$color,bg=$thm_bg,nobold,nounderscore,noitalics]$window_left_separator"
      local show_right_separator="#[fg=$color,bg=$thm_bg]$window_right_separator"

    else
      local show_left_separator="#[fg=$color,bg=default,nobold,nounderscore,noitalics]$window_left_separator"
      local show_right_separator="#[fg=$color,bg=default]$window_right_separator"

    fi

  fi

  if [ "$fill" = "number" ]; then
    local show_number="#[fg=$background,bg=$color]$number"
    local show_middle_separator="#[fg=$color,bg=$background,nobold,nounderscore,noitalics]$window_middle_separator"
    local show_text="#[fg=$thm_fg,bg=$background]$text"

    if [ "$window_number_position" = "right" ]; then
      if [ "$status_connect_separator" = "yes" ]; then
        local show_left_separator="#[fg=$background,bg=$thm_bg,nobold,nounderscore,noitalics]$window_left_separator"
        local show_right_separator="#[fg=$color,bg=$thm_bg]$window_right_separator"

      else
        local show_left_separator="#[fg=$background,bg=default,nobold,nounderscore,noitalics]$window_left_separator"
        local show_right_separator="#[fg=$color,bg=default]$window_right_separator"

      fi
    fi

    if [ "$window_number_position" = "left" ]; then
      if [ "$status_connect_separator" = "yes" ]; then
        local show_right_separator="#[fg=$background,bg=$thm_bg,nobold,nounderscore,noitalics]$window_right_separator"
        local show_left_separator="#[fg=$color,bg=$thm_bg]$window_left_separator"

      else
        local show_right_separator="#[fg=$background,bg=default,nobold,nounderscore,noitalics]$window_right_separator"
        local show_left_separator="#[fg=$color,bg=default]$window_left_separator"

      fi

    fi

  fi

  local final_window_format

  if [ "$window_number_position" = "right" ]; then
    final_window_format="$show_left_separator$show_text$show_middle_separator$show_number$show_right_separator"
  fi

  if [ "$window_number_position" = "left" ]; then
    final_window_format="$show_left_separator$show_number$show_middle_separator$show_text$show_right_separator"
  fi

  echo "$final_window_format"
}

build_window_icon() {
  local window_status_icon_enable custom_icon_window_last \
    custom_icon_window_zoom custom_icon_window_mark custom_icon_window_mark \
    custom_icon_window_silent custom_icon_window_activity custom_icon_window_bell

  window_status_icon_enable=$(get_tmux_option "@catppuccin_window_status_icon_enable" "yes")
  custom_icon_window_last=$(get_tmux_option "@catppuccin_icon_window_last" "󰖰")
  custom_icon_window_current=$(get_tmux_option "@catppuccin_icon_window_current" "󰖯")
  custom_icon_window_zoom=$(get_tmux_option "@catppuccin_icon_window_zoom" "󰁌")
  custom_icon_window_mark=$(get_tmux_option "@catppuccin_icon_window_mark" "󰃀")
  custom_icon_window_silent=$(get_tmux_option "@catppuccin_icon_window_silent" "󰂛")
  custom_icon_window_activity=$(get_tmux_option "@catppuccin_icon_window_activity" "󱅫")
  custom_icon_window_bell=$(get_tmux_option "@catppuccin_icon_window_bell" "󰂞")

  if [ "$window_status_icon_enable" = "yes" ]; then
    # #!~[*-]MZ
    local show_window_status=""
    show_window_status+="#{?window_activity_flag, ${custom_icon_window_activity},}"
    show_window_status+="#{?window_bell_flag, ${custom_icon_window_bell},}"
    show_window_status+="#{?window_silence_flag, ${custom_icon_window_silent},}"
    show_window_status+="#{?window_active, ${custom_icon_window_current},}"
    show_window_status+="#{?window_last_flag, ${custom_icon_window_last},}"
    show_window_status+="#{?window_marked_flag, ${custom_icon_window_mark},}"
    show_window_status+="#{?window_zoomed_flag, ${custom_icon_window_zoom},}"

  fi

  if [ "$window_status_icon_enable" = "no" ]; then
    local show_window_status=" #F"
  fi

  echo "$show_window_status"
}
