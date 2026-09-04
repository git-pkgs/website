---
title: SBOM
weight: 32
---

Export a Software Bill of Materials in CycloneDX or SPDX format.

## Basic usage

```bash
git pkgs sbom                      # CycloneDX JSON (default)
git pkgs sbom --type spdx          # SPDX JSON
git pkgs sbom -f xml               # XML instead of JSON
git pkgs sbom --name my-project    # custom project name
```

## Formats

**CycloneDX** (default): Widely supported format for vulnerability scanning tools, dependency track, and compliance workflows.

**SPDX**: ISO standard format often required for regulatory compliance and license analysis.

Both formats include:
- Package URLs (purls)
- Versions
- Licenses (fetched from registries)

Use `--skip-enrichment` to omit license lookups for faster generation.

## CI example

Generate SBOM on release and attach to GitHub release:

```yaml
name: Release
on:
  release:
    types: [published]

jobs:
  sbom:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v7
        with:
          fetch-depth: 0

      - uses: git-pkgs/actions/setup@v1

      - name: Generate SBOM
        run: git-pkgs sbom --name=${{ github.repository }} > sbom.json

      - name: Upload to release
        uses: softprops/action-gh-release@v1
        with:
          files: sbom.json
```

## Options

```
    --type=FORMAT       SBOM format: cyclonedx (default) or spdx
    --name=NAME         Project name in the SBOM
-f, --format=FORMAT     Output format: json (default) or xml
    --skip-enrichment   Skip fetching license info from registries
-e, --ecosystem=NAME    Filter by ecosystem
```
