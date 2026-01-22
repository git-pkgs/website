---
title: registries
---

Go library for fetching package metadata from registry APIs. Supports 25 ecosystems with a unified interface.

```go
import (
    "context"
    "github.com/git-pkgs/registries"
    _ "github.com/git-pkgs/registries/all"
)

ctx := context.Background()

// Fetch package info from a PURL
pkg, _ := registries.FetchPackageFromPURL(ctx, "pkg:cargo/serde@1.0.0", nil)
fmt.Println(pkg.Name)       // serde
fmt.Println(pkg.Repository) // https://github.com/serde-rs/serde
fmt.Println(pkg.Licenses)   // MIT OR Apache-2.0

// Fetch specific version info
version, _ := registries.FetchVersionFromPURL(ctx, "pkg:cargo/serde@1.0.0", nil)
fmt.Println(version.PublishedAt)

// Fetch dependencies
deps, _ := registries.FetchDependenciesFromPURL(ctx, "pkg:npm/express@4.19.0", nil)
for _, d := range deps {
    fmt.Printf("%s %s\n", d.Name, d.Requirements)
}

// Bulk operations (parallel fetching)
purls := []string{
    "pkg:npm/lodash@4.17.21",
    "pkg:cargo/serde@1.0.0",
    "pkg:pypi/requests@2.31.0",
}
packages := registries.BulkFetchPackages(ctx, purls, nil)
```

## Supported ecosystems

Cargo, npm, RubyGems, PyPI, Go, Maven, NuGet, Packagist, Hex, Pub, CocoaPods, Clojars, CPAN, Hackage, CRAN, Conda, Julia, Elm, Dub, LuaRocks, Nimble, Haxelib, Homebrew, Deno, Terraform.

## Private registries

PURLs with a `repository_url` qualifier automatically use that URL:

```go
// Queries https://npm.mycompany.com instead of npmjs.org
purl := "pkg:npm/%40mycompany/utils@1.0.0?repository_url=https://npm.mycompany.com"
pkg, _ := registries.FetchPackageFromPURL(ctx, purl, nil)
```

## Installation

```bash
go get github.com/git-pkgs/registries
```

[View on GitHub](https://github.com/git-pkgs/registries)
