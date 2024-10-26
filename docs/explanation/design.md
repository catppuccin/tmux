## Design Philosophy

First and foremost, this is a color scheme. Making colors work
well takes precedence over other kinds of functionality.

### History

This plugin kept on growing essentially because no one was there to push back on
changes that went against, for example, parts of the UNIX philosophy. This lead to
a state where there were almost an infinite number of configuration options,
and combining them in unique ways would almost certainly break something.
Maintaining the options for everyone's setup was impossible, and fixing
one bug would cause several others to appear. Eventually the addition
of more and more things that didn't relate to colors, such as status line modules,
took time away from getting the basics right.

Moving forward, we will be trying to align with the philosophies listed below.
This is in contrast to what the plugin has historically offered in terms of functionality.

### UNIX Philosphy

1. Write programs that do one thing and do it well.
    - Do colors, and do colors well. Other things like displaying the weather
    are not the responsibility of this plugin.
1. Write programs to work together.
    - The full palette is exposed as user options, allowing
    easy integration with any other kind of tmux configuration.
1. Write programs to handle text streams, because that is a universal interface.
    - TMUX is a text based program. Each of the palette options are strings
    in user options that can be piped into other programs and options.

### Configurability is the root of all evil

Adopted from "[Fish Shell's design philophy](https://fishshell.com/docs/current/design.html)".

Every configuration option in a program is a place where the program is too
stupid to figure out for itself what the user really wants, and should be
considered a failure of both the program and the programmer who implemented it.

Rationale: Different configuration options are a nightmare to maintain, since
the number of potential bugs caused by specific configuration combinations
quickly becomes an issue. Configuration options often imply assumptions about
the code which change when reimplementing the code, causing issues with
backwards compatibility. But mostly, configuration options should be avoided
since they simply should not exist, as the program should be smart enough to do
what is best, or at least a good enough approximation of it.

### The law of orthogonality

The set of options that do exist should have a small set of orthogonal features.
Any situation where two options are related but not identical, one of them
should be removed, and the other should be made powerful and general enough to
handle all common use cases of either feature.

Rationale: Related features make the configuration options larger, which makes
it harder to use. It also increases the size of the source code, making the
program harder to maintain and update.
