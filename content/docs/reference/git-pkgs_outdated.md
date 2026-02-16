---
title: "git-pkgs outdated"
description: "Find packages with newer versions available"
weight: 10
---

Find packages with newer versions available

Check dependencies against the ecosyste.ms API to find packages
with newer versions available.

```
git-pkgs outdated [flags]
```

### Options

```
      --at string          Check what was outdated at this date (YYYY-MM-DD)
  -b, --branch string      Branch to query (default: current branch)
  -c, --commit string      Check dependencies at specific commit (default: HEAD)
  -e, --ecosystem string   Filter by ecosystem
  -f, --format string      Output format: text, json (default "text")
  -h, --help               help for outdated
      --major              Only show major version updates
      --minor              Skip patch-only updates
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
