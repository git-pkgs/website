---
title: CI/CD
weight: 30
---

git-pkgs works well in CI pipelines for dependency analysis, vulnerability scanning, and license compliance.

## GitHub Actions

The [git-pkgs/actions](https://github.com/git-pkgs/actions) repo provides reusable actions that handle installation and common checks. All actions expect `fetch-depth: 0` on checkout so git-pkgs can access the full commit history.

### Setup

Installs git-pkgs and initializes the database. The other actions expect this to have run first.

```yaml
- uses: git-pkgs/actions/setup@v1
  with:
    version: "0.1.9" # optional, defaults to latest
```

### Dependency diff

Comments on PRs with a summary of packages added, removed, and updated.

```yaml
- uses: git-pkgs/actions/diff@v1
```

### Vulnerability scanning

Scans for known CVEs. Set `severity` to fail the build on vulnerabilities at or above that level. Set `sarif: true` to upload results to GitHub Advanced Security.

```yaml
- uses: git-pkgs/actions/vulns@v1
  with:
    severity: "high"
    sarif: "true"
```

### License compliance

Enforces an allow or deny list of SPDX license identifiers. Fails if any dependency violates the policy.

```yaml
- uses: git-pkgs/actions/licenses@v1
  with:
    allow: "MIT,Apache-2.0,BSD-2-Clause,BSD-3-Clause,ISC"
```

### SBOM generation

Generates a CycloneDX or SPDX Software Bill of Materials and uploads it as a workflow artifact.

```yaml
- uses: git-pkgs/actions/sbom@v1
  with:
    format: "cyclonedx" # or spdx
```

### Full example

```yaml
name: Dependencies
on:
  pull_request:

permissions:
  contents: read
  pull-requests: write
  security-events: write

jobs:
  check:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0

      - uses: git-pkgs/actions/setup@v1

      - uses: git-pkgs/actions/diff@v1

      - uses: git-pkgs/actions/vulns@v1
        with:
          severity: "high"

      - uses: git-pkgs/actions/licenses@v1
        with:
          deny: "GPL-3.0-only,AGPL-3.0-only"
```

## Manual installation

If you need more control or use a different CI system, you can install git-pkgs directly.

### GitHub Actions

```yaml
- name: Install git-pkgs
  run: |
    curl -sfL https://github.com/git-pkgs/git-pkgs/releases/latest/download/git-pkgs_0.1.9_linux_amd64.tar.gz \
      | tar xz -C /usr/local/bin git-pkgs

- name: Initialize database
  run: git-pkgs init

- name: Show dependency changes
  run: git-pkgs diff origin/${{ github.base_ref }}..HEAD
```

### Enforce package policy with notes

If you maintain [notes](/docs/notes) with a `policy` namespace marking packages as `banned`, a CI step can check current dependencies against them:

```yaml
- name: Check for banned packages
  run: |
    banned=$(git-pkgs notes list --namespace policy -f json \
      | jq -r '.[] | select(.metadata.status == "banned") | .purl')
    if [ -n "$banned" ]; then
      echo "Banned packages found:"
      echo "$banned"
      exit 1
    fi
```

### GitLab CI

```yaml
dependency-diff:
  stage: test
  script:
    - curl -sfL https://github.com/git-pkgs/git-pkgs/releases/latest/download/git-pkgs_0.1.9_linux_amd64.tar.gz
        | tar xz -C /usr/local/bin git-pkgs
    - git-pkgs init
    - git-pkgs diff origin/$CI_MERGE_REQUEST_TARGET_BRANCH_NAME..HEAD
  rules:
    - if: $CI_PIPELINE_SOURCE == "merge_request_event"
```

## Exit codes

| Code | Meaning |
|------|---------|
| 0 | Success |
| 1 | Error or findings (vulns found, license violations, etc.) |

Commands that find issues exit non-zero, making them suitable as quality gates.
