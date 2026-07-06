---
title: "git-pkgs notes import"
description: "Import notes from a YAML or JSON file"
weight: 10
---

Import notes from a YAML or JSON file

Import notes from a YAML or JSON file. Imported notes are upserted by purl+namespace.

```
git-pkgs notes import <file> [flags]
```

### Options

```
  -h, --help               help for import
      --namespace string   Default namespace for imported notes
      --origin string      Tool or system that created imported notes (default "git-pkgs")
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
