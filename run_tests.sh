#!/usr/bin/env bash

set -Eeuo pipefail

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

TEST_ARRAY=(
  "application_module"
  "battery_module"
  "cpu_module"
  "default_options"
  "mem_cpu_module"
  "pane_styling"
)

for str in ${TEST_ARRAY[@]}; do
  "${script_dir}"/tests/harness.sh --test "${script_dir}"/tests/${str}.sh --expected "${script_dir}"/tests/${str}_expected.txt "$@"
done
