---
title: "git-pkgs resolve"
description: "Print parsed dependency graph from the local package manager"
weight: 10
---

Print parsed dependency graph from the local package manager

Run the detected package manager's dependency graph command, parse
the output into a normalized dependency tree with PURLs, and print
the result.

Assumes dependencies are already installed. Run 'git-pkgs install' first
if needed.

Examples:
  git-pkgs resolve              # resolve dependencies (tree output)
  git-pkgs resolve -f json      # output as JSON
  git-pkgs resolve -e go        # only resolve Go ecosystem
  git-pkgs resolve -m cargo     # force cargo
  git-pkgs resolve --raw        # print raw manager output

```
git-pkgs resolve [flags]
```

### Options

```
      --dry-run             Show what would be run without executing
  -e, --ecosystem string    Filter to specific ecosystem
  -x, --extra stringArray   Extra arguments to pass to package manager
  -f, --format string       Output format: text, json (default "text")
  -h, --help                help for resolve
  -m, --manager string      Override detected package manager (takes precedence over -e)
      --raw                 Print raw manager output instead of parsed JSON
  -t, --timeout duration    Timeout for resolve operation (default 5m0s)
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
