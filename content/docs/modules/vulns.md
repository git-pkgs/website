---
title: vulns
---

A Go library for querying vulnerability databases using PURLs. Supports OSV as the primary source, with additional backends for NVD, GitHub Advisories, and others.

```go
import (
    "context"
    "github.com/git-pkgs/purl"
    "github.com/git-pkgs/vulns/osv"
)

source := osv.New()
p := purl.MakePURL("npm", "lodash", "4.17.20")

results, err := source.Query(context.Background(), p)
if err != nil {
    panic(err)
}

for _, v := range results {
    fmt.Printf("%s (%s): %s\n", v.ID, v.SeverityLevel(), v.Summary)
    if fixed := v.FixedVersion("npm", "lodash"); fixed != "" {
        fmt.Printf("  Fixed in: %s\n", fixed)
    }
}
```

## Sources

The `vulns.Source` interface is implemented by multiple backends:

- **osv** queries the [OSV API](https://osv.dev), batched up to 1000 packages
- **depsdev** queries [deps.dev](https://deps.dev), batched up to 5000 packages
- **ghsa** queries GitHub Security Advisories, optional token for higher rate limits
- **nvd** queries the NIST NVD; CPE-based so PURL matching is approximate
- **grypedb** queries a local Anchore Grype SQLite database, no network after download
- **vulncheck** queries the commercial VulnCheck API with native PURL support
- **vl** queries vulnerability-lookup.org by vendor/product

Each source returns results in a common `vulns.Vulnerability` format based on the OSV schema.

```go
import (
    "github.com/git-pkgs/vulns/ghsa"
    "github.com/git-pkgs/vulns/grypedb"
)

g := ghsa.New(ghsa.WithToken(os.Getenv("GITHUB_TOKEN")))
db, _ := grypedb.New("/path/to/cache", grypedb.WithAutoDownload())
defer db.Close()
```

## Key types

```go
type Source interface {
    Query(ctx context.Context, p *purl.PURL) ([]Vulnerability, error)
    QueryBatch(ctx context.Context, purls []*purl.PURL) ([][]Vulnerability, error)
    Get(ctx context.Context, id string) (*Vulnerability, error)
}

type Vulnerability struct {
    ID        string
    Summary   string
    Details   string
    Aliases   []string
    Severity  []Severity
    Affected  []Affected
    // ...
}
```

## Vulnerability methods

```go
v.SeverityLevel()                          // "critical", "high", "medium", "low", "unknown"
v.CVSS()                                   // parsed CVSS info (vector, score, level)
v.FixedVersion("npm", "lodash")            // first fixed version for a package
v.IsVersionAffected("npm", "lodash", "4.17.20")  // check if version is affected
```

## CVSS parsing

The library parses CVSS v2.0, v3.0, v3.1, and v4.0 vectors:

```go
cvss, err := vulns.ParseCVSS("CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H")
fmt.Printf("Score: %.1f (%s)\n", cvss.Score, cvss.Level)
// Score: 9.8 (critical)
```

## Installation

```bash
go get github.com/git-pkgs/vulns
```

[View on GitHub](https://github.com/git-pkgs/vulns)
