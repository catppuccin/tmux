#!/usr/bin/env bash

# NOTE: you can use vars with $<var> and ${<var>} as long as the str is double quoted: ""
# WARNING: hex colors can't contain capital letters

# --> Catppuccin (Frappe)
thm_bg="#232634"
thm_fg="#c6d0f5"
thm_cyan="#99d1db"
thm_black="#292c3c"
thm_gray="#51576d"
thm_magenta="#ca9ee6"
thm_pink="#f4b8e4"
thm_red="#e78284"
thm_green="#a6d189"
thm_yellow="#e5c890"
thm_blue="#8caaee"
thm_orange="#ef9f76"
thm_black4="#626880"

# ----------------------------=== Theme ===--------------------------

# utils
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
