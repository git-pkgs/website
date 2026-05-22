---
title: pin
---

Vendors browser assets without npm. A single static binary that fetches files from published packages, anchors their integrity to the registry tarball, commits them to your repo, and writes a lockfile that is also a valid CycloneDX SBOM.

If your server-rendered app needs htmx, a CSS kit, and an icon set, that's three dependencies. `npm install` for them gives you a `node_modules` with hundreds of transitive packages, a Node runtime in CI, and arbitrary code execution on every install via lifecycle hooks. `pin` fetches the files you name at the versions you pin, hashes them against what npm published, and writes them to disk without running any package code.

```yaml
out: "internal/web/static/vendor"

assets:
  - name: "htmx.org"
    version: "^2.0"
    files: ["dist/htmx.min.js"]

  - name: "highlight.js"
    version: "11.11.1"
    source: "github:highlightjs/cdn-release"
    files:
      - "build/highlight.min.js"
      - "build/styles/github.min.css"
```

```
pin sync                resolve manifest, fetch assets, write lockfile
pin sync --frozen       fail if manifest and lockfile disagree (CI)
pin update [NAME...]    re-resolve to highest satisfying version
pin verify              re-hash files on disk against the lockfile
pin outdated            compare locked versions against latest
pin add NAME[@SPEC]     append to the manifest and sync
pin sbom                emit the lockfile as SPDX or CycloneDX XML
```

Sources can be npm packages (default), `github:owner/repo` releases, or `url:` for raw files. Versions accept exact pins, semver ranges, or npm dist-tags; once locked they stay locked until `pin update`.

## Safe defaults

A 48-hour cooldown window is on by default so freshly published versions are skipped, falling back to the next-highest satisfying version. `--frozen` bails before any network if the manifest and lock disagree. pin runs no code from a fetched package.

For npm and GitHub sources with trusted publishing, `pin sync` records the SLSA Provenance v1 attestation in the lockfile. `--strict-provenance` fails on missing attestations, `--require-publisher-matches-repository` catches leaked-token attacks where the build came from the wrong repo, and `--verify-provenance` cryptographically verifies the sigstore bundle. These also live in a manifest `trust:` block.

## Lockfile

`pin.lock` is a valid CycloneDX 1.6 SBOM. Each package becomes a `library` component with the registry tarball hash; each vendored file is a nested `file` component with its own SHA-384 and the CDN URL. Any CycloneDX consumer reads it directly. `serialNumber` and `metadata.timestamp` are omitted so re-runs are byte-stable.

## As a Go library

```go
import "github.com/git-pkgs/pin"

res, err := pin.Sync(ctx, pin.SyncOptions{Dir: "."})
```

The `assets` sub-package is the runtime helper a Go web app uses to consume the output: parse the lockfile, serve the vendored files via `fs.FS`, and emit `<script>` tags with `integrity` attributes from a template. Works with `net/http`, Chi, Gin, Echo, Fiber, and Templ without an adapter.

## Installation

```bash
brew install git-pkgs/git-pkgs/pin
# or
go install github.com/git-pkgs/pin/cmd/pin@latest
```

[View on GitHub](https://github.com/git-pkgs/pin)
