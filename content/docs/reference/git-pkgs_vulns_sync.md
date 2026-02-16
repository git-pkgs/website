---
title: "git-pkgs vulns sync"
description: "Sync vulnerability data from OSV"
weight: 10
---

Sync vulnerability data from OSV

Fetch and store vulnerability data from OSV for all current dependencies.
This allows subsequent vulnerability queries to use cached data instead of making API calls.

```
git-pkgs vulns sync [flags]
```

### Options

```
  -b, --branch string      Branch to sync (default: first tracked branch)
  -e, --ecosystem string   Only sync specific ecosystem
      --force              Force re-sync even if recently synced
  -h, --help               help for sync
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
