#!/bin/bash

load_modules() {
  local loaded_modules

  local modules_path=$1
  local modules_list=$2

  local modules_array
  read -a modules_array <<< "$modules_list"

  local module_name
  for module_name in ${modules_array[@]}
  do
    local module_path=$modules_path/$module_name.sh
    source $module_path

    if [[ 0 -eq $? ]]
    then
      loaded_modules=$loaded_modules$( show_$module_name )
    fi

  done

  echo $loaded_modules
}

module_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"/modules
module_list="user host date_time"
echo $( load_modules "$module_path" "$module_list" )
