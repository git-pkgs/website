---
title: "git-pkgs maintainers"
description: "Show dependency maintainer information"
weight: 10
---

Show dependency maintainer information

Fetch package maintainer metadata and show maintainer counts for dependencies.

```
git-pkgs maintainers [flags]
```

### Options

```
      --all                Include transitive dependencies from lockfiles
  -b, --branch string      Branch to query (default: current branch)
  -c, --commit string      Check dependencies at specific commit (default: HEAD)
  -e, --ecosystem string   Filter by ecosystem
  -f, --format string      Output format: text, json (default "text")
  -h, --help               help for maintainers
      --single             Only show dependencies with exactly one maintainer
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
