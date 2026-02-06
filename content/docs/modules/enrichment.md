---
title: enrichment
---

A Go library for fetching package metadata from external sources. Combines registry queries and the [ecosyste.ms](https://packages.ecosyste.ms) API behind a single interface.

```go
import (
    "context"
    "github.com/git-pkgs/enrichment"
)

client, err := enrichment.NewClient()
if err != nil {
    panic(err)
}

info, err := client.BulkLookup(context.Background(), []string{
    "pkg:npm/lodash@4.17.21",
    "pkg:pypi/requests@2.31.0",
})

for purl, pkg := range info {
    fmt.Printf("%s: latest=%s license=%s\n", purl, pkg.LatestVersion, pkg.License)
}
```

## How it works

By default, `NewClient()` returns a hybrid client that routes lookups based on the PURL:

- PURLs with a `repository_url` qualifier go directly to the registry
- Everything else goes through ecosyste.ms

To skip ecosyste.ms and query all registries directly, set `GIT_PKGS_DIRECT=1` or `git config --global pkgs.direct true`.

## Key types

```go
type Client interface {
    BulkLookup(ctx context.Context, purls []string) (map[string]*PackageInfo, error)
    GetVersions(ctx context.Context, purl string) ([]VersionInfo, error)
    GetVersion(ctx context.Context, purl string) (*VersionInfo, error)
}

type PackageInfo struct {
    Ecosystem     string
    Name          string
    LatestVersion string
    License       string
    Description   string
    Homepage      string
    Repository    string
    RegistryURL   string
    Source        string // "ecosystems", "registries", or "depsdev"
}

type VersionInfo struct {
    Number      string
    PublishedAt time.Time
    Integrity   string
    License     string
}
```

## Installation

```bash
go get github.com/git-pkgs/enrichment
```

[View on GitHub](https://github.com/git-pkgs/enrichment)
