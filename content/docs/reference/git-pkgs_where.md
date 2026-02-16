---
title: "git-pkgs where"
description: "Find where a package is declared"
weight: 10
---

Find where a package is declared

Search manifest files for a package declaration.
Shows the file path, line number, and content.

```
git-pkgs where <package> [flags]
```

### Options

```
  -C, --context int        Show N lines of surrounding context
  -e, --ecosystem string   Filter by ecosystem
  -f, --format string      Output format: text, json (default "text")
  -h, --help               help for where
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
