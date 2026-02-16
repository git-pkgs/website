---
title: "git-pkgs show"
description: "Show dependency changes in a commit"
weight: 10
---

Show dependency changes in a commit

Show all dependency changes introduced in a specific commit.
Defaults to HEAD if no commit is specified.

```
git-pkgs show [commit] [flags]
```

### Options

```
  -e, --ecosystem string   Filter by ecosystem
  -f, --format string      Output format: text, json (default "text")
  -h, --help               help for show
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
