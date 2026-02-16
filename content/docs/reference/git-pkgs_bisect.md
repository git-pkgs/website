---
title: "git-pkgs bisect"
description: "Find the commit that introduced a dependency-related change"
weight: 10
---

Find the commit that introduced a dependency-related change

Binary search through commits with dependency changes to find when
a specific change was introduced. Works like git bisect but only considers
commits that modified dependencies, making it faster for dependency-related issues.

Subcommands:
  start    Begin a bisect session
  good     Mark a commit as good (before the problem)
  bad      Mark a commit as bad (has the problem)
  skip     Skip a commit that can't be tested
  run      Automate bisect with a script
  reset    End the bisect session
  log      Show the bisect log

### Options

```
  -h, --help   help for bisect
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
