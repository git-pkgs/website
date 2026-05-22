---
title: actions
---

Reusable GitHub Actions wrapping git-pkgs commands. See [CI/CD](../ci-cd/) for how they fit into a wider pipeline.

| Action | What it does |
|---|---|
| `git-pkgs/actions/setup` | Installs git-pkgs and initialises the dependency database |
| `git-pkgs/actions/diff` | Comments on PRs with added, removed, and updated dependencies |
| `git-pkgs/actions/vulns` | Scans for known vulnerabilities, optional SARIF upload and severity gate |
| `git-pkgs/actions/licenses` | Enforces license policy with allow/deny lists |
| `git-pkgs/actions/sbom` | Generates a CycloneDX or SPDX SBOM as a workflow artifact |
| `git-pkgs/actions/update` | Opens PRs for outdated dependencies, one per package |

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

`fetch-depth: 0` is required so git-pkgs can read the full commit history.

[View on GitHub](https://github.com/git-pkgs/actions)
