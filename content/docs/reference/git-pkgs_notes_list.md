---
title: "git-pkgs notes list"
description: "List all notes"
weight: 10
---

List all notes

List all notes, optionally filtered by namespace or purl substring.

```
git-pkgs notes list [flags]
```

### Options

```
  -f, --format string        Output format: text, json (default "text")
  -h, --help                 help for list
      --namespace string     Filter by namespace
      --purl-filter string   Filter by purl substring
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
