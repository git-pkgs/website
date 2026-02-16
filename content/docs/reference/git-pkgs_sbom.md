---
title: "git-pkgs sbom"
description: "Generate Software Bill of Materials"
weight: 10
---

Generate Software Bill of Materials

Generate a Software Bill of Materials (SBOM) in CycloneDX or SPDX format.
The SBOM includes all dependencies and optionally enriched license information.

```
git-pkgs sbom [flags]
```

### Options

```
  -b, --branch string      Branch to query (default: current branch)
  -c, --commit string      Generate SBOM at specific commit (default: HEAD)
  -e, --ecosystem string   Filter by ecosystem
  -f, --format string      Output format: json, xml (default "json")
  -h, --help               help for sbom
      --name string        Project name (default: git directory name)
      --skip-enrichment    Skip license enrichment from ecosyste.ms
  -t, --type string        SBOM type: cyclonedx, spdx (default "cyclonedx")
      --version string     Project version
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
