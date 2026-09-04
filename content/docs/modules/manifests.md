---
title: manifests
---

A Go library for parsing package manager manifest and lockfiles. Extracts dependencies with version constraints, scopes, and integrity hashes.

```go
import (
    "os"
    "github.com/git-pkgs/manifests"
)

content, _ := os.ReadFile("package.json")
result, err := manifests.Parse("package.json", content)
if err != nil {
    panic(err)
}

fmt.Printf("Ecosystem: %s\n", result.Ecosystem)
fmt.Printf("Kind: %s\n", result.Kind)
for _, dep := range result.Dependencies {
    fmt.Printf("  %s@%s (%s)\n", dep.Name, dep.Version, dep.Scope)
}
```

## Supported ecosystems

alpine, arch, asdf, bazel, bower, brew, cargo, carthage, chef, clojars, cocoapods, composer, conan, conda, cpan, cran, crystal, deno, docker, dub, elm, gem, git, github-actions, golang, guix, hackage, haxelib, helm, hex, ips, julia, lean, luarocks, maven, nimble, nix, npm, nuget, opam, pre-commit, pub, pypi, rpm, swift, vagrant, vcpkg.

## Types

```go
type Dependency struct {
    Name        string // Package name
    Version     string // Version constraint or resolved version
    Scope       Scope  // runtime, development, test, build, optional
    Integrity   string // SRI hash (sha256-..., sha512-...)
    Direct      bool   // True if declared directly, false if transitive
    PURL        string // Package URL (pkg:ecosystem/name@version)
    RegistryURL string // Source registry URL (if non-default)
}

type ParseResult struct {
    Ecosystem    string
    Kind         Kind // manifest or lockfile
    Dependencies []Dependency
}
```

## Installation

```bash
go get github.com/git-pkgs/manifests
```

[View on GitHub](https://github.com/git-pkgs/manifests)
