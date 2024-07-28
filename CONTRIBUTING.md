# Contributing

## Adding a module

Follow the instructions from [custom](/custom), place the module in the appropriate
directory and document the module in `README.md`.

## Commit messages

This repository uses [Conventional Commits](https://conventionalcommits.org).
Commit headers should be lowercase. Most commits should include a body that briefly
describes the motivation and content of the commit.

### Commit types

- `fix`: A bug fix that doesn't modify the public API
- `feat`: A code change that modifies the public API
- `refactor`: A code change that doesn't change behavior
- `style`: A style fix or change
- `docs`: Any change to documentation
- `ci`: Any change to CI files
- `revert`: A revert commit. The message should describe the reasoning and the
  commit should include the `Refs:` footer with the short hashes of the commits
  being reverted.
- `chore`: catch-all type

### Commit scopes

Available commit scopes are module names, `status`, `pane`, and
`window`. If none of these apply, omit the scope.

### Breaking changes

All breaking changes should be documented in the commit footer in the format
described by Conventional Commits. Use the `<type>!` syntax in order to distinguish
breaking commits in the log, but include the footer to provide a better description
for the changelog generator.

```
feat(bar)!: foo the bars

BREAKING CHANGE: bars are now foo'ed
```
