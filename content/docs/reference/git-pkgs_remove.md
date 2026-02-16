---
title: "git-pkgs remove"
description: "Remove a dependency"
weight: 10
---

Remove a dependency

Remove a package dependency using the detected package manager.
Detects the package manager from lockfiles in the current directory
and runs the appropriate remove command.

Examples:
  git-pkgs remove lodash
  git-pkgs remove rails
  git-pkgs remove lodash -e npm

```
git-pkgs remove <package> [flags]
```

### Options

```
      --dry-run             Show what would be run without executing
  -e, --ecosystem string    Filter to specific ecosystem
  -x, --extra stringArray   Extra arguments to pass to package manager
  -h, --help                help for remove
  -m, --manager string      Override detected package manager (takes precedence over -e)
  -t, --timeout duration    Timeout for remove operation (default 5m0s)
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
