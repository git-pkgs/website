---
title: "git-pkgs deprecated"
description: "Find deprecated dependency versions"
weight: 10
---

Find deprecated dependency versions

Check installed dependency versions against registries and report deprecated versions.

```
git-pkgs deprecated [flags]
```

### Options

```
  -b, --branch string      Branch to query (default: current branch)
  -c, --commit string      Check dependencies at specific commit (default: HEAD)
  -e, --ecosystem string   Filter by ecosystem
  -f, --format string      Output format: text, json (default "text")
  -h, --help               help for deprecated
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
