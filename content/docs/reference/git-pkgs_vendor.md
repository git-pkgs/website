---
title: "git-pkgs vendor"
description: "Vendor dependencies into the project"
weight: 10
---

Vendor dependencies into the project

Vendor dependencies into a local directory using the detected package manager.
Detects the package manager from lockfiles in the current directory
and runs the appropriate vendor command.

Examples:
  git-pkgs vendor              # vendor dependencies
  git-pkgs vendor -e go        # only vendor Go ecosystem
  git-pkgs vendor -m cargo     # force cargo

```
git-pkgs vendor [flags]
```

### Options

```
      --dry-run             Show what would be run without executing
  -e, --ecosystem string    Filter to specific ecosystem
  -x, --extra stringArray   Extra arguments to pass to package manager
  -h, --help                help for vendor
  -m, --manager string      Override detected package manager (takes precedence over -e)
  -t, --timeout duration    Timeout for vendor operation (default 10m0s)
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
