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
2. [Installation](#installation)
3. [Status line themes](#status-line-themes)
   1. [Default](#default)
   2. [Pill](#pill-shape)
   3. [Powerline](#powerline)
   4. [Powerline with icons](#powerline-with-icons)
   5. [No patched fonts](#no-patched-fonts)
4. [Configuration options](#configuration-options)
   1. [Enable window tabs](#enable-window-tabs)
   2. [Configure separators](#configure-separator)
   3. [Enable date and time](#enable-datetime)
   4. [Enable user](#enable-user)
   5. [Enable host](#enable-host)
   6. [Customize icons](#customize-icons)

## Themes

- 🌻 [Latte](./catppuccin-latte.tmuxtheme)
- 🪴 [Frappé](./catppuccin-frappe.tmuxtheme)
- 🌺 [Macchiato](./catppuccin-macchiato.tmuxtheme)
- 🌿 [Mocha](./catppuccin-mocha.tmuxtheme)

## Installation

In order to have the icons displayed correctly please use / update your favorite patched font or overwrite the defaults - refer to [Customize icons](#customize-icons) section.
If you do not have patched font installed, you can use the [No patched fonts](#no-patched-fonts) status line theme.

### TPM

1. Install [TPM](https://github.com/tmux-plugins/tpm)
2. Add the Catppuccin plugin:

```bash
set -g @plugin 'catppuccin/tmux'
# ...alongside
set -g @plugin 'tmux-plugins/tpm'
```

3. (Optional) Set your preferred flavour, it defaults to `"mocha"`:

```bash
set -g @catppuccin_flavour 'latte' # or frappe, macchiato, mocha
```

### Manual

1. Copy your desired theme's configuration contents into your Tmux config (usually stored at `~/.tmux.conf`)
2. Reload Tmux by either restarting the session or reloading it with `tmux source-file ~/.tmux.conf`

## Overview
![Default](./assets/overview.png)

This is a diagram on how the theme is split between it's components.

## Configuration options

All flavours support certain levels of customization that match our [Catppuccin
Style Guide][style-guide]. To add these customizations, add any of the following
options to your Tmux configuration.

### Window

#### Set the window left separator:
```sh
set -g @catppuccin_window_left_separator "█"
```

#### Set the window middle separator:
```sh
set -g @catppuccin_window_middle_separator "█"
```

#### Set the window right separator:
```sh
set -g @catppuccin_window_right_separator "█"
```

#### Set the color fill:
```sh
set -g @catppuccin_window_color_fill "number"
```
Values:
- number - only the number of the window part will have color
- all - the entire window part will have the same color

#### Position the number:
```sh
set -g @catppuccin_window_icon_position "left"
```
Values:
- left - the number will be on the left part of the window
- right - the number will be on the right part of the window

#### Set the window style format
```sh
set -g @catppuccin_window_format_style "directory"
```
Values:
- directory - will display the basename of the window path
- application - will display the running application of the window

#### Set the current directory format
```sh
set -g @catppuccin_window_current_format_directory_text "#{b:pane_current_path}"
```
Use this to overide the way the current directory is displayed.

#### Set the directory format
```sh
set -g @catppuccin_window_format_directory_text "#{b:pane_current_path}"
```
Use this to overide the way the directory is displayed.

### Status

#### Set the status module left separator:
```sh
set -g @catppuccin_status_left_separator ""
```

#### Set the status module right separator:
```sh
set -g @catppuccin_status_right_separator "█"
```

#### Set the status module right separator inverse:
```sh
set -g @catppuccin_status_right_separator_inverse "no"
```
Values:
- yes - the colors will be inverted for the right separator
- no - the colors will not be inverted for the right separator

#### Set the status connect separator:
```sh
set -g @catppuccin_status_connect_separator "yes"
```
Values:
- yes - the background color of the separator will not blend in with the brackground color of tmux
- no - the background color of the separator will blend in with the brackground color of tmux

#### Set the status module color fill:
```sh
set -g @catppuccin_status_color_fill "icon"
```
Values:
- icon - only the icon of the module will have color
- all - the entire module will have the same color

#### Set the module list
```sh
set -g @catppuccin_status_modules" "application session"
```
Provide a list of modules and the order in which you want them to appear in the status. 

Available modules:
- application - display the current window running application
- directory - display the basename of the current window path
- session - display the number of tmux sessions running
- user - display the username
- host - display the hostname
- date_time - display the date and time

### Customizing modules

Every module (except the module "session") supports the following overrides:

#### Override the specific module icon
```sh
set -g @catppuccin_[module_name]_icon" "icon"
```

#### Override the specific module color
```sh
set -g @catppuccin_[module_name]_color" "color"
```

#### Override the specific module text
```sh
set -g @catppuccin_[module_name]_text" "text"
```

## Configuration Recipes

### Config 1
![Default](./assets/config1.png)

```sh
set -g @catppuccin_window_right_separator "█ "
set -g @catppuccin_window_icon_position "right"
set -g @catppuccin_window_middle_separator " | "
set -g @catppuccin_window_color_fill "all"

set -g @catppuccin_status_modules "application session user host date_time"
set -g @catppuccin_status_left_separator  "█"

set -g @catppuccin_date_time_text "%Y-%m-%d %H:%M:%S"
```

### Config 2
![Default](./assets/config2.png)

```sh
set -g @catppuccin_window_left_separator "█"
set -g @catppuccin_window_right_separator "█ "
set -g @catppuccin_window_icon_position "right"
set -g @catppuccin_window_middle_separator "  █"
set -g @catppuccin_window_color_fill "number"
set -g @catppuccin_window_current_format_directory_text "#{pane_current_path}"

set -g @catppuccin_status_modules "application session date_time"
set -g @catppuccin_status_left_separator  ""
set -g @catppuccin_status_right_separator " "
set -g @catppuccin_status_right_separator_inverse "yes"
set -g @catppuccin_status_color_fill "all"
set -g @catppuccin_status_connect_separator "no"
```

### Config 3
![Default](./assets/config3.png)

```sh
set -g @catppuccin_window_left_separator ""
set -g @catppuccin_window_right_separator " "
set -g @catppuccin_window_icon_position "right"
set -g @catppuccin_window_middle_separator " █"
set -g @catppuccin_window_color_fill "number"
set -g @catppuccin_window_format_style "application"

set -g @catppuccin_status_modules "directory user host session"
set -g @catppuccin_status_left_separator  " "
set -g @catppuccin_status_right_separator ""
set -g @catppuccin_status_right_separator_inverse "no"
set -g @catppuccin_status_color_fill "icon"
set -g @catppuccin_status_connect_separator "no"

set -g @catppuccin_directory_text "#{pane_current_path}"
```

[style-guide]: https://github.com/catppuccin/catppuccin/blob/main/docs/style-guide.md

## 💝 Thanks to

- [Pocco81](https://github.com/catppuccin)
- [vinnyA3](https://github.com/vinnyA3)
- [rogeruiz](https://github.com/rogeruiz)

&nbsp;

<p align="center"><img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/footers/gray0_ctp_on_line.svg?sanitize=true" /></p>
<p align="center">Copyright &copy; 2021-present <a href="https://github.com/catppuccin" target="_blank">Catppuccin Org</a>
<p align="center"><a href="https://github.com/catppuccin/catppuccin/blob/main/LICENSE"><img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&logoColor=d9e0ee&colorA=363a4f&colorB=b7bdf8"/></a></p>
