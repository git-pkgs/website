---
title: "git-pkgs list"
description: "List dependencies at a commit"
weight: 10
---

List dependencies at a commit

List all dependencies at a specific commit.
Defaults to HEAD if no commit is specified.

```
git-pkgs list [flags]
```

### Options

```
  -b, --branch string      Branch to query (default: current branch)
      --commit string      Commit SHA to show dependencies at (default: HEAD)
  -e, --ecosystem string   Filter by ecosystem
  -f, --format string      Output format: text, json (default "text")
  -h, --help               help for list
  -m, --manifest string    Filter by manifest path
  -t, --type string        Filter by dependency type (runtime, development, etc.)
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
