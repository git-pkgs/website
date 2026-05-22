---
title: proxy
---

A caching proxy for package registries. Speeds up installs by caching artifacts locally, and can hide newly published versions until they've aged past a configurable cooldown so automated pipelines aren't first in line for a malicious release.

```bash
brew install git-pkgs/git-pkgs/proxy
proxy -listen :8080
```

Then point your package managers at it: `registry=http://localhost:8080/npm/` in `.npmrc`, `GOPROXY=http://localhost:8080/go,direct`, `sparse+http://localhost:8080/cargo/` in `~/.cargo/config.toml`, and so on. The proxy serves an install guide at `/install` with the exact stanza for each ecosystem.

## Cooldown

```yaml
cooldown:
  default: "3d"
  ecosystems:
    npm: "7d"
  packages:
    "pkg:npm/lodash": "0"
```

When enabled the proxy strips versions from metadata responses until they've aged past the threshold. Resolution order is package PURL, then ecosystem, then global default. The implementation is the [cooldown](../modules/cooldown/) module.

## Supported registries

npm, Cargo, RubyGems, Go modules, Hex, pub.dev, PyPI, Maven, Gradle build cache, NuGet, Composer, Conan, Conda, CRAN, Julia, OCI/Docker, Debian/APT, RPM. Cooldown is available wherever the upstream metadata exposes publish timestamps.

## What else it does

The root URL serves a dashboard with cache stats, a package browser, archive source viewer, and version diff. `proxy mirror` pre-populates the cache from PURLs or an SBOM. `/metrics` exposes Prometheus counters. `/api/package`, `/api/vulns`, `/api/outdated`, and `/api/bulk` provide a JSON enrichment API over the same data git-pkgs uses.

Storage is local filesystem by default, S3 or any S3-compatible service via `storage.url`. Metadata lives in SQLite by default or Postgres for multi-node setups.

## Installation

```bash
brew install git-pkgs/git-pkgs/proxy
# or
go install github.com/git-pkgs/proxy/cmd/proxy@latest
```

[View on GitHub](https://github.com/git-pkgs/proxy)
