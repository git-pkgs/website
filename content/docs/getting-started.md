---
title: Getting Started
weight: 10
---

See [Installation](/docs/installation) for setup instructions.

## Quick start

Initialize the database in any git repository:

```bash
cd your-repo
git pkgs init
```

This walks through your git history and builds a SQLite database of dependency changes, stored in `.git/pkgs.sqlite3`. Git hooks are installed automatically to keep it updated.

Now you can query your dependency history:

```bash
git pkgs list           # show current dependencies
git pkgs stats          # overview of your dependency history
git pkgs blame          # who added each dependency (also: praise)
git pkgs history        # all dependency changes over time
git pkgs history rails  # track a specific package
git pkgs why lodash     # why was this added?
```

If your repository has a `.mailmap` file, author attribution in `blame`, `stats`, `history`, and `bisect` commands respects it for consistent contributor identity resolution.

## Comparing changes

See what changed between commits, branches, or tags:

```bash
git pkgs diff                             # HEAD vs working tree
git pkgs diff --from=HEAD~10              # HEAD~10 vs working tree
git pkgs diff --from=main --to=feature
git pkgs diff --type=runtime              # filter by dependency type
git pkgs show abc123                      # changes in a single commit
```

## Vulnerability scanning

Check dependencies against the OSV database for known CVEs:

```bash
git pkgs vulns              # scan current dependencies
git pkgs vulns blame        # who introduced each vulnerability
git pkgs vulns praise       # who fixed vulnerabilities
```

## Finding outdated packages

Check package registries for newer versions:

```bash
git pkgs outdated           # packages with updates available
git pkgs outdated --major   # only major version updates
```

## Annotating packages

Attach notes and metadata to packages for policy tracking, security reviews, or any other purpose:

```bash
git pkgs notes add pkg:npm/lodash -m "approved" --set status=approved
git pkgs notes list
```

See [Notes](/docs/notes) for more.

## Output options

Control colored output with the `--color` flag:

```bash
git pkgs diff --color=always   # force colors (useful for piping to less -R)
git pkgs diff --color=never    # disable colors
git pkgs diff --color=auto     # default: colors when output is a terminal
```

The `FORCE_COLOR` environment variable also enables colors when set.

Use `--pager` to pipe output through your pager (respects `$PAGER`, defaults to `less`):

```bash
git pkgs history --pager
```

## Git submodules

By default, git-pkgs ignores dependencies in git submodules. To include them:

```bash
git pkgs list --include-submodules
git pkgs diff --include-submodules
```

The `--include-submodules` flag works with all commands that scan the working directory.

## Supported ecosystems

git-pkgs parses lockfiles from npm, RubyGems, Go, Cargo, pip, Composer, Maven, CocoaPods, Hex, NuGet, Pub, GitHub Actions, and more. It also recognizes `.tool-versions` (asdf/mise) files and `.gitmodules` for git submodule tracking. Run `git pkgs ecosystems` for the full list.

For best results, commit your lockfiles. Manifests show version ranges but lockfiles show what actually got installed, including transitive dependencies.
