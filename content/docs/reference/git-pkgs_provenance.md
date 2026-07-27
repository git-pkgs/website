---
title: "git-pkgs provenance"
description: "Check dependency provenance metadata"
weight: 10
---

Check dependency provenance metadata

Check resolved dependencies for registry provenance and attestation metadata.

The command reports verified trusted-publishing signals where registry APIs
expose them, registry attestations and signatures as weaker integrity signals,
and unsupported ecosystems explicitly instead of treating missing metadata as
verified.

```
git-pkgs provenance [flags]
```

### Options

```
  -b, --branch string      Branch to query (default: current branch)
  -c, --commit string      Check dependencies at specific commit (default: HEAD)
  -e, --ecosystem string   Filter by ecosystem
  -f, --format string      Output format: text, json (default "text")
  -h, --help               help for provenance
      --missing            Only show dependencies without trusted-publishing provenance
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
