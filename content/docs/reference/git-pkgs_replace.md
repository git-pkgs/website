---
title: "git-pkgs replace"
description: "Redirect a dependency to a local path, git ref, or version"
weight: 10
---

Redirect a dependency to a local path, git ref, or version

Redirect a dependency to an alternative source for downstream testing.
Use --path for a local checkout, --git with an optional --ref for a git source,
or pass a version to fall through to the package manager's add operation.

Examples:
  git-pkgs replace github.com/acme/lib --path ../lib
  git-pkgs replace lodash --git https://github.com/fork/lodash --ref fix-branch
  git-pkgs replace lodash 4.17.21
  git-pkgs replace github.com/acme/lib --drop

```
git-pkgs replace <package> [version] [flags]
```

### Options

```
      --drop                Remove an existing replacement
      --dry-run             Show what would be run or edited without executing
  -e, --ecosystem string    Filter to specific ecosystem
  -x, --extra stringArray   Extra arguments to pass to package manager
      --git string          Redirect dependency to a git repository
  -h, --help                help for replace
  -m, --manager string      Override detected package manager (takes precedence over -e)
      --path string         Redirect dependency to a local path
      --ref string          Git branch, tag, or revision for --git
  -t, --timeout duration    Timeout for replace operation (default 5m0s)
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
