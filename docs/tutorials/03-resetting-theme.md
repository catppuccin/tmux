# Changing the flavor of the theme by resetting

To reset the colors colors in your status line, you can perform a reset of all
the options associated with the styling of the Tmux-line. This is done by
setting a global option called `@catppuccin_reset` to `true.

<details open>

<summary>A list of all the options that our <code>@catppuccin_reset</code> option resets</summary>

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

</details>

All of these Tmux options above are unset, **with the `-U` flag**, when the
plugin is called with the option named `@catppuccin_reset` with a value of
`true`. Due to _the way options are set within the plugin_, **with the `-o`
flag**, all options set by the user will be reset to plugins original default
values. _This means that if you have set **any** custom options, you **may**
lose your updates and **will need to run the plugin again after setting your
custom options**_.

> [!TIP]
> Trying running the reset yourself right now and note what breaks for your
> custom setup. That's one good way to experience what's being described above
> locally on your machine.

This feature is the most useful for auto-switching between the theme's flavor.
It's also useful for contributing or developing the plugin locally as well.

## Minimal example of resetting the flavor

If you're using all the defaults of Catppuccin Tmux, you will only have to worry
about setting the flavor when setting the `@catppuccin_reset` option to `true`.

```sh
# somewhere in a Tmux configuration file that will be sourced specifically for
# reloading `catppuccin/tmux`.
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
> This section is most important for folks who've really riced the shit out of
> of their setup.

Like in the minimal example, you will set your flavor and also reset the plugin.

```sh
# somewhere in a Tmux configuration file that will be sourced specifically for
# reloading `catppuccin/tmux`.
set -g @catppuccin_flavor "latte"
set -g @catppuccin_reset "true"
run /path/to/catppuccin/tmux/catppuccin.tmux
# we're not done yet!
```

But right afterwards, you'll have to set your customized options both before and
after you `run ...` the plugin. _This does mean running the plugin twice in
rapid succession_. This is due to a limitation of Tmux and how the plugin is
designed to be customizable and also ergonomic to ease with minimal
configuration.

```sh
# somewhere in a Tmux configuration file that will be sourced specifically for
# reloading `catppuccin/tmux`.
set -g @catppuccin_flavor "mocha"
set -g @catppuccin_reset "true"
run /path/to/catppuccin/tmux/catppuccin.tmux

# right after the initial reset call.
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

Notice that above there are certain lines that are _being set that aren't
usually set initially_. Some of these options are set within the file named
`utils/status_module.conf`, for example. While some are set in the other parts
of the plugin's configuration. This is due to the colors being unset and then
rest to the defaults **because you can't reset this plugin without also running
the default configuration options too**. _These options are highlighted below in
a smaller snippet_. These specific options aren't usually set when configuring
the plugin for a single flavor. Due to how options are reset and then again
immediately set in the `catppuccin_options_tmux.conf` file & all options will be
set to their defaults which aren't going to be what you've customized.

```sh
# here's some options extracted from the example above which must be set again
# after the reset that you probably would not have to set if you're using the
# reset functionality.
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

## You should now know how to reset the flavor using Tmux configuration files

Thanks for reading this far. If there's any questions or concerns please reach
out to the community in our [Discord server][discord] or by creating an issue on [GitHub][github].

Hopefully after reading this you've got a much better understanding of both how
to reset the flavor for `catppuccin/tmux` and[the configuration][internal] for this plugin.

[discord]: https://discord.com/servers/catppuccin-907385605422448742 "The official Catppuccin Discord server"
[github]: https://github.com/catppuccin/tmux/issues/new/choose "This project's GitHub issue type chooser page"
[internal]: ../reference/configuration.md "Our internal configuration document for this plugin"
