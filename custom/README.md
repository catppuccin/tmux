# User defined modules

## Description 

This folder is used to store user defined modules.
You can use this folder to add a new module or override any existing module.
To override an existing module, make sure you use the same name for your module as the module you want to override.
You can also override the window module for current and default window.

## Create a new module

Use the [Module template](#module-template) (or example.sh) as a starting point when creating a new module.
Save the new module under this folder using the module name as the file name and .sh as the extension.
Update the status module list with your module.
```sh
set -g @catppuccin_status_modules "... <module_name> ..."

```

## Module template
```sh
show_<module_name>() { # save this module in a file with the name <module_name>.sh
  local index=$1 # this variable is used by the module loader in order to know the position of this module 
  local icon="$(get_tmux_option "@catppuccin_<module_name>_icon" "<Use an icon from [nerdfonts](https://www.nerdfonts.com/cheat-sheet)>")"
  local color="$(get_tmux_option "@catppuccin_<module_name>_color" "<Use one of the default theme colors (ex: $thm_orange), or provide a color code (ex: #ef9f76)>")"
  local text="$(get_tmux_option "@catppuccin_<module_name>_text" "<Provide the text that you want to be displayed>")"

  local module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}
```

## Configure custom modules path

You can configure a custom path for your modules by setting the `@catppuccin_custom_plugin_dir` option.
```sh 
set -g @catppuccin_custom_plugin_dir "<path>"
```

To use the output of a command, use e.g. `local text="$(get_tmux_option "@catppuccin_test_text" "#(date +%T)")"`.

To use the output of a script, use e.g. `local text="$(get_tmux_option "@catppuccin_test_text" "#($HOME/my_script.sh)")"`.
