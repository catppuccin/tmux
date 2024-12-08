# User Defined Status Line Modules

To create your own status line module that uses the catppuccin theme,
all you need to do is add it to the `status-left` or `status-right` options.

You can add arbitrary things to the status line like so:

```sh
# ~/.tmux.conf

set -agF status-right "#[fg=#{@thm_crust},bg=#{@thm_teal}] ##H "
```

This will append the current hostname (`#H`) to the status line with a teal
background and dark black text.

You can also use icons for styling, for example to show the used memory percentage
on MacOS:

```sh  
set -g status-right "#[bg=#{@thm_flamingo},fg=#{@thm_crust}]#[reverse]#[noreverse]󱀙  "
set -ag status-right "#[fg=#{@thm_fg},bg=#{@thm_mantle}] #(memory_pressure | awk '/percentage/{print $5}') "
```

![Example of the custom ram module](../../assets/ram-example.webp)

To use the status module formatting that catppuccin uses, create a directory that contains the custom status modules.  Then point `@catppuccin_user_status_directory` at that directory:

```sh
# In ~/.tmux.conf, before loading the catppuccin plugin
set -gF @catppuccin_user_status_directory   "~/.config/tmux/custom"

# Apply your custom module in status-right
set -g status-right "#{E:@catpuccin_status_application}#{E:@catppuccin_status_my_custom_module}"
```

Then in the `~/.config/tmux/custom` directory, you can create custom status modules (which must have `.conf` file extension) like this:

```sh
# my_custom.conf

%hidden MODULE_NAME="my_custom_module"

set -ogq  "@catppuccin_${MODULE_NAME}_icon"  " "
set -ogqF "@catppuccin_${MODULE_NAME}_color" "#{E:@thm_pink}"
set -ogq  "@catppuccin_${MODULE_NAME}_text"  "#{pane_current_command}"

source -F "#{@catppuccin_tmux_directory}/utils/status_module.conf"

```

More than one custom status module can be defined.  A practical use-case is to have both CPU and RAM usage such as:
```sh
# In ~/.tmux.conf, before loading the catppuccin plugin
set -gF @catppuccin_user_status_directory   "~/.config/tmux/custom"

# Apply your custom module in status-right
set -g status-right "#{E:@catpuccin_status_application}#{E:@catppuccin_status_cpu}#{E:@catppuccin_status_ram}"
```

Then create `~/.config/tmux/custom/ram.conf`:

```sh
%hidden MODULE_NAME="ram"

set -ogq @ram_low_fg_color    "#{E:@thm_fg}"
set -ogq @ram_medium_fg_color "#{E:@thm_fg}"
set -ogq @ram_high_fg_color   "#{E:@thm_crust}"

set -ogq @ram_low_bg_color    "#{E:@catppuccin_status_module_text_bg}"
set -ogq @ram_medium_bg_color "#{E:@catppuccin_status_module_text_bg}"
set -ogq @ram_high_bg_color   "#{E:@thm_red}"

set -ogq  "@catppuccin_${MODULE_NAME}_icon"           "#{l:#{ram_icon}} "
set -ogqF "@catppuccin_${MODULE_NAME}_color"          "#{E:@thm_blue}"
set -ogq  "@catppuccin_status_${MODULE_NAME}_text_fg" "#{l:#{ram_fg_color}}"
set -ogq  "@catppuccin_status_${MODULE_NAME}_text_bg" "#{l:#{ram_bg_color}}"
set -ogq  "@catppuccin_${MODULE_NAME}_text"           " #{l:#{ram_percentage}}"

source -F "#{@catppuccin_tmux_directory}/utils/status_module.conf"
```
