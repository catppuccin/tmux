show_session() {
  local icon="$(get_tmux_option "@catppuccin_session_icon" "")"

  if [[ $1 -eq 0 || $status_connect_separator == "no" ]]
  then
    local show_left_separator="#[fg=$thm_green]#[bg=$thm_bg]#{?client_prefix,#[fg=$thm_red],#[fg=$thm_green]}$status_left_separator"
  else
    local show_left_separator="#[fg=$thm_green]#[bg=$thm_gray]#{?client_prefix,#[fg=$thm_red],#[fg=$thm_green]}$status_left_separator"
  fi
  
  local show_icon="#{?client_prefix,#[bg=$thm_red],#[bg=$thm_green]}#[fg=$thm_bg]$icon "
  local show_text="#[fg=$thm_fg,bg=$thm_gray] #S"
  local show_right_separator="#[fg=$thm_gray,bg=$thm_bg,nobold,nounderscore,noitalics]$status_right_separator"

  echo "$show_left_separator$show_icon$show_text$show_right_separator"
}
