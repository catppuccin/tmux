show_host() {
  local icon="$(get_tmux_option "@catppuccin_host_icon" "󰒋")"

  if [[ $1 -eq 0 || $status_connect_separator == "no" ]]
  then
    local show_left_separator="#[fg=$thm_blue,bg=$thm_bg,nobold,nounderscore,noitalics]$status_left_separator"
  else
    local show_left_separator="#[fg=$thm_blue,bg=$thm_gray,nobold,nounderscore,noitalics]$status_left_separator"
  fi

  local show_icon="#[fg=$thm_bg,bg=$thm_blue,nobold,nounderscore,noitalics]$icon "
  local show_text="#[fg=$thm_fg,bg=$thm_gray] #H"
  local show_right_separator="#[fg=$thm_gray,bg=$thm_bg,nobold,nounderscore,noitalics]$status_right_separator"

  echo "$show_left_separator$show_icon$show_text$show_right_separator"
}
