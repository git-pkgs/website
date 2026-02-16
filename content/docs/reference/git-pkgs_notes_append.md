---
title: "git-pkgs notes append"
description: "Append to an existing note"
weight: 10
---

Append to an existing note

Append message text and merge metadata into an existing note. Creates a new note if none exists.

```
git-pkgs notes append <purl> [flags]
```

### Options

```
  -h, --help               help for append
  -m, --message string     Message to append
      --namespace string   Note namespace for categorization
      --origin string      Tool or system that created this note (default "git-pkgs")
      --set stringArray    Set metadata key=value pair
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
