---
title: archives
---

A Go library for reading and browsing archive files entirely in memory. Supports ZIP, TAR (with gzip, bzip2, xz compression), and Ruby gems.

```go
import (
    "os"
    "github.com/git-pkgs/archives"
)

f, _ := os.Open("package.tar.gz")
defer f.Close()

reader, err := archives.Open("package.tar.gz", f)
if err != nil {
    panic(err)
}
defer reader.Close()

// List all files
files, _ := reader.List()
for _, f := range files {
    fmt.Printf("%s (%d bytes)\n", f.Path, f.Size)
}

// Browse a directory
entries, _ := reader.ListDir("src")
for _, e := range entries {
    fmt.Println(e.Name)
}

// Extract a single file
rc, _ := reader.Extract("src/main.go")
defer rc.Close()
content, _ := io.ReadAll(rc)
```

## Supported formats

- ZIP (.zip, .jar, .whl, .nupkg, .egg)
- TAR (.tar, .tar.gz, .tgz, .tar.bz2, .tar.xz)
- GEM (.gem)

## Stripping path prefixes

Some archives wrap content in a directory (npm packages use `package/`). `OpenWithPrefix` strips that away:

```go
reader, _ := archives.OpenWithPrefix("pkg.tgz", f, "package/")
// paths are now relative to the package root
```

## Installation

```bash
go get github.com/git-pkgs/archives
```

[View on GitHub](https://github.com/git-pkgs/archives)
