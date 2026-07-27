---
title: licensecheck
---

A fork of [google/licensecheck](https://github.com/google/licensecheck) that classifies license text against the SPDX corpus. This fork precomputes the matcher DFA at `go generate` time and embeds it as a compressed binary, so `Scan` starts immediately instead of building the automaton on first use, and caps the markdown pre-scan to avoid quadratic behaviour on long README-style files. The API is unchanged.

```go
import "github.com/git-pkgs/licensecheck"

data, _ := os.ReadFile("LICENSE")
cov := licensecheck.Scan(data)

fmt.Printf("%.1f%% covered\n", cov.Percent)
for _, m := range cov.Match {
    fmt.Println(m.ID, m.Type, m.Start, m.End)
}
```

`Scan` returns a `Coverage` with the fraction of the input matched and a slice of `Match` values, each carrying the SPDX identifier, byte range, and whether it matched by text or by URL. The scanner recognises the SPDX license list plus a handful of extras and is designed never to produce a false positive.

Use this fork if you call `Scan` at process start (`brief` does) or on many files in a batch and the upstream cold-start cost matters. Otherwise the upstream package works identically.

## Installation

```bash
go get github.com/git-pkgs/licensecheck
```

[View on GitHub](https://github.com/git-pkgs/licensecheck)
