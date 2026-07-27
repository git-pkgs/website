---
title: sarif
---

A Go library for reading, writing, and validating SARIF 2.1.0 logs. Types are generated from the bundled JSON schema, and `Validate` checks a `*sarif.Log` against that schema at runtime.

```go
import "github.com/git-pkgs/sarif"

result := sarif.NewResult()
result.RuleID = "no-unused-vars"
result.Level = "warning"
result.Message = sarif.Message{Text: "Variable 'x' is unused"}

loc := sarif.NewLocation()
loc.PhysicalLocation = sarif.PhysicalLocation{
    ArtifactLocation: sarif.ArtifactLocation{URI: "src/main.go"},
    Region:           sarif.Region{StartLine: 10, StartColumn: 5},
}
result.Locations = []sarif.Location{loc}

report := &sarif.Log{
    Version: "2.1.0",
    Runs: []sarif.Run{{
        Tool:    sarif.Tool{Driver: sarif.ToolComponent{Name: "my-linter", Version: "1.0.0"}},
        Results: []sarif.Result{result},
    }},
}

if err := sarif.Validate(report); err != nil {
    log.Fatal(err)
}
sarif.Dump(report, os.Stdout, true)
```

Use the generated `New<Type>` constructors for types that carry schema defaults; they initialise sentinel values such as `-1` so unset indexes and offsets are omitted rather than serialised as meaningful zeroes.

## Parsing

```go
data, _ := os.ReadFile("results.sarif")
l, _ := sarif.Parse(data)

for _, run := range l.Runs {
    fmt.Println(run.Tool.Driver.Name)
    for _, r := range run.Results {
        fmt.Println(r.RuleID, r.Message.Text)
    }
}
```

`Valid(l)` returns a boolean; `Validate(l)` returns the schema error. Regenerate the types with `go generate ./...`, which runs `cmd/sarifgen` against the bundled schema.

## Installation

```bash
go get github.com/git-pkgs/sarif
```

[View on GitHub](https://github.com/git-pkgs/sarif)
