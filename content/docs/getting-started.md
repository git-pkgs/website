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
git pkgs blame          # who added each dependency
git pkgs history        # all dependency changes over time
git pkgs history rails  # track a specific package
git pkgs why lodash     # why was this added?
```

## Comparing changes

See what changed between commits, branches, or tags:

```bash
git pkgs diff --from=HEAD~10
git pkgs diff --from=main --to=feature
git pkgs show abc123    # changes in a single commit
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

## Stateless mode

Most commands support `--stateless` to skip the database and parse manifests directly. Useful in CI where you don't want to initialize:

```bash
git pkgs diff main..HEAD --stateless
git pkgs vulns --stateless
git pkgs licenses --stateless
```

## Supported ecosystems

git-pkgs parses lockfiles from npm, RubyGems, Go, Cargo, pip, Composer, Maven, CocoaPods, Hex, NuGet, Pub, GitHub Actions, and more.

For best results, commit your lockfiles. Manifests show version ranges but lockfiles show what actually got installed, including transitive dependencies.
