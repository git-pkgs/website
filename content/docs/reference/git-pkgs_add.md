---
title: "git-pkgs add"
description: "Add a dependency"
weight: 10
---

Add a dependency

Add a package dependency using the detected package manager.
Detects the package manager from lockfiles in the current directory
and runs the appropriate add command.

Examples:
  git-pkgs add lodash
  git-pkgs add lodash 4.17.21
  git-pkgs add rails --dev
  git-pkgs add lodash -e npm

```
git-pkgs add <package> [version] [flags]
```

### Options

```
  -D, --dev                 Add as development dependency
      --dry-run             Show what would be run without executing
  -e, --ecosystem string    Filter to specific ecosystem
  -x, --extra stringArray   Extra arguments to pass to package manager
  -h, --help                help for add
  -m, --manager string      Override detected package manager (takes precedence over -e)
  -t, --timeout duration    Timeout for add operation (default 5m0s)
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
