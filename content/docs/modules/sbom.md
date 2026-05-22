---
title: sbom
---

A Go library for reading and writing Software Bill of Materials documents. Reads CycloneDX and SPDX JSON into a single `Document` / `Package` / `Relationship` model and writes that model back out as CycloneDX (JSON or XML) or SPDX JSON.

```go
import "github.com/git-pkgs/sbom"

data, _ := os.ReadFile("bom.cdx.json")
doc, err := sbom.Parse(data)

fmt.Println(doc.Type)          // cyclonedx
fmt.Println(doc.SpecVersion)   // 1.6
fmt.Println(doc.Document.Name) // my-app

for _, p := range doc.Packages {
    fmt.Println(p.Name, p.Version, p.PURL())
}
```

`Parse` auto-detects the format. `Detect` returns just the type without a full parse and runs in roughly constant time, since it only token-scans top-level keys until it hits a discriminator.

## Generating

```go
s := sbom.New(sbom.TypeCycloneDX)
s.Document = sbom.Document{
    Name:      "my-app",
    Namespace: "https://example.com/my-app",
    Component: sbom.Component{Type: "application", Name: "my-app", Version: "1.2.3"},
    Creators:  []sbom.Creator{{Type: "Tool", Name: "my-tool-1.0"}},
}
s.AddPackage(sbom.Package{
    Name: "lodash", Version: "4.17.21", LicenseDeclared: "MIT",
    ExternalRefs: []sbom.ExternalRef{{Type: "purl", Locator: "pkg:npm/lodash@4.17.21"}},
})

sbom.Encode(os.Stdout, s, sbom.FormatCycloneDXJSON)
sbom.Encode(os.Stdout, s, sbom.FormatSPDXJSON)
```

## Supported formats

| Format | Parse | Encode |
| --- | --- | --- |
| CycloneDX JSON | yes | yes |
| CycloneDX XML | no | yes |
| SPDX JSON | yes | yes |

SPDX parsing unwraps `{"sbom": ...}` and in-toto `{"predicate": ...}` envelopes. XML, YAML, and tag-value parsing are not handled.

Zero dependencies. If you need full spec coverage across every serialisation, use [protobom](https://github.com/protobom/protobom) instead.

## Installation

```bash
go get github.com/git-pkgs/sbom
```

[View on GitHub](https://github.com/git-pkgs/sbom)
