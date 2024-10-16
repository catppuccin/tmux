### Customizing modules

Every module supports the following overrides:

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
set -g @catppuccin_[module_name]_[option] ""
```

This is for the situation where you want to remove the icon from a module.
For example:

```sh
set -g @catppuccin_date_time_icon ""
```

### Notes for TPM users

Make sure you load the catppuccin theme prior to setting the status-left and/or
status-left options. This ensures the catppuccin options (such as colors and
status modules) are defined so they can then be used.

After status-left and/or status-left have been set, make sure to run TPM to load
the modules. This runs any plugins that may replace text in the status line.

```bash
# load catppuccin theme ...
run '~/.config/tmux/plugins/tmux/catppuccin.tmux' # or where this file is located on your machine

# ... and then set status-left & status-right ...
set -g status-left "#{E:@catppuccin_status_session}"

set -g status-right "#{E:@catppuccin_status_[module_name]}"
set -ag status-right "#{E:@catppuccin_status_[module_name]}"
set -agF status-right "#{E:@catppuccin_status_[module_name]}"

# ... and finally start TPM
set -g @plugin 'tmux-plugins/tpm'
run '~/.tmux/plugins/tpm/tpm'
```

### Battery module

**Requirements:** This module depends on [tmux-battery](https://github.com/tmux-plugins/tmux-battery/tree/master).

**Install:** The preferred way to install tmux-battery is using [TPM](https://github.com/tmux-plugins/tpm).

**Configure:**

```sh
run ~/.config/tmux/plugins/catppuccin/tmux/catppuccin.tmux

set -agF status-right "#{E:@catppuccin_status_battery}"

set -g @plugin 'tmux-plugins/tmux-battery'
run '~/.tmux/plugins/tpm/tpm'
```

### CPU module

**Requirements:** This module depends on [tmux-cpu](https://github.com/tmux-plugins/tmux-cpu/tree/master).

**Install:** The preferred way to install tmux-cpu is using [TPM](https://github.com/tmux-plugins/tpm).

**Configure:**

```sh
run ~/.config/tmux/plugins/catppuccin/tmux/catppuccin.tmux

set -agF status-right "#{E:@catppuccin_status_cpu}"

set -g @plugin 'tmux-plugins/tmux-cpu'
run '~/.tmux/plugins/tpm/tpm'
```

### Weather modules

#### tmux-weather

**Requirements:** This module depends on [tmux-weather](https://github.com/xamut/tmux-weather).

**Install:** The preferred way to install tmux-weather is using [TPM](https://github.com/tmux-plugins/tpm).

**Configure:**

```sh
run ~/.config/tmux/plugins/catppuccin/tmux/catppuccin.tmux

set -agF status-right "#{E:@catppuccin_status_weather}"

set -g @plugin 'xamut/tmux-weather'
run '~/.tmux/plugins/tpm/tpm'
```

#### tmux-clima

**Requirements:** This module depends on [tmux-clima](https://github.com/vascomfnunes/tmux-clima).

**Install:** The preferred way to install tmux-clima is using [TPM](https://github.com/tmux-plugins/tpm).

**Configure:**

```sh
run ~/.config/tmux/plugins/catppuccin/tmux/catppuccin.tmux

set -agF status-right "#{E:@catppuccin_status_clima}"

set -g @plugin 'vascomfnunes/tmux-clima'
run '~/.tmux/plugins/tpm/tpm'
```

### Load module

**Requirements:** This module depends on [tmux-loadavg](https://github.com/jamesoff/tmux-loadavg).

**Install:** The preferred way to install tmux-loadavg is using [TPM](https://github.com/tmux-plugins/tpm).

**Configure:**

```sh
run ~/.config/tmux/plugins/catppuccin/tmux/catppuccin.tmux

set -agF status-right "#{E:@catppuccin_status_load}"

set -g @plugin 'jamesoff/tmux-loadavg'
run '~/.tmux/plugins/tpm/tpm'
```

### Gitmux module

**Requirements:** This module depends on [gitmux](https://github.com/arl/gitmux).

**Install:** To install gitmux, follow the instructions in the [gitmux documentation](https://github.com/arl/gitmux/blob/main/README.md#installing).

**Configure:**

Add the gitmux module to the status modules list.

```sh
run ~/.config/tmux/plugins/catppuccin/tmux/catppuccin.tmux

set -agF status-right "#{@catppuccin_status_gitmux}"
```

To customize the gitmux module, you can follow the instrucctions in the [gitmux documentation](https://github.com/arl/gitmux/blob/main/README.md#customizing).

### Pomodoro module

**Requirements:**: This module depends on [tmux-pomodoro-plus](https://github.com/olimorris/tmux-pomodoro-plus/tree/main).

**Install:**: The preferred way to install tmux-pomodoro-plus is using [TPM](https://github.com/tmux-plugins/tpm).

**Configure:**

```sh
run ~/.config/tmux/plugins/catppuccin/tmux/catppuccin.tmux

set -agF status-right "#{E:@catppuccin_status_pomodoro_plus}"

set -g @plugin 'olimorris/tmux-pomodoro-plus'
run '~/.tmux/plugins/tpm/tpm'
```

### Kube module

**Requirements:** This module depends on [kube-tmux](https://github.com/jonmosco/kube-tmux).

**Install:** The preferred way to install kube-tmux is using [TPM](https://github.com/tmux-plugins/tpm).

**Configure:**

```sh
set -g @catppuccin_kube_context_color "#{@thm_red}"
set -g @catppuccin_kube_namespace_color "#{@thm_sky}"

run ~/.config/tmux/plugins/catppuccin/tmux/catppuccin.tmux

set -agF status-right "#{E:@catppuccin_status_kube}"

set -g @plugin 'jonmosco/kube-tmux'
run '~/.tmux/plugins/tpm/tpm'
```