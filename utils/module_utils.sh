#!/bin/sh

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
    IN="${IN#"$iter "}"
    # Print (or doing anything with) the first "element".

    module_name=$iter

    for module_dir in "${module_directories[@]}" ; do
      module_path="$module_dir/$module_name.sh"

      if [ -r "$module_path" ]; then
        # shellcheck source=/dev/null
        source "$module_path"
        loaded_modules="$loaded_modules$( "show_$module_name" "$module_index" )"
        module_index+=1
        break
      fi
    done
  done

  echo "$loaded_modules"
}
