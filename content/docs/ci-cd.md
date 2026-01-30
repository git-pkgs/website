---
title: CI/CD
weight: 30
---

git-pkgs works well in CI pipelines for dependency analysis, vulnerability scanning, and automated updates.

## GitHub Actions

### Show dependency changes in PRs

```yaml
name: Dependencies
on: pull_request

jobs:
  diff:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0

      - name: Install git-pkgs
        run: |
          curl -sL https://github.com/git-pkgs/git-pkgs/releases/latest/download/git-pkgs-linux-amd64 -o git-pkgs
          chmod +x git-pkgs

      - name: Show dependency changes
        run: ./git-pkgs diff --from=origin/${{ github.base_ref }} --to=HEAD
```

### Vulnerability scanning with SARIF

Upload results to GitHub Security tab:

```yaml
name: Security
on:
  push:
    branches: [main]
  pull_request:

jobs:
  vulns:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Install git-pkgs
        run: |
          curl -sL https://github.com/git-pkgs/git-pkgs/releases/latest/download/git-pkgs-linux-amd64 -o git-pkgs
          chmod +x git-pkgs

      - name: Scan for vulnerabilities
        run: ./git-pkgs vulns -f sarif > results.sarif

      - name: Upload SARIF
        uses: github/codeql-action/upload-sarif@v3
        with:
          sarif_file: results.sarif
```

### Block PRs with high severity vulnerabilities

```yaml
name: Security Gate
on: pull_request

jobs:
  vulns:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Install git-pkgs
        run: |
          curl -sL https://github.com/git-pkgs/git-pkgs/releases/latest/download/git-pkgs-linux-amd64 -o git-pkgs
          chmod +x git-pkgs

      - name: Check for high/critical vulnerabilities
        run: ./git-pkgs vulns -s high
        # Exits non-zero if vulnerabilities found
```

### License compliance

```yaml
name: License Check
on: pull_request

jobs:
  licenses:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Install git-pkgs
        run: |
          curl -sL https://github.com/git-pkgs/git-pkgs/releases/latest/download/git-pkgs-linux-amd64 -o git-pkgs
          chmod +x git-pkgs

      - name: Check licenses
        run: ./git-pkgs licenses --allow=MIT,Apache-2.0,BSD-2-Clause,BSD-3-Clause,ISC
        # Exits non-zero if disallowed licenses found
```

### Generate SBOM on release

```yaml
name: Release
on:
  release:
    types: [published]

jobs:
  sbom:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Install git-pkgs
        run: |
          curl -sL https://github.com/git-pkgs/git-pkgs/releases/latest/download/git-pkgs-linux-amd64 -o git-pkgs
          chmod +x git-pkgs

      - name: Generate CycloneDX SBOM
        run: ./git-pkgs sbom --name=${{ github.repository }} > sbom.json

      - name: Upload SBOM to release
        uses: softprops/action-gh-release@v1
        with:
          files: sbom.json
```

## GitLab CI

### Dependency diff in merge requests

```yaml
dependency-diff:
  stage: test
  script:
    - curl -sL https://github.com/git-pkgs/git-pkgs/releases/latest/download/git-pkgs-linux-amd64 -o git-pkgs
    - chmod +x git-pkgs
    - ./git-pkgs diff --from=origin/$CI_MERGE_REQUEST_TARGET_BRANCH_NAME --to=HEAD
  rules:
    - if: $CI_PIPELINE_SOURCE == "merge_request_event"
```

## Exit codes

| Code | Meaning |
|------|---------|
| 0 | Success |
| 1 | Error or findings (vulns found, license violations, etc.) |

Commands that find issues exit non-zero, making them suitable as quality gates.
