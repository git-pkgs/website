---
title: "git-pkgs stale"
description: "Find stale dependencies"
weight: 10
---

Find stale dependencies

List dependencies sorted by how long since they were last changed.
Only shows lockfile dependencies (not manifest declarations).

```
git-pkgs stale [flags]
```

### Options

```
  -b, --branch string      Branch to query (default: first tracked branch)
      --days int           Only show deps unchanged for at least N days
  -e, --ecosystem string   Filter by ecosystem
  -f, --format string      Output format: text, json (default "text")
  -h, --help               help for stale
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
