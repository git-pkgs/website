---
title: "git-pkgs upgrade"
description: "Upgrade database to latest schema version"
weight: 10
---

Upgrade database to latest schema version

Upgrade the git-pkgs database to the latest schema version.
This rebuilds the database from scratch if the schema has changed.

```
git-pkgs upgrade [flags]
```

### Options

```
  -h, --help   help for upgrade
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
