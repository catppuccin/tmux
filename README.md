<h3 align="center">
 <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/logos/exports/1544x1544_circle.png" width="100" alt="Logo"/><br/>
 <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/misc/transparent.png" height="30" width="0px"/>
 Catppuccin for <a href="https://github.com/tmux/tmux">Tmux</a>
 <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/misc/transparent.png" height="30" width="0px"/>
</h3>

<p align="center">
    <a href="https://github.com/catppuccin/tmux/stargazers"><img src="https://img.shields.io/github/stars/catppuccin/tmux?colorA=363a4f&colorB=b7bdf8&style=for-the-badge"></a>
    <a href="https://github.com/catppuccin/tmux/issues"><img src="https://img.shields.io/github/issues/catppuccin/tmux?colorA=363a4f&colorB=f5a97f&style=for-the-badge"></a>
    <a href="https://github.com/catppuccin/tmux/contributors"><img src="https://img.shields.io/github/contributors/catppuccin/tmux?colorA=363a4f&colorB=a6da95&style=for-the-badge"></a>
</p>

<p align="center">
  <img src="./assets/preview.webp"/>
</p>

## Content

1. [Themes](#themes)
1. [Installation](#installation)
1. [Overview](#overview)
1. [Configuration options](#configuration-options)
   1. [Window](#window)
   1. [Pane](#pane)
   1. [Status Line](#status-line)
   1. [Using the theme's built-in status modules](#using-the-themes-built-in-status-modules)
1. [Configuration Examples](#configuration-examples)
   1. [Config 1](#config-1)
   1. [Config 2](#config-2)
   1. [Config 3](#config-3)

## Themes

- 🌻 [Latte](./themes/catppuccin_latte_tmux.conf)
- 🪴 [Frappé](./themes/catppuccin_frappe_tmux.conf)
- 🌺 [Macchiato](./themes/catppuccin_macchiato_tmux.conf)
- 🌿 [Mocha](./themes/catppuccin_mocha_tmux.conf)

## Installation

> [!IMPORTANT]
> The plugin was re-written from bash to use tmux's native configuration
> language. This occurred after `v0.3.0`. Old configurations will
> need to be updated. Please consider if the upgrade is worth the tradeoff.

In order to have the icons displayed correctly please use/update your favorite [patched font](https://www.nerdfonts.com/font-downloads).
If you do not have a patched font installed, you can override or remove any icon. Check the documentation below on the options available.

> [!NOTE]
> If you are using a tmux version older than 3.0, you
> will need to follow the instructions for [older versions](#for-tmux-versions-prior-to-32).

### Manual (Recommended)

This method is recommended as TPM has some issues with name conflicts.

1. Clone this repository to your desired location (e.g.
   `~/.config/tmux/plugins/catppuccin`).

```bash
mkdir -p ~/.config/tmux/plugins/catppuccin
git clone https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux
```

2. Add the following line to your `tmux.conf` file:
   `run ~/.config/tmux/plugins/catppuccin/tmux/catppuccin.tmux`
3. (Optional) Set your preferred flavor and/or add configuration options as
   listed in [Configuration Options](#configuration-options). These options must be added above the `run ~/.config...` line.
4. Reload Tmux by either restarting or reloading with `tmux source ~/.tmux.conf`

> [!IMPORTANT]
> You may have to run `~/.config/tmux/plugins/tpm/bin/clean_plugins` if upgrading from an earlier version
> (especially from `v0.3.0`).

### TPM

1. Install [TPM](https://github.com/tmux-plugins/tpm)
2. Add the Catppuccin plugin:

<!-- x-release-please-start-version -->

```bash
set -g @plugin 'catppuccin/tmux#v1.0.2' # See https://github.com/catppuccin/tmux/tags for additional tags
# ...alongside
set -g @plugin 'tmux-plugins/tpm'
```

<!-- x-release-please-end -->

3. (Optional) Set your preferred flavor, it defaults to `"mocha"`:

```bash
set -g @catppuccin_flavor 'mocha' # latte, frappe, macchiato or mocha
```

### For TMUX versions prior to 3.2

This plugin uses features that were only introduced into tmux in version 3.2.
If you are using a version earlier than this, you can still have lovely catppuccin colors,
the installation method just looks a little different.

```sh
# In your ~/.tmux.conf

# Add the colors from the pallete. Check the themes/ directory for all options.

# Some basic mocha colors.
set -g @ctp_bg "#24273a"
set -g @ctp_surface_1 "#494d64"
set -g @ctp_fg "#cad3f5"
set -g @ctp_mauve "#c6a0f6"
set -g @ctp_crust "#181926"

# status line
set -gF status-style "bg=#{@ctp_bg},fg=#{@ctp_fg}"

# windows
set -gF window-status-format "#[bg=#{@ctp_surface_1},fg=#{@ctp_fg}] ##I ##T "
set -gF window-status-current-format "#[bg=#{@ctp_mauve},fg=#{@ctp_crust}] ##I ##T "
```

### Upgrading from 0.3

Breaking changes have been introduced since 0.3, to understand how to migrate your configuration, see pinned issue [#291](https://github.com/catppuccin/tmux/issues/291).

## Recommended Default Configuration

This configuration shows some customisation options, that can be further extended as desired.

![Example configuration](./assets/example-config.webp)

```bash
# ~/.tmux.conf

# Options to make tmux more pleasant
set -g mouse on
set -g default-terminal "tmux-256color"

# Configure the catppuccin plugin
set -g @catppuccin_flavor "macchiato"
set -g @catppuccin_window_status_style "rounded"
# leave this unset to let applications set the window title
set -g @catppuccin_window_default_text " #W"
set -g @catppuccin_window_current_text " #W"
set -g @catppuccin_window_status "icon"
set -g @catppuccin_window_current_background "#{@thm_mauve}"

# Load catppuccin
run ~/.config/tmux/plugins/catppuccin/tmux/catppuccin.tmux
# For TPM, instead use `run ~/.config/tmux/plugins/tmux/catppuccin.tmux`

# Make the status line pretty and add some modules
set -g status-left ""
set -g status-right "#{E:@catppuccin_status_user}"
set -ag status-right "#{E:@catppuccin_status_directory}"
```

## Overview

![Default](./assets/overview.png)
This is a diagram of how the theme is split between its components.

## Configuration options

All flavors support certain levels of customization that match our [Catppuccin
Style Guide][style-guide]. To add these customizations, add any of the following
options to your Tmux configuration.

### Window

The plugin comes with three window styles built in, these can be customized by setting the `@catppuccin_window_status_style` option. The default is `basic`.

| Option    | Effect                                                                   | Preview                                               |
| --------- | ------------------------------------------------------------------------ | ----------------------------------------------------- |
| `basic`   | Simple styling with blocks.                                              | ![window basic](./assets/window-basic.webp)           |
| `rounded` | Each window is separated with rounded separators.                        | ![window rounded style](./assets/window-rounded.webp) |
| `slanted` | Each window is separated with slanted separators.                        | ![window slanted style](./assets/window-slanted.webp) |
| `custom`  | Custom separators are used. This is required to override the separators! |                                                       |
| `none`    | Styling of the window status is completely disabled.                     | ![window no styling](./assets/window-none.webp)       |

If you want to change the active color to something else (the default is peach), use the following. For example to use lavender:

```bash
set -g @catppuccin_window_current_background "#{@thm_lavender}"
```

<details>

<summary>Customising the separators</summary>

Add the following (above `set -g @plugin "catppuccin/tmux"` if using TPM), setting whatever values you'd like for the separators:

```bash
set -g @catppuccin_window_status_style "custom"
set -g @catppuccin_window_left_separator ""
set -g @catppuccin_window_middle_separator ""
set -g @catppuccin_window_right_separator ""
```

</details>

### Pane

#### Set the pane border style

```sh
set -g @catppuccin_pane_border_style "fg=#{@thm_surface_0}" # Use a value compatible with the standard tmux 'pane-border-style'
```

#### Set the pane active border style

```sh
set -g @catppuccin_pane_active_border_style "fg=#{@thm_peach}" # Use a value compatible with the standard tmux 'pane-border-active-style'
```

### Menu

**Set the menu selected style:**

```sh
set -g @catppuccin_menu_selected_style "fg=#{@thm_surface_0},bg=#{@thm_yellow}" # Use a value compatible with the standard tmux `menu-selected-style`
```

### Status Line

**Set the default status bar visibility:**

```sh
set -g @catppuccin_status_default "on"

```

**Override the default status background color:**

```sh
set -g @catppuccin_status_background "default"
```

This will overwrite the status bar background:

- `default` will use the color from the selected theme
- `none` will make the status bar transparent
- use hex color codes for other colors or a theme color (`#{@thm_<color>}`)

Note: you need to restart tmux for this to take effect:

```sh
tmux kill-server && tmux
```

**Set the status module left separator:**

```sh
set -g @catppuccin_status_left_separator ""
```

**Set the status module right separator:**

```sh
set -g @catppuccin_status_right_separator "█"
```

**Set the status connect separator:**

```sh
set -g @catppuccin_status_connect_separator "yes"
```

Possible values:

- yes - the background color of the separator will not blend in with the background color of tmux
- no - the background color of the separator will blend in with the background color of tmux

**Set the status module color fill:**

```sh
set -g @catppuccin_status_fill "icon"
```

Values:

- icon - only the icon of the module will have color
- all - the entire module will have the same color

**Set the status module justify value:**

```sh
set -g @catppuccin_status_justify "left"
```

Values:

- `left`
- `centre` - puts the window list in the relative centre of the available free space
- `right`
- `absolute-centre` - uses the centre of the entire horizontal space

### Pane Options

By default no pane styling options are set. To enable, set `@catppuccin_pane_status_enabled` to `yes`.

Defaults:

```sh
set -g @catppuccin_pane_status_enabled "no"
set -g @catppuccin_pane_border_status "off" # See `pane-border-status`
set -g @catppuccin_pane_left_separator "█"
set -g @catppuccin_pane_right_separator "█"
set -g @catppuccin_pane_middle_separator "█"
set -g @catppuccin_pane_number_position "left"
set -g @catppuccin_pane_default_fill "number"
set -g @catppuccin_pane_default_text "#{b:pane_current_path}"
set -g @catppuccin_pane_border_style "fg=#{@thm_overlay_0}"
set -g @catppuccin_pane_active_border_style "#{?pane_in_mode,fg=#{@thm_lavender},#{?pane_synchronized,fg=#{@thm_magenta},fg=#{@thm_lavender}}}"
set -g @catppuccin_pane_color "#{@thm_green}"
set -g @catppuccin_pane_background_color "#{@thm_surface_0}"
```

### Using the theme's built-in status modules

To use the theme's built in status modules, set the `status-left` and `status-right` tmux options _after_ the plugin has been loaded.

The tmux status line modules are set as variables and prefixed with `@catppuccin_status_<module>`.

To use the `application` and `session` modules on the right and have nothing on the left:

```sh
set -g status-right "#{E:@catppuccin_status_application}#{E:@catppuccin_status_session}"
set -g status-left ""
```

Available modules:

- `application` - display the current window running application
- `directory` - display the basename of the current window path
- `session` - display the number of tmux sessions running
- `user` - display the username
- `host` - display the hostname
- `date_time` - display the date and time
- `uptime` - display the uptime
- `battery` - display the battery

For a full list of modules and their options see [status](./status/README.md).

## Configuration Examples

Below are provided a few configurations as examples or starting points.

Note:
When switching between configurations run:

```sh
tmux kill-server
```

To kill the tmux server and clear all global variables.

### Config 1

![Default](./assets/config1.png)

```sh
# Disable catppuccin styling windows.
set -g @catppuccin_window_status_style "none"
set -g @catppuccin_status_left_separator "█"
set -g @catppuccin_status_right_separator "█"

set -g @catppuccin_date_time_text "%Y-%m-%d %H:%M:%S"

# Run catppuccin plugin manually or through tpm
# ...

# Style the windows. See https://man7.org/linux/man-pages/man1/tmux.1.html#STYLES for more details.
set -gF window-status-style "bg=#{@thm_surface_1},fg=#{@thm_fg}"
set -gF window-status-current-style "bg=#{@thm_peach},fg=#{@thm_crust}"

set -g window-status-format " #T | #I "
set -g window-status-current-format " #T | #I "

set -g status-left ""
set -g  status-right "#{E:@catppuccin_status_application}"
set -ag status-right "#{E:@catppuccin_status_session}"
set -ag status-right "#{E:@catppuccin_status_user}"
set -ag status-right "#{E:@catppuccin_status_host}"
set -ag status-right "#{E:@catppuccin_status_date_time}"
```

### Config 2

![Default](./assets/config2.png)

```sh
set -g @catppuccin_window_status_style "slanted"
set -g @catppuccin_window_number_position "right"

set -g @catppuccin_window_default_fill "number"

set -g @catppuccin_window_current_fill "number"
set -g @catppuccin_window_current_text "#{pane_current_path}"

set -g @catppuccin_status_left_separator  ""
set -g @catppuccin_status_right_separator " "
set -g @catppuccin_status_fill "all"
set -g @catppuccin_status_connect_separator "yes"

# Run catppuccin plugin manually or through tpm
# ...

set -g status-left ""
set -gF status-right "#{E:@catppuccin_status_application}#{E:@catppuccin_status_session}#{E:@catppuccin_status_date_time}"
```

### Config 3

![Default](./assets/config3.png)

```sh
set -g @catppuccin_window_status_style "rounded"
set -g @catppuccin_window_number_position "right"

set -g @catppuccin_window_default_fill "number"
set -g @catppuccin_window_default_text "#W"

set -g @catppuccin_window_current_fill "number"
set -g @catppuccin_window_current_text "#W"

set -g @catppuccin_status_left_separator  " "
set -g @catppuccin_status_right_separator ""
set -g @catppuccin_status_fill "icon"
set -g @catppuccin_status_connect_separator "no"

set -g @catppuccin_directory_text "#{pane_current_path}"

# Run catppuccin plugin manually or through tpm
# ...

set -g status-left ""
set -g  status-right "#{E:@catppuccin_status_directory}"
set -ag status-right "#{E:@catppuccin_status_user}"
set -ag status-right "#{E:@catppuccin_status_host}"
set -ag status-right "#{E:@catppuccin_status_session}"
```

[style-guide]: https://github.com/catppuccin/catppuccin/blob/main/docs/style-guide.md

## 💝 Thanks to

- [Pocco81](https://github.com/Pocco81)
- [vinnyA3](https://github.com/vinnyA3)
- [rogeruiz](https://github.com/rogeruiz)

&nbsp;

<p align="center"><img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/footers/gray0_ctp_on_line.svg?sanitize=true" /></p>
<p align="center">Copyright &copy; 2021-present <a href="https://github.com/catppuccin" target="_blank">Catppuccin Org</a>
<p align="center"><a href="https://github.com/catppuccin/catppuccin/blob/main/LICENSE"><img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&logoColor=d9e0ee&colorA=363a4f&colorB=b7bdf8"/></a></p>
