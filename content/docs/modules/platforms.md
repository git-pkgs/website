---
title: platforms
---

A Go library for translating platform identifier strings across package ecosystems. An ARM64 Mac is `darwin/arm64` to Go, `darwin-arm64` to Node, `aarch64-apple-darwin` to Rust, `arm64-darwin` to RubyGems, and `macosx_11_0_arm64` to Python. This package maps between all of them.

```go
import "github.com/git-pkgs/platforms"

// Parse a Rust triple into a canonical platform
p, _ := platforms.Parse(platforms.Rust, "aarch64-apple-darwin")
fmt.Println(p.Arch) // aarch64
fmt.Println(p.OS)   // darwin

// Format for a different ecosystem
goStr, _ := platforms.Format(platforms.Go, p)
fmt.Println(goStr) // darwin/arm64

nodeStr, _ := platforms.Format(platforms.Node, p)
fmt.Println(nodeStr) // darwin-arm64

pyStr, _ := platforms.Format(platforms.Python, p)
fmt.Println(pyStr) // macosx_11_0_arm64
```

## Supported ecosystems

Go, Node, Rust, RubyGems, Python, Debian, LLVM, NuGet, Vcpkg, Conan, Homebrew, Swift, Kotlin, Maven.

## Installation

```bash
go get github.com/git-pkgs/platforms
```

[View on GitHub](https://github.com/git-pkgs/platforms)
