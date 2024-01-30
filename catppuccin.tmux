#!/usr/bin/env bash
PLUGIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

get_tmux_option() {
  local option value default
  option="$1"
  default="$2"
  value=$(tmux show-option -gqv "$option")

  if [ -n "$value" ]
  then
    if [ "$value" = "null" ]
    then
      echo ""

    else
      echo "$value"
    fi

  else
    echo "$default"

  fi
}

set() {
  local option=$1
  local value=$2
  tmux_commands+=(set-option -gq "$option" "$value" ";")
}

setw() {
  local option=$1
  local value=$2
  tmux_commands+=(set-window-option -gq "$option" "$value" ";")
}

build_window_icon() {
  local window_status_icon_enable=$(get_tmux_option "@catppuccin_window_status_icon_enable" "yes")

  local custom_icon_window_last=$(get_tmux_option "@catppuccin_icon_window_last" "󰖰")
  local custom_icon_window_current=$(get_tmux_option "@catppuccin_icon_window_current" "󰖯")
  local custom_icon_window_zoom=$(get_tmux_option "@catppuccin_icon_window_zoom" "󰁌")
  local custom_icon_window_mark=$(get_tmux_option "@catppuccin_icon_window_mark" "󰃀")
  local custom_icon_window_silent=$(get_tmux_option "@catppuccin_icon_window_silent" "󰂛")
  local custom_icon_window_activity=$(get_tmux_option "@catppuccin_icon_window_activity" "󰖲")
  local custom_icon_window_bell=$(get_tmux_option "@catppuccin_icon_window_bell" "󰂞")

  if [ "$window_status_icon_enable" = "yes" ]
  then
    # #!~[*-]MZ
    local show_window_status="#{?window_activity_flag,${custom_icon_window_activity},}#{?window_bell_flag,${custom_icon_window_bell},}#{?window_silence_flag,${custom_icon_window_silent},}#{?window_active,${custom_icon_window_current},}#{?window_last_flag,${custom_icon_window_last},}#{?window_marked_flag,${custom_icon_window_mark},}#{?window_zoomed_flag,${custom_icon_window_zoom},}"
  fi

  if [ "$window_status_icon_enable" = "no" ]
  then
    local show_window_status="#F"
  fi

  echo "$show_window_status"
}

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

build_window_format() {
  local number=$1
  local color=$2
  local background=$3
  local text=$4
  local fill=$5

  if [ "$window_status_enable" = "yes" ]
  then
    local icon="$( build_window_icon )"
    text="$text $icon"
  fi

  if [ "$fill" = "none" ]
  then
    local show_left_separator="#[fg=$thm_gray,bg=$thm_bg,nobold,nounderscore,noitalics]$window_left_separator"
    local show_number="#[fg=$thm_fg,bg=$thm_gray]$number"
    local show_middle_separator="#[fg=$thm_fg,bg=$thm_gray,nobold,nounderscore,noitalics]$window_middle_separator"
    local show_text="#[fg=$thm_fg,bg=$thm_gray]$text"
    local show_right_separator="#[fg=$thm_gray,bg=$thm_bg]$window_right_separator"

  fi

  if [ "$fill" = "all" ]
  then
    local show_left_separator="#[fg=$color,bg=$thm_bg,nobold,nounderscore,noitalics]$window_left_separator"
    local show_number="#[fg=$background,bg=$color]$number"
    local show_middle_separator="#[fg=$background,bg=$color,nobold,nounderscore,noitalics]$window_middle_separator"
    local show_text="#[fg=$background,bg=$color]$text"
    local show_right_separator="#[fg=$color,bg=$thm_bg]$window_right_separator"

  fi

  if [ "$fill" = "number" ]
  then
    local show_number="#[fg=$background,bg=$color]$number"
    local show_middle_separator="#[fg=$color,bg=$background,nobold,nounderscore,noitalics]$window_middle_separator"
    local show_text="#[fg=$thm_fg,bg=$background]$text"

    if [ "$window_number_position" = "right" ]
    then
      local show_left_separator="#[fg=$background,bg=$thm_bg,nobold,nounderscore,noitalics]$window_left_separator"
      local show_right_separator="#[fg=$color,bg=$thm_bg]$window_right_separator"
    fi

    if [ "$window_number_position" = "left" ]
    then
      local show_right_separator="#[fg=$background,bg=$thm_bg,nobold,nounderscore,noitalics]$window_right_separator"
      local show_left_separator="#[fg=$color,bg=$thm_bg]$window_left_separator"
    fi

  fi

  local final_window_format

  if [ "$window_number_position" = "right" ]
  then
    final_window_format="$show_left_separator$show_text$show_middle_separator$show_number$show_right_separator"
  fi

  if [ "$window_number_position" = "left" ]
  then
    final_window_format="$show_left_separator$show_number$show_middle_separator$show_text$show_right_separator"
  fi

  echo "$final_window_format"
}

build_status_module() {
  local index=$1
  local icon=$2
  local color=$3
  local text=$4

  if [ "$status_fill" = "icon" ]
  then
    local show_left_separator="#[fg=$color,bg=$thm_gray,nobold,nounderscore,noitalics]$status_left_separator"

    local show_icon="#[fg=$thm_bg,bg=$color,nobold,nounderscore,noitalics]$icon "
    local show_text="#[fg=$thm_fg,bg=$thm_gray] $text"

    local show_right_separator="#[fg=$thm_gray,bg=$thm_bg,nobold,nounderscore,noitalics]$status_right_separator"

    if [ "$status_connect_separator" = "yes" ]
    then
      local show_left_separator="#[fg=$color,bg=$thm_gray,nobold,nounderscore,noitalics]$status_left_separator"
      local show_right_separator="#[fg=$thm_gray,bg=$thm_gray,nobold,nounderscore,noitalics]$status_right_separator"

    else
      local show_left_separator="#[fg=$color,bg=$thm_bg,nobold,nounderscore,noitalics]$status_left_separator"
      local show_right_separator="#[fg=$thm_gray,bg=$thm_bg,nobold,nounderscore,noitalics]$status_right_separator"
    fi

  fi

  if [ "$status_fill" = "all" ]
  then
    local show_left_separator="#[fg=$color,bg=$thm_gray,nobold,nounderscore,noitalics]$status_left_separator"

    local show_icon="#[fg=$thm_bg,bg=$color,nobold,nounderscore,noitalics]$icon "
    local show_text="#[fg=$thm_bg,bg=$color]$text"

    local show_right_separator="#[fg=$color,bg=$thm_gray,nobold,nounderscore,noitalics]$status_right_separator"

    if [ "$status_connect_separator" = "yes" ]
    then
      local show_left_separator="#[fg=$color,nobold,nounderscore,noitalics]$status_left_separator"
      local show_right_separator="#[fg=$color,bg=$color,nobold,nounderscore,noitalics]$status_right_separator"

    else
      local show_left_separator="#[fg=$color,bg=$thm_bg,nobold,nounderscore,noitalics]$status_left_separator"
      local show_right_separator="#[fg=$color,bg=$thm_bg,nobold,nounderscore,noitalics]$status_right_separator"
    fi

  fi

  if [ "$status_right_separator_inverse" = "yes" ]
  then
    if [ "$status_connect_separator" = "yes" ]
    then
      local show_right_separator="#[fg=$thm_gray,bg=$color,nobold,nounderscore,noitalics]$status_right_separator"
    else
      local show_right_separator="#[fg=$thm_bg,bg=$color,nobold,nounderscore,noitalics]$status_right_separator"
    fi
  fi

  if [ $(($index)) -eq 0  ]
  then
      local show_left_separator="#[fg=$color,bg=$thm_bg,nobold,nounderscore,noitalics]$status_left_separator"
  fi

  echo "$show_left_separator$show_icon$show_text$show_right_separator"
}

load_modules() {
  local modules_list=$1
  shift
  local module_directories=("$@")

  local -i module_index=0;
  local module_name
  local module_path
  local loaded_modules
  local IN=$modules_list

  # https://stackoverflow.com/questions/918886/how-do-i-split-a-string-on-a-delimiter-in-bash#15988793
  while [ "$IN" != "$iter" ] ;do
    # extract the substring from start of string up to delimiter.
    iter=${IN%% *}
    # delete this first "element" AND next separator, from $IN.
    IN="${IN#$iter }"
    # Print (or doing anything with) the first "element".

    module_name=$iter

    for module_dir in "${module_directories[@]}" ; do
      module_path="$module_dir/$module_name.sh"

      if [ -r "$module_path" ]; then
        source "$module_path"
        loaded_modules="$loaded_modules$( "show_$module_name" "$module_index" )"
        module_index+=1
        break
      fi
    done
  done

  echo "$loaded_modules"
}

main() {
  local theme
  theme="$(get_tmux_option "@catppuccin_flavour" "mocha")"

  # Aggregate all commands in one array
  local tmux_commands=()

  # NOTE: Pulling in the selected theme by the theme that's being set as local
  # variables.
  # shellcheck source=catppuccin-frappe.tmuxtheme
  # https://github.com/dylanaraps/pure-sh-bible#parsing-a-keyval-file
  while IFS='=' read -r key val; do
      # Skip over lines containing comments.
      # (Lines starting with '#').
      [ "${key##\#*}" ] || continue

      # '$key' stores the key.
      # '$val' stores the value.
      eval "local $key"="$val"
  done < "${PLUGIN_DIR}/catppuccin-${theme}.tmuxtheme"

  # module directories
  local custom_path="$(get_tmux_option "@catppuccin_custom_plugin_dir" "${PLUGIN_DIR}/custom")"
  local modules_custom_path=$custom_path
  local modules_status_path=$PLUGIN_DIR/status
  local modules_window_path=$PLUGIN_DIR/window
  local modules_pane_path=$PLUGIN_DIR/pane

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
  local pane_status_enable=$(get_tmux_option "@catppuccin_pane_status_enabled" "no") # yes
  local pane_border_status=$(get_tmux_option "@catppuccin_pane_border_status" "off") # bottom
  local pane_border_style=$(get_tmux_option "@catppuccin_pane_border_style" "fg=${thm_gray}")
  local pane_active_border_style=$(get_tmux_option "@catppuccin_pane_active_border_style" "fg=${thm_orange}")
  local pane_left_separator=$(get_tmux_option "@catppuccin_pane_left_separator" "█")
  local pane_middle_separator=$(get_tmux_option "@catppuccin_pane_middle_separator" "█")
  local pane_right_separator=$(get_tmux_option "@catppuccin_pane_right_separator" "█")
  local pane_number_position=$(get_tmux_option "@catppuccin_pane_number_position" "left") # right, left
  local pane_format=$(load_modules "pane_default_format" "$modules_custom_path" "$modules_pane_path")

  setw pane-border-status "$pane_border_status"
  setw pane-active-border-style "$pane_active_border_style"
  setw pane-border-style "$pane_border_style"
  setw pane-border-format "$pane_format"


  # windows
  setw window-status-activity-style "fg=${thm_fg},bg=${thm_bg},none"
  setw window-status-separator ""
  setw window-status-style "fg=${thm_fg},bg=${thm_bg},none"

  # --------=== Statusline

  local window_left_separator=$(get_tmux_option "@catppuccin_window_left_separator" "█")
  local window_right_separator=$(get_tmux_option "@catppuccin_window_right_separator" "█")
  local window_middle_separator=$(get_tmux_option "@catppuccin_window_middle_separator" "█ ")
  local window_number_position=$(get_tmux_option "@catppuccin_window_number_position" "left") # right, left
  local window_status_enable=$(get_tmux_option "@catppuccin_window_status_enable" "no") # right, left

  local window_format=$(load_modules "window_default_format" "$modules_custom_path" "$modules_window_path")
  local window_current_format=$(load_modules "window_current_format" "$modules_custom_path" "$modules_window_path")

  setw window-status-format "$window_format"
  setw window-status-current-format "$window_current_format"

  local status_left_separator=$(get_tmux_option "@catppuccin_status_left_separator" "")
  local status_right_separator=$(get_tmux_option "@catppuccin_status_right_separator" "█")
  local status_right_separator_inverse=$(get_tmux_option "@catppuccin_status_right_separator_inverse" "no")
  local status_connect_separator=$(get_tmux_option "@catppuccin_status_connect_separator" "yes")
  local status_fill=$(get_tmux_option "@catppuccin_status_fill" "icon")

  local status_modules_right=$(get_tmux_option "@catppuccin_status_modules_right" "application session")
  local loaded_modules_right=$(load_modules "$status_modules_right" "$modules_custom_path" "$modules_status_path")

  local status_modules_left=$(get_tmux_option "@catppuccin_status_modules_left" "")
  local loaded_modules_left=$(load_modules "$status_modules_left" "$modules_custom_path" "$modules_status_path")

  set status-left "$loaded_modules_left"
  set status-right "$loaded_modules_right"

  # --------=== Modes
  #
  setw clock-mode-colour "${thm_blue}"
  setw mode-style "fg=${thm_pink} bg=${thm_black4} bold"

  tmux "${tmux_commands[@]}"
}

main "$@"
