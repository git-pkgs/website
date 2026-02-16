---
title: "git-pkgs update"
description: "Update dependencies"
weight: 10
---

Update dependencies

Update dependencies using the detected package manager.
If a package name is provided, only that package is updated.
Otherwise, all dependencies are updated.

Examples:
  git-pkgs update              # update all dependencies
  git-pkgs update lodash       # update specific package
  git-pkgs update -e npm       # only update npm ecosystem
  git-pkgs update --all        # update all (for managers that need explicit flag)

```
git-pkgs update [package] [flags]
```

### Options

```
      --all                 Update all dependencies (for managers like mix that require explicit --all)
      --dry-run             Show what would be run without executing
  -e, --ecosystem string    Filter to specific ecosystem
  -x, --extra stringArray   Extra arguments to pass to package manager
  -h, --help                help for update
  -m, --manager string      Override detected package manager (takes precedence over -e)
  -t, --timeout duration    Timeout for update operation (default 10m0s)
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
