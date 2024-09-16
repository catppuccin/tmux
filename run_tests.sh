#!/usr/bin/env bash

set -Eeuo pipefail

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

"${script_dir}"/tests/harness.sh --test "${script_dir}"/tests/default_options.sh --expected "${script_dir}"/tests/default_options_expected.txt "$@"

"${script_dir}"/tests/harness.sh --test "${script_dir}"/tests/application_module.sh --expected "${script_dir}"/tests/application_module_expected.txt "$@"
"${script_dir}"/tests/harness.sh --test "${script_dir}"/tests/battery_module.sh --expected /dev/null "$@"
"${script_dir}"/tests/harness.sh --test "${script_dir}"/tests/cpu_module.sh --expected /dev/null "$@"
