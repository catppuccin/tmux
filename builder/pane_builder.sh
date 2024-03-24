#!/bin/sh

build_pane_format() {
  local number=$1
  local color=$2
  local background=$3
  local text=$4
  local fill=$5

  if [ "$pane_status_enable" = "yes" ]
  then
    if [ "$fill" = "none" ]
    then
      local show_left_separator="#[fg=$thm_gray,bg=$thm_bg,nobold,nounderscore,noitalics]$pane_left_separator"
      local show_number="#[fg=$thm_fg,bg=$thm_gray]$number"
      local show_middle_separator="#[fg=$thm_fg,bg=$thm_gray,nobold,nounderscore,noitalics]$pane_middle_separator"
      local show_text="#[fg=$thm_fg,bg=$thm_gray]$text"
      local show_right_separator="#[fg=$thm_gray,bg=$thm_bg]$pane_right_separator"
    fi

    if [ "$fill" = "all" ]
    then
      local show_left_separator="#[fg=$color,bg=$thm_bg,nobold,nounderscore,noitalics]$pane_left_separator"
      local show_number="#[fg=$background,bg=$color]$number"
      local show_middle_separator="#[fg=$background,bg=$color,nobold,nounderscore,noitalics]$pane_middle_separator"
      local show_text="#[fg=$background,bg=$color]$text"
      local show_right_separator="#[fg=$color,bg=$thm_bg]$pane_right_separator"
    fi

    if [ "$fill" = "number" ]
    then
      local show_number="#[fg=$background,bg=$color]$number"
      local show_middle_separator="#[fg=$color,bg=$background,nobold,nounderscore,noitalics]$pane_middle_separator"
      local show_text="#[fg=$thm_fg,bg=$background]$text"

      if [ "$pane_number_position" = "right" ]
      then
        local show_left_separator="#[fg=$background,bg=$thm_bg,nobold,nounderscore,noitalics]$pane_left_separator"
        local show_right_separator="#[fg=$color,bg=$thm_bg]$pane_right_separator"
      fi

      if [ "$pane_number_position" = "left" ]
      then
        local show_right_separator="#[fg=$background,bg=$thm_bg,nobold,nounderscore,noitalics]$pane_right_separator"
        local show_left_separator="#[fg=$color,bg=$thm_bg]$pane_left_separator"
      fi

    fi

    local final_pane_format

    if [ "$pane_number_position" = "right" ]
    then
      final_pane_format="$show_left_separator$show_text$show_middle_separator$show_number$show_right_separator"
    fi

    if [ "$pane_number_position" = "left" ]
    then
      final_pane_format="$show_left_separator$show_number$show_middle_separator$show_text$show_right_separator"
    fi

    echo "$final_pane_format"
  fi
}
