---
title: pom
---

Pure-Go effective-POM resolution for Maven artifacts. No JVM, no shelling out to `mvn`. Walks the parent chain, merges `<properties>` and `<dependencyManagement>`, expands `<scope>import</scope>` BOMs, applies profiles, interpolates `${...}`, and fills in missing versions.

```go
import "github.com/git-pkgs/pom"

fetcher := pom.NewCachingFetcher(pom.NewHTTPFetcher("")) // "" = Maven Central
r := pom.NewResolver(fetcher)

ep, err := r.Resolve(ctx, pom.GAV{
    GroupID:    "com.fasterxml.jackson.core",
    ArtifactID: "jackson-databind",
    Version:    "2.17.2",
}, pom.Options{})

for _, d := range ep.Dependencies {
    fmt.Printf("%s:%s:%s (%s) [%s]\n",
        d.GroupID, d.ArtifactID, d.Version, d.Scope, d.Resolution)
}
```

If you already have `pom.xml` bytes use `pom.ParsePOM(bytes)` then `r.ResolvePOM(ctx, p, opts)`.

The motivating use case is vulnerability matching, where a dependency declared as `<version>${jackson.version}</version>` is useless until something resolves the property. This is a model builder, not a dependency resolver: it does not touch plugins, lifecycle, build configuration, `settings.xml`, or transitive resolution.

## Resolution tags

Every `ResolvedDep` carries a `Resolution` field explaining how its version was determined: `resolved`, `unresolved_property`, `unresolved_env`, `unresolved_parent`, `unresolved_profile_gated`, or `unresolved_missing`. When unresolved, `Expression` holds the original `${...}` string.

## Fetchers

`Resolver` takes anything with a single `Fetch(ctx, gav) (*POM, error)` method. `HTTPFetcher` reads from a Maven repository layout, `DirFetcher` reads from a flat directory of POM files, and `CachingFetcher` wraps another fetcher and memoises by GAV. Released coordinates are immutable and parent POMs are heavily shared, so you almost always want the cache.

## CLI

```bash
go install github.com/git-pkgs/pom/cmd/pom@latest
```

```
pom com.fasterxml.jackson.core:jackson-databind:2.17.2
curl -fsSL https://repo1.maven.org/maven2/.../foo-1.0.pom | pom -f -
```

Prints a JSON object with `gav`, `packaging`, `licenses`, `scm`, `relocation`, `parents`, `dependencies`, and `warnings`. On an M1 jackson-databind (four parents plus a BOM import) resolves in ~380 ms wall time, almost all of it network; the same artifact through `mvn help:effective-pom` is ~1.7 s and ~150 MB resident.

## Installation

```bash
go get github.com/git-pkgs/pom
```

Stdlib only.

[View on GitHub](https://github.com/git-pkgs/pom)
