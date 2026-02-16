---
title: "git-pkgs init"
description: "Initialize git-pkgs database for this repository"
weight: 10
---

Initialize git-pkgs database for this repository

Initialize the git-pkgs database in the current git repository.
This creates a SQLite database in .git/pkgs.sqlite3 and indexes
all dependency changes from the git history.

```
git-pkgs init [flags]
```

### Options

```
  -b, --branch string       Branch to analyze (default: current branch)
      --cpuprofile string   Write CPU profile to file
  -f, --force               Recreate database even if it exists
  -h, --help                help for init
      --memprofile string   Write memory profile to file
      --no-hooks            Skip installing git hooks
      --since string        Start analysis from a specific commit
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
