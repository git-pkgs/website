---
title: "git-pkgs why"
description: "Show why a dependency was added"
weight: 10
---

Show why a dependency was added

Show the commit that first added a dependency, including the author and commit message.

```
git-pkgs why <package> [flags]
```

### Options

```
  -e, --ecosystem string   Filter by ecosystem
  -f, --format string      Output format: text, json (default "text")
  -h, --help               help for why
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
