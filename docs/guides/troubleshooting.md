# Frequently Asked Questions

## Window Names

By default, window names are the pane title, and the pane title is
set by the shell running in each pane. Oh My ZSH does this [automatically](https://github.com/ohmyzsh/ohmyzsh/wiki/Settings#automatic-title),
as does [fish](https://fishshell.com/docs/current/cmds/fish_title.html).

The format string used can be changed by setting the following options:

```bash
set -g @catppuccin_window_text "#W"
set -g @catppuccin_window_current_text "#W"
```

The window title is `#W`, the current path is `#{b:pane_current_path}`. A huge
amount of customisation is possible, and is explained in depth
in the "[tmux man page](https://man7.org/linux/man-pages/man1/tmux.1.html#FORMATS)".

## Symbols are not displaying

Make sure you have installed a [Nerd Font](https://www.nerdfonts.com/),
and that your terminal is set to use that font.

## My options are not being applied

Go through these steps:

1. Completely kill tmux and restart (`killall tmux`).
1. Ensure every `@catppuccin.*` option is being set _before_
   the plugin is loaded. Loading occurs where you have `run` in your config file.
1. Double check for typos. There are two "c"s and two "p"s in "catppuccin".
1. Do not use `-o` to set options that begin with `@`. The `-o` flag means that
   the option will not be set if it has already been set. You do not need this
   in your config file.
1. Double check that any option that does _not_ start with `@` is set after the
   plugin is loaded.
