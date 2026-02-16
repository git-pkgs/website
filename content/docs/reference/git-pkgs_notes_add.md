---
title: "git-pkgs notes add"
description: "Add a note to a package"
weight: 10
---

Add a note to a package

Create a new note for a package. Errors if a note already exists for the purl+namespace unless --force is used.

```
git-pkgs notes add <purl> [flags]
```

### Options

```
      --force              Overwrite existing note
  -h, --help               help for add
  -m, --message string     Note message
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
