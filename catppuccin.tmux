# NOTE: you can use vars with $<var> and ${<var>} as long as the str is double quoted: ""
# WARNING: hex colors can't contain capital letters

# --> Catppuccin
thm_bg="#1e1e28"
thm_fg="#dadae8"
thm_cyan="#c2e7f0"
thm_black="#15121c"
thm_gray="#332e41"
thm_magenta="#c6aae8"
thm_pink="#e5b4e2"
thm_red="#e38c8f"
thm_green="#b1e3ad"
thm_yellow="#ebddaa"
thm_blue="#a4b9ef"
thm_orange="#f9c096"
thm_black4="#575268"

# ----------------------------=== Theme ===--------------------------

# status
set -g status-position top
set -g status "on"
set -g status-bg "${thm_bg}"
set -g status-justify "left"
set -g status-left-length "100"
set -g status-right-length "100"

# messages
set -g message-style fg="${thm_cyan}",bg="${thm_gray}",align="centre"
set -g message-command-style fg="${thm_cyan}",bg="${thm_gray}",align="centre"

# panes
set -g pane-border-style fg="${thm_gray}"
set -g pane-active-border-style fg="${thm_blue}"

# windows
setw -g window-status-activity-style fg="${thm_fg}",bg="${thm_bg}",none
setw -g window-status-separator ""
setw -g window-status-style fg="${thm_fg}",bg="${thm_bg}",none

# --------=== Statusline

set -g status-left ""
set -g status-right "#[fg=$thm_pink,bg=$thm_bg,nobold,nounderscore,noitalics]#[fg=$thm_bg,bg=$thm_pink,nobold,nounderscore,noitalics] #[fg=$thm_fg,bg=$thm_gray] #W #{?client_prefix,#[fg=$thm_red],#[fg=$thm_green]}#[bg=$thm_gray]#{?client_prefix,#[bg=$thm_red],#[bg=$thm_green]}#[fg=$thm_bg] #[fg=$thm_fg,bg=$thm_gray] #S "

# current_dir
setw -g window-status-format "#[fg=$thm_bg,bg=$thm_blue] #I #[fg=$thm_fg,bg=$thm_gray] #{b:pane_current_path} "
setw -g window-status-current-format "#[fg=$thm_bg,bg=$thm_orange] #I #[fg=$thm_fg,bg=$thm_bg] #{b:pane_current_path} "

# parent_dir/current_dir
# setw -g window-status-format "#[fg=colour232,bg=colour111] #I #[fg=colour222,bg=colour235] #(echo '#{pane_current_path}' | rev | cut -d'/' -f-2 | rev) "
# setw -g window-status-current-format "#[fg=colour232,bg=colour208] #I #[fg=colour255,bg=colour237] #(echo '#{pane_current_path}' | rev | cut -d'/' -f-2 | rev) "

# --------=== Modes
setw -g clock-mode-colour "${thm_blue}"
setw -g mode-style "fg=${thm_pink} bg=${thm_black4} bold"
