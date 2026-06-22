#!/usr/bin/env bash

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)
# shellcheck disable=SC1091
source "${script_dir}/helpers.sh"

# Load via the plugin entrypoint so the render-safe hex escaping is applied.
tmux run-shell "${script_dir}/../catppuccin.tmux"

print_option E:@catppuccin_status_load
