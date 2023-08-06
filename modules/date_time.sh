show_date_time() {
  local date_time_icon="$(get_tmux_option "@catppuccin_datetime_icon" "󰃰")"
  local date_time_format="$(get_tmux_option "@catppuccin_date_time_format" "%Y-%m-%d %H:%M")"

  local show_left_separator="#[fg=$thm_blue,bg=$thm_bg,nobold,nounderscore,noitalics]$status_left_separator"
  local show_date_time_icon="#[fg=$thm_bg,bg=$thm_blue,nobold,nounderscore,noitalics]$datetime_icon"
  local show_date_time_text="#[fg=$thm_fg,bg=$thm_gray]$date_time_format"
  local show_right_separator="#[fg=$thm_gray,bg=$thm_bg,nobold,nounderscore,noitalics]$status_right_separator"

  local show_date_time=$show_left_separator$show_date_time_icon" "$show_date_time_text$show_right_separator

  echo $show_date_time
}

