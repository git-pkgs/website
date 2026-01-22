---
title: Integrity
weight: 28
---

Verify package integrity using checksums from lockfiles.

Modern lockfiles include SHA256/SHA512 hashes that verify package contents haven't been tampered with. git-pkgs can show these hashes and detect anomalies.

## Basic usage

```bash
git pkgs integrity              # show hashes for current dependencies
git pkgs integrity -f json      # JSON output
git pkgs integrity --stateless  # no database needed
```

## Drift detection

The `--drift` flag scans your history for packages where the same version has different integrity hashes:

```bash
git pkgs integrity --drift
```

This could indicate:
- A package was republished with different contents (supply chain attack)
- Registry returned different content at different times
- Lockfile was regenerated against a different registry

## Example output

```
$ git pkgs integrity --drift
DRIFT DETECTED: lodash@4.17.21
  Gemfile.lock (abc1234, 2024-01-15): sha512-abc123...
  Gemfile.lock (def5678, 2024-03-20): sha512-def456...
```

## Options

```
    --drift             Detect same version with different hashes
-e, --ecosystem=NAME    Filter by ecosystem
-f, --format=FORMAT     Output format (text, json)
    --stateless         Parse manifests directly without database
```

## Supported lockfiles

Integrity checking works with lockfiles that include hashes:

- package-lock.json, yarn.lock, pnpm-lock.yaml, bun.lock
- Gemfile.lock
- Cargo.lock
- go.sum
- poetry.lock, Pipfile.lock, uv.lock
- composer.lock
