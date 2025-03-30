# Changing the flavor of the theme by resetting

To reset the colors colors in your status line, you can perform a reset of all
the options associated with the styling of the Tmux-line. This is done by
setting a global option called `@catppuccin_reset` to `true.

```txt
@thm_bg
@thm_fg
@thm_rosewater
@thm_flamingo
@thm_rosewater
@thm_pink
@thm_mauve
@thm_red
@thm_maroon
@thm_peach
@thm_yellow
@thm_green
@thm_teal
@thm_sky
@thm_sapphire
@thm_blue
@thm_lavender
@thm_subtext_1
@thm_subtext_0
@thm_overlay_2
@thm_overlay_1
@thm_overlay_0
@thm_surface_2
@thm_surface_1
@thm_surface_0
@thm_mantle
@thm_crust
@catppuccin_window_status_style
@catppuccin_window_text_color
@catppuccin_window_number_color
@catppuccin_window_text
@catppuccin_window_number
@catppuccin_window_current_text_color
@catppuccin_window_current_number_color
@catppuccin_window_current_text
@catppuccin_window_current_number
@catppuccin_window_number_position
@catppuccin_window_flags
@catppuccin_window_flags_icon_last
@catppuccin_window_flags_icon_current
@catppuccin_window_flags_icon_zoom
@catppuccin_window_flags_icon_mark
@catppuccin_window_flags_icon_silent
@catppuccin_window_flags_icon_activity
@catppuccin_window_flags_icon_bell
@catppuccin_window_flags_icon_format
@catppuccin_status_left_separator
@catppuccin_status_middle_separator
@catppuccin_status_right_separator
@catppuccin_status_connect_separator
@catppuccin_status_module_text_bg
@catppuccin_window_current_left_separator
@catppuccin_window_current_middle_separator
@catppuccin_window_current_right_separator
```

All of these Tmux options are unset, with the `-U` flag, when the plugin is
called with the option named `@catppuccin_reset` with a value of `true`. Due to
the way options are set within the plugin, with the `-o` flag, this means that
all user-set options will be reset to their original default values. _This means
that if you have set custom options, you will lose your updates and **will need
to run the plugin again after setting your custom options**_.

This feature is most useful for auto switching between the theme's flavor.

## Minimal example of resetting the flavor

If you're using all the defaults of Catppuccin Tmux, you will only have to worry
about setting the flavor when setting the `@catppuccin_reset` option.

```sh
# somewhere in a Tmux configuration file
set -g @catppuccin_flavor "latte"
set -g @catppuccin_reset "true"
run /path/to/catppuccin/tmux/catppuccin.tmux
```

> [!NOTE]
> Your path above, the line starting with `run ...`, will need to be updated to
> where ever the `catpuccin.tmux` file is located on your system.

## Custom example of resetting the flavor

If you're customizing any of the settings that get reset in the list above, you
must set set options you're customizing along with any dependent options _that
aren't necessary_ when configuring the theme for only a single flavor.

> [!TIP]
> This section is most important for folks who've really riced the shit of our
> of their setup.

Like in the minimal example, you will set your flavor and also reset the plugin.

```sh
# somewhere in a Tmux configuration file
set -g @catppuccin_flavor "latte"
set -g @catppuccin_reset "true"
run /path/to/catppuccin/tmux/catppuccin.tmux
```

But right afterwards, you'll have to set both the before and after your `run
...` the plugin. This does mean running the plugin twice in rapid succession.

```sh

# somewhere in a Tmux configuration file
set -g @catppuccin_flavor "latte"
set -g @catppuccin_reset "true"
run /path/to/catppuccin/tmux/catppuccin.tmux

# after the initial reset call
set -g @catppuccin_flavor "mocha"
set -g @catppuccin_window_status_style "basic"
set -g @catppuccin_window_text " #W"
set -g @catppuccin_window_number "#I"
set -g @catppuccin_window_current_text " #W"
set -g @catppuccin_window_current_number "#I"
set -g @catppuccin_pane_status_enabled "yes"
set -g @catppuccin_pane_border_status "yes"
set -g @catppuccin_window_number_position "right"
set -g @catppuccin_window_current_text "#{pane_current_path}"
set -g @catppuccin_pane_left_separator "▓"
set -g @catppuccin_pane_middle_separator "▓"
set -g @catppuccin_pane_right_separator "▓"
set -g @catppuccin_status_left_separator "▓"
set -g @catppuccin_status_middle_separator "▓"
set -g @catppuccin_status_right_separator "▓"
set -g @catppuccin_status_right_separator_inverse "no"
set -g @catppuccin_status_connect_separator "yes"
set -g @catppuccin_window_status_enable "yes"
set -g @catppuccin_status_fill "icon"
set -g @catppuccin_window_flags "icon"
set -g @catppuccin_application_icon " 󰣆  "
set -g @catppuccin_session_icon "   "
set -g @catppuccin_window_text_color "#{@thm_surface_0}"
set -g @catppuccin_window_number_color "#{@thm_overlay_2}"
set -g @catppuccin_window_current_text_color "#{@thm_surface_1}"
set -g @catppuccin_window_current_number_color "#{@thm_mauve}"
set -g @catppuccin_status_module_bg_color "#{@thm_surface_0}"
set -g @catppuccin_status_application_icon_fg "#{E:@thm_crust}"
set -g @catppuccin_status_application_text_fg "#{E:@thm_fg}"
set -g @catppuccin_application_color "#{E:@thm_maroon}"
set -g @catppuccin_status_session_icon_fg "#{E:@thm_crust}"
set -g @catppuccin_status_session_text_fg "#{E:@thm_fg}"
set -g @catppuccin_session_color "#{?client_prefix,#{E:@thm_red},#{E:@thm_green}}"
set -g @catppuccin_status_module_text_bg "#{?@catppuccin_status_module_bg_color,#{E:@catppuccin_status_module_bg_color},#{@thm_surface_0}}"

run /path/to/catppuccin/tmux/catppuccin.tmux
```

Notice that above there are certain lines that are being set that aren't usually
set initially. This is due to the colors being updated. _These options are
highlighted below in a smaller snippet_. These specific options aren't usually
set when configuring the plugin for a single flavor. Due to how options are
reset and then immediately set in the entry point for the plugin, all options
will be updated to their defaults which aren't going to be what you've
customized.

```sh
set -g @catppuccin_window_text_color "#{@thm_surface_0}"
set -g @catppuccin_window_number_color "#{@thm_overlay_2}"
set -g @catppuccin_window_current_text_color "#{@thm_surface_1}"
set -g @catppuccin_window_current_number_color "#{@thm_mauve}"
set -g @catppuccin_status_module_bg_color "#{@thm_surface_0}"
set -g @catppuccin_status_application_icon_fg "#{E:@thm_crust}"
set -g @catppuccin_status_application_text_fg "#{E:@thm_fg}"
set -g @catppuccin_application_color "#{E:@thm_maroon}"
set -g @catppuccin_status_session_icon_fg "#{E:@thm_crust}"
set -g @catppuccin_status_session_text_fg "#{E:@thm_fg}"
set -g @catppuccin_session_color "#{?client_prefix,#{E:@thm_red},#{E:@thm_green}}"
set -g @catppuccin_status_module_text_bg "#{?@catppuccin_status_module_bg_color,#{E:@catppuccin_status_module_bg_color},#{@thm_surface_0}}"
```

> [!NOTE]
> See the `@catppuccin_status_module_bg_color` and other color options such as
> `@catppuccin_application_color` and others have to be set due to the how the
> plugin resets all the values listed at the top of this document.
