# User Defined Status Line Modules

To create your own status line module that uses the catppuccin theme, all you need to do is add it to the `status-left` or `status-right` options.

You can add arbitrary things to the status line like so:

```sh
# ~/.tmux.conf

set -agF status-right "#[fg=#{@thm_crust},bg=#{@thm_teal}] ##H "
```

This will append the current hostname (`#H`) to the status line with a teal background and dark black text.

To use the status module formatting that catppuccin uses, do the following:

```sh
# In ~/.tmux.conf, after the catppuccin plugin has been loaded.

%hidden MODULE_NAME="my_custom_module"

set -ogq "@catppuccin_${MODULE_NAME}_icon" " "
set -ogqF "@catppuccin_${MODULE_NAME}_color" "#{E:@thm_pink}"
set -ogq "@catppuccin_${MODULE_NAME}_text" "#{pane_current_command}"

source "<path to catppuccin plugin>/utils/status_module.conf"

set -g status-right "#{E:@catpuccin_status_application}#{E:@catppuccin_status_my_custom_module}"
```
