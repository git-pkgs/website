---
title: "git-pkgs install"
description: "Install dependencies from lockfile"
weight: 10
---

Install dependencies from lockfile

Install dependencies using the detected package manager.
Detects the package manager from lockfiles in the current directory
and runs the appropriate install command.

Examples:
  git-pkgs install              # install dependencies
  git-pkgs install --frozen     # fail if lockfile would change (CI mode)
  git-pkgs install -e npm       # only install npm ecosystem
  git-pkgs install -m pnpm      # force pnpm

```
git-pkgs install [flags]
```

### Options

```
      --dry-run             Show what would be run without executing
  -e, --ecosystem string    Filter to specific ecosystem
  -x, --extra stringArray   Extra arguments to pass to package manager
      --frozen              Fail if lockfile would change (CI mode)
  -h, --help                help for install
  -m, --manager string      Override detected package manager (takes precedence over -e)
  -t, --timeout duration    Timeout for install operation (default 10m0s)
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
