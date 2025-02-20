#!/usr/bin/env python3

import argparse
import re
from typing import TypedDict
from enum import Flag, auto
from dataclasses import dataclass


class CommandFlag(Flag):
    GLOBAL = auto()
    APPEND = auto()
    FORMAT = auto()


def flags_from_str(args: str) -> set[CommandFlag]:
    """Returns the set of flags present in the given args."""
    flags: set[CommandFlag] = set()
    for c in args:
        match c:
            case "a":
                flags.add(CommandFlag.APPEND)
            case "g":
                flags.add(CommandFlag.GLOBAL)
            case "F":
                flags.add(CommandFlag.FORMAT)
    return flags


TmuxCommand = TypedDict(
    "TmuxCommand",
    {
        "command": str,
        "option": str | None,  # If this is setting an option, the target option.
        "flags": set[CommandFlag],  # Flags such as '-g', '-F'.
        "value": str,
        # Metadata
        "line_number": int,  # The line number that this appears in in the source file.
        "original_text": str,  # Original text of the line in the source file.
    },
)


@dataclass
class Issue:
    """An issue with a line in a tmux config file."""

    cmd: TmuxCommand
    message: str


def print_error(message: str, line: str, lineno: int):
    """Prints an error that occured on the given lineno, with the contents being line."""
    print(f"{message}, at line {lineno}: {line}")
    exit(1)


def parse_config(config: str, verbose: bool) -> list[TmuxCommand]:
    commands: list[TmuxCommand] = []
    # TODO: Handle multiline commands that contain '\'
    for line_number, line in enumerate(config.splitlines()):
        cmd_re = r"\s*(\w+)\s+(-\w+)?\s*(@?[\w\-_]+)?\s*[\"']?(.*)"
        m = re.match(cmd_re, line)
        if not m:
            continue
        # Must have groups 1 and 4
        if None in m.group(1, 4):
            print_error("Invalid tmux command", line, line_number)

        commands.append(
            TmuxCommand(
                command=m.group(1),
                option=m.group(3),
                flags=flags_from_str(str(m.group(2) or "")),
                value=m.group(4).rstrip("\"'"),
                line_number=line_number,
                original_text=line,
            )
        )
        if verbose:
            print(f"matched command: {repr(commands[-1])}")
    return commands


def parse_file(filename: str, verbose: bool) -> list[TmuxCommand]:
    with open(filename, mode="r", encoding="utf-8") as f:
        return parse_config(f.read(), verbose)


def validate_catppuccin_options(
    config: list[TmuxCommand], verbose: bool
) -> list[Issue]:
    """Checks that all '@catppuccin' options are set before the config is loaded"""

    issues: list[Issue] = []
    option_sets = [x for x in config if x["command"] == "set"]

    # Find the line that loads catppuccin.
    catppuccin_line = next(
        (
            x
            for x in config
            if x["command"] == "run"
            and ("catppuccin" in x["value"] or "tpm" in x["value"])
        ),
        None,
    )

    if catppuccin_line is None:
        if verbose:
            print("No catppuccin load detected")
        return []

    for option_set in option_sets:
        # Check that all @catppuccin lines are _before_ the catppuccin_line.
        if (
            "@catppuccin" in str(option_set["option"] or "")
            and option_set["line_number"] > catppuccin_line["line_number"]
        ):
            issues.append(
                Issue(
                    option_set,
                    "All catppuccin options must be set before the plugin is loaded",
                )
            )

        # Check for typos.
        if str(option_set["option"] or "") == "@catppuccin_flavour":
            issues.append(Issue(option_set, 'Typo, "flavour" should be "flavor"'))

    return issues


def validate_config(config: list[TmuxCommand], verbose: bool):
    issues: list[Issue] = []
    # Check catppuccin.
    issues.extend(validate_catppuccin_options(config, verbose))

    for issue in issues:
        print(
            f"{issue.message}, at line {issue.cmd['line_number']}: {issue.cmd['original_text']}"
        )


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("config_file", help="The tmux config file to be checked.")
    parser.add_argument(
        "--verbose", "-v", help="Print extra information.", action="store_true"
    )
    args = parser.parse_args()

    file_contents: list[TmuxCommand] = parse_file(args.config_file, args.verbose)
    validate_config(file_contents, args.verbose)
