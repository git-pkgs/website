---
title: gitignore
---

A Go library for matching paths against gitignore rules. Loads patterns from `.gitignore` files, `.git/info/exclude`, and the global excludes file, with full support for negation, directory-only patterns, and `**` globs.

```go
import "github.com/git-pkgs/gitignore"

// Load patterns from .gitignore, .git/info/exclude, and global excludes
m := gitignore.New("/path/to/repo")

m.Match("vendor/")        // true (directory)
m.Match("src/main.go")    // false
m.Match("build/output.o") // true
```

## Loading nested .gitignore files

```go
// Walk the directory tree and load every .gitignore found
m := gitignore.NewFromDirectory("/path/to/repo")
```

## Walking a repository

```go
// Walk files that aren't ignored, loading .gitignore files as it descends
gitignore.Walk("/path/to/repo", func(path string, d fs.DirEntry) error {
    fmt.Println(path)
    return nil
})
```

## Match details

```go
result := m.MatchDetail("vendor/module/")
if result.Matched {
    fmt.Printf("Pattern: %s (from %s:%d)\n", result.Pattern, result.Source, result.Line)
    fmt.Printf("Ignored: %v, Negated: %v\n", result.Ignored, result.Negate)
}
```

## Adding patterns programmatically

```go
m := gitignore.New("/path/to/repo")
m.AddPatterns([]byte("*.log\n!important.log"), "")
m.AddFromFile("/path/to/.gitignore", "subdir")
```

## Installation

```bash
go get github.com/git-pkgs/gitignore
```

[View on GitHub](https://github.com/git-pkgs/gitignore)
