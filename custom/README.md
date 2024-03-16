# User defined modules

## Description

This folder is used to store user defined modules.
You can use this folder to add a new module or override any existing module.
To override an existing module, make sure that you use the same name for your module as the module you want to override.
You can also override the window module for the current and default window.

## Create a new module

You can create a custom module by following these steps.
Note that changes will only take effect after reloading your Tmux configuration by executing `tmux source-file ~/.tmux.conf`.

### New file

Create a new file in `~/.tmux/plugins/tmux/custom/<module_name>.sh`, to store the custom module. The extension has to be `.sh`. Making this file executable is not necessary.

### File content

Copy the following template to that file. Make sure to replace every instance of `<module_name>` by the name you chose as filename.

```sh
show_<module_name>() { # This function name must match the module name!
  local index icon color text module

  index=$1 # This variable is used internally by the module loader in order to know the position of this module 
  icon="$(  get_tmux_option "@catppuccin_<module_name>_icon"  ""           )"
  color="$( get_tmux_option "@catppuccin_<module_name>_color" "$thm_orange" )"
  text="$(  get_tmux_option "@catppuccin_<module_name>_text"  "hello world" )"

  module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}
```

### Status module list

Add the custom module to the list of modules in `.tmux.conf`

```tmux
set -g @catppuccin_status_modules_right "... <module_name> ..."
```

### Customization

Change the icon to one from [Nerd Fonts](https://www.nerdfonts.com/cheat-sheet).
Change the color to one of the [official colors](https://github.com/catppuccin/tmux/blob/main/catppuccin-macchiato.tmuxtheme), for instance `"$thm_orange"`, or to a hexadecimal color like `"#00ff00"`.

The text to display can either be:

- A static text, e.g. `"hello world"`.
- The output of a command, e.g. `"#( date +%T )"`.
- The output of a script, e.g. `"#( $HOME/my_script.sh )"` . Any script will do, e.g. a Bash or Python script that prints some text, but ensure that it is executable `chmod u+x my_script.sh`.
- An existing Tmux plugin, e.g. `" #{forecast} "` for the [Tmux Weather plugin](https://github.com/aaronpowell/tmux-weather).

Note that the icon and the color can be generated dynamically as well, by having a Bash script e.g. `echo` a hexadecimal color.

To modify how often the modules are updated, add the following to `.tmux.conf`:

```tmux
set -g status-interval <number of seconds>
```

To configure a custom path for your modules, set this option:

```tmux
set -g @catppuccin_custom_plugin_dir "<path>"
```
