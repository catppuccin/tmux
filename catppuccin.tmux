#!/usr/bin/env bash

# Set path of script
PLUGIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

tmux source "${PLUGIN_DIR}/catppuccin_options_tmux.conf"
tmux source "${PLUGIN_DIR}/catppuccin_tmux.conf"

# Render-safe colors.
#
# tmux's format_expand1 (next-3.7+) treats a leading #1-#9 as positional-argument
# shorthand, so expanding a format at render time eats the first digit of any
# literal #RRGGBB hex (e.g. #15232d -> 5232d). Every option below is a format that
# tmux expands at render time (per window/pane, or via the user's #{E:...} status
# line), so a literal hex baked into one breaks.
#
# Escape every #RRGGBB to ##RRGGBB; the render then unescapes it back to an intact
# #RRGGBB. Deferred references such as #{@thm_*} carry no literal and are left
# untouched (they resolve normally). The pass is idempotent (unescape, then
# escape), so it stays correct if an option is not rebuilt on reload.
_ctp_formats="window-status-format window-status-current-format pane-border-format"
for _ctp_module in application battery clima cpu date_time directory gitmux host \
                   kube load pomodoro_plus ram session uptime user weather; do
  _ctp_formats="${_ctp_formats} @catppuccin_status_${_ctp_module}"
done

for _ctp_opt in ${_ctp_formats}; do
  _ctp_val="$(tmux show -gqv "${_ctp_opt}")"
  [ -n "${_ctp_val}" ] &&
    tmux set -g "${_ctp_opt}" \
      "$(printf '%s' "${_ctp_val}" | sed -E 's/##([0-9a-fA-F]{6})/#\1/g; s/#([0-9a-fA-F]{6})/##\1/g')"
done

unset _ctp_formats _ctp_module _ctp_opt _ctp_val
