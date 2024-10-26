# Contributing

## Design

To understand our mindset in developing this plugin and how to ensure your
changes align with that mindset, check out the "[Design Philosophy](./docs/explanation/design.md)."

## Commit messages

This repository uses [Conventional Commits](https://conventionalcommits.org).
Commit headers should be lowercase. Most commits should include a body that briefly
describes the motivation and content of the commit.

### Commit types

- `fix`: A bug fix that doesn't modify the public API
- `feat`: A code change that adds functionality
- `change`: A modification to the public API
- `deprecate`: Something in the public API has been deprecated
- `remove`: A part of the public API has been removed
- `refactor`: A code change that doesn't change behavior
- `style`: A style fix or change
- `docs`: Any change to documentation
- `revert`: A revert commit. The message should describe the reasoning and the
  commit should include the `Refs:` footer with the short hashes of the commits
  being reverted.
- `chore`: catch-all type

### Breaking changes

All breaking changes should be documented in the commit footer in the format
described by Conventional Commits. Use the `<type>!` syntax in order to distinguish
breaking commits in the log, but include the footer to provide a better description
for the changelog generator.

```text
feat(bar)!: foo the bars

BREAKING CHANGE: bars are now foo'ed
```
