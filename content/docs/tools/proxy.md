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

## Artifact scanning

Cooldown gates on age; scanning gates on content. When enabled, each artifact is staged, handed to one or more external scanners over a small HTTP contract, and only committed to the cache if none of the `block`-mode scanners reject it.

```yaml
scanning:
  enabled: true
  scanners:
    - name: clamav
      url: http://clamav-adapter:8080/scan
      mode: block
    - name: trivy
      url: http://trivy-adapter:8081/scan
      mode: monitor
```

Scanners receive package metadata and a short-lived signed URL, then pull the bytes themselves; the proxy never uploads artifact content to a scanner.

## Supported registries

npm, Cargo, RubyGems, Go modules, Hex, pub.dev, PyPI, Maven, Gradle build cache, NuGet, Composer, Conan, Conda, CRAN, Julia, Swift, Helm, Homebrew, OCI/Docker, Alpine APK, Debian/APT, RPM, and a generic HTTP-download endpoint for GitHub release assets and tools like mise or aqua. Cooldown is available wherever the upstream metadata exposes publish timestamps. OCI upstreams can use static credentials or ECR's 12-hour tokens with automatic refresh.

## What else it does

The root URL serves a dashboard with cache stats, a package browser, archive source viewer, and version diff. `proxy mirror` pre-populates the cache from PURLs or an SBOM. `/metrics` exposes Prometheus counters and `/health` reports upstream circuit-breaker state. `/api/package`, `/api/vulns`, `/api/outdated`, and `/api/bulk` provide a JSON enrichment API over the same data git-pkgs uses. `access_log.path` writes one JSONL line per request.

Storage is local filesystem by default; `storage.url` accepts `s3://` (or any S3-compatible endpoint), `gs://`, or `azblob://`. Metadata lives in SQLite by default or Postgres for multi-node setups.

## Installation

```bash
brew install git-pkgs/git-pkgs/proxy
# or
go install github.com/git-pkgs/proxy/cmd/proxy@latest
# or
docker run -p 8080:8080 ghcr.io/git-pkgs/proxy:latest
# or
helm install proxy oci://ghcr.io/git-pkgs/charts/proxy
```

[View on GitHub](https://github.com/git-pkgs/proxy)
