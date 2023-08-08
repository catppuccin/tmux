show_window_format() {
  local icon="#I"
  local color="$thm_blue"
  local text

  local window_format

  if [[ $window_format_style == "directory" ]]
  then
    text="$(get_tmux_option "@catppuccin_window_format_directory_text" "#{b:pane_current_path}")"
  fi

  if [[ $window_format_style == "application" ]]
  then
    text="#W"
  fi

  if [[ $window_color_fill == "all" ]] 
  then
    local show_left_separator="#[fg=$thm_gray,bg=$thm_bg,nobold,nounderscore,noitalics]$window_left_separator"
    local show_icon="#[fg=$thm_fg,bg=$thm_gray]$icon"
    local show_middle_separator="#[fg=$thm_fg,bg=$thm_gray,nobold,nounderscore,noitalics]$window_middle_separator"
    local show_text="#[fg=$thm_fg,bg=$thm_gray]$text"
    local show_right_separator="#[fg=$thm_gray,bg=$thm_bg]$window_right_separator"

  fi

  if [[ $window_color_fill == "number" ]] 
  then
    local show_icon="#[fg=$thm_bg,bg=$color]$icon"
    local show_middle_separator="#[fg=$color,bg=$thm_gray,nobold,nounderscore,noitalics]$window_middle_separator"
    local show_text="#[fg=$thm_fg,bg=$thm_gray]$text"

    if [[ $window_icon_position == "right" ]]
    then
      local show_left_separator="#[fg=$thm_gray,bg=$thm_bg,nobold,nounderscore,noitalics]$window_left_separator"
      local show_right_separator="#[fg=$color,bg=$thm_bg]$window_right_separator"
    fi

    if [[ $window_icon_position == "left" ]]
    then
      local show_right_separator="#[fg=$thm_gray,bg=$thm_bg,nobold,nounderscore,noitalics]$window_right_separator"
      local show_left_separator="#[fg=$color,bg=$thm_bg]$window_left_separator"
    fi

  fi

  if [[ $window_icon_position == "right" ]]
  then
    window_format="$show_left_separator$show_text$show_middle_separator$show_icon$show_right_separator"
  fi

  if [[ $window_icon_position == "left" ]]
  then
    window_format="$show_left_separator$show_icon$show_middle_separator$show_text$show_right_separator"
  fi

  echo $window_format
}
