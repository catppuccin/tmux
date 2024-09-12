#!/usr/bin/env bash

set -Eeuo pipefail

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

"${script_dir}"/tests/harness.sh --test "${script_dir}"/tests/default_options.sh --expected "${script_dir}"/tests/default_options_expected.txt "$@"
