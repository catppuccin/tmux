### Customizing modules

Every module (except the module "session") supports the following overrides:

#### Override the specific module icon

```sh
set -g @catppuccin_[module_name]_icon "icon"
```

#### Override the specific module color

```sh
set -g @catppuccin_[module_name]_color "color"
```

#### Override the specific module text

```sh
set -g @catppuccin_[module_name]_text "text"
```

#### Removing a specific module option

```sh
set -g @catppuccin_[module_name]_[option] "null"
```

This is for the situation where you want to remove the icon from a module.
Ex:

```sh
set -g @catppuccin_date_time_icon "null"
```

### Notes for TPM users

Make sure you load the catppuccin theme prior to setting the status-left and/or status-left options. This ensures the catppuccin options (such as colors and status modules) are defined so they can then be used.
<br><br>
After status-left and/or status-left have been set, make sure to run TPM to load the modules. This runs any plugins that may replace text in the status line.

```bash
# load catppuccin theme ...
run '~/.config/tmux/plugins/tmux/catppuccin.tmux' # or where this file is located on your machine

# ... and then set status-left & status-right ...
set -g status-left "#{E:@catppuccin_status_session}"

set -g status-right "#{E:@catppuccin_status_[module_name]}"
set -ag status-right "#{E:@catppuccin_status_[module_name]}"
set -agF status-right "#{E:@catppuccin_status_[module_name]}"

# ... and finally start TPM
run '~/.tmux/plugins/tpm/tpm'

set -g @plugin 'catppuccin/tmux#v1.0.1' # See https://github.com/catppuccin/tmux/tags for additional tags
set -g @plugin 'tmux-plugins/tpm'
```

### Battery module

#### Requirements

This module depends on [tmux-battery](https://github.com/tmux-plugins/tmux-battery/tree/master).

#### Install

The preferred way to install tmux-battery is using [TPM](https://github.com/tmux-plugins/tpm).

#### Configure

Load tmux-battery after you load catppuccin.

```sh
set -g @plugin 'catppuccin/tmux'
...
set -g @plugin 'tmux-plugins/tmux-battery'
```

Add the battery module to the status modules list.

```sh
set -ag status-right "... #{E:@catppuccin_status_battery} ..."
```

### CPU module

#### Requirements

This module depends on [tmux-cpu](https://github.com/tmux-plugins/tmux-cpu/tree/master).

#### Install

The preferred way to install tmux-cpu is using [TPM](https://github.com/tmux-plugins/tpm).

#### Configure

Load tmux-cpu after you load catppuccin.

```sh
set -g @plugin 'catppuccin/tmux'
...
set -g @plugin 'tmux-plugins/tmux-cpu'
```

Add the cpu module to the status modules list.

```sh
set -agF status-right "... #{E:@catppuccin_status_cpu} ..."
```

### Weather modules

#### tmux-weather

##### Requirements

This module depends on [tmux-weather](https://github.com/xamut/tmux-weather).

##### Install

The preferred way to install tmux-weather is using [TPM](https://github.com/tmux-plugins/tpm).

##### Configure

Load tmux-weather after you load catppuccin.

```sh
set -g @plugin 'catppuccin/tmux'
...
set -g @plugin 'xamut/tmux-weather'
```

Add the weather module to the status modules list:

```sh
set -agF status-right "... #{E:@catppuccin_status_weather} ..."
```

#### tmux-clima

##### Requirements

This module depends on [tmux-clima](https://github.com/vascomfnunes/tmux-clima).

##### Install

The preferred way to install tmux-clima is using [TPM](https://github.com/tmux-plugins/tpm).

##### Configure

Load tmux-clima after you load catppuccin.

```sh
set -g @plugin 'catppuccin/tmux'
...
set -g @plugin 'vascomfnunes/tmux-clima'
```

Add the weather module to the status modules list.

```sh
set -agF status-right "... #{E:@catppuccin_status_clima} ..."
```

### Load module

#### Requirements

This module depends on [tmux-loadavg](https://github.com/jamesoff/tmux-loadavg).

#### Install

The preferred way to install tmux-loadavg is using [TPM](https://github.com/tmux-plugins/tpm).

#### Configure

Load tmux-loadavg after you load catppuccin.

```sh
set -g @plugin 'catppuccin/tmux'
...
set -g @plugin 'jamesoff/tmux-loadavg'
```

Add the load module to the status modules list.

```sh
set -agF status-right "... #{E:@catppuccin_status_load} ..."
```

### Gitmux module

#### Requirements

This module depends on [gitmux](https://github.com/arl/gitmux).

#### Install

To install gitmux, follow the instructions in the [gitmux documentation](https://github.com/arl/gitmux/blob/main/README.md#installing).

#### Configure

Add the gitmux module to the status modules list.

```sh
set -agF status-right "... #{E:@catppuccin_status_gitmux} ..."
```

To customize the gitmux module, you can follow the instrucctions in the [gitmux documentation](https://github.com/arl/gitmux/blob/main/README.md#customizing) and add this line in your tmux configuration:

```sh
set -g @catppuccin_gitmux_text "#(gitmux -cfg $HOME/.gitmux.conf \"#{pane_current_path}\")"
```

### Pomodoro module

#### Requirements

This module depends on [tmux-pomodoro-plus](https://github.com/olimorris/tmux-pomodoro-plus/tree/main).

#### Install

The preferred way to install tmux-pomodoro-plus is using [TPM](https://github.com/tmux-plugins/tpm).

#### Configure

Load tmux-pomodoro-plus after you load catppuccin.

```sh
set -g @plugin 'catppuccin/tmux'
...
set -g @plugin 'olimorris/tmux-pomodoro-plus'
```

Add the pomodoro module to the status modules list.

```sh
set -agF status-right "... #{E:@catppuccin_status_pomodoro_plus} ..."
```

### Kube module

#### Requirements

This module depends on [kube-tmux](https://github.com/jonmosco/kube-tmux).

#### Install

The preferred way to install kube-tmux is using [TPM](https://github.com/tmux-plugins/tpm).

#### Configure

```sh
set -g @plugin 'catppuccin/tmux'
...
set -g @plugin 'jonmosco/kube-tmux'
```

Add the tmux module to the status modules list.

```sh
set -agF status-right "... #{E:@catppuccin_status_kube} ..."
```

Optionally override the kube-tmux colors

```sh
set -g @catppuccin_kube_context_color "#{@thm_red}"
set -g @catppuccin_kube_namespace_color "#{@thm_sky}"
```

## Create a custom module

It is possible to use the options set by the plugin to create your own modules.

For further details, see the documentation in [custom/README.md](../custom/README.md)
