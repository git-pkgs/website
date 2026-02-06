---
title: Go Modules
weight: 60
---

git-pkgs is built from a set of Go libraries that handle different aspects of dependency management. Each library is independently usable if you're building your own tooling.

- **manifests** parses lockfiles and manifest files to extract dependency information
- **managers** wraps package manager CLIs behind a common interface for install, add, update, and remove
- **registries** fetches package metadata from registry APIs
- **enrichment** combines registry and ecosyste.ms lookups behind a single interface
- **vulns** queries vulnerability databases (OSV, NVD, GitHub Advisories) with PURL-based lookups
- **purl** handles Package URL parsing and generation
- **vers** parses version ranges across different ecosystem syntaxes
- **spdx** normalizes and validates license expressions

{{< cards >}}
  {{< card link="enrichment" title="enrichment" subtitle="Package metadata enrichment" >}}
  {{< card link="managers" title="managers" subtitle="Package manager CLI wrapper" >}}
  {{< card link="manifests" title="manifests" subtitle="Manifest and lockfile parsing" >}}
  {{< card link="purl" title="purl" subtitle="Package URL handling" >}}
  {{< card link="registries" title="registries" subtitle="Registry API clients" >}}
  {{< card link="spdx" title="spdx" subtitle="SPDX license utilities" >}}
  {{< card link="vers" title="vers" subtitle="Version range parsing" >}}
  {{< card link="vulns" title="vulns" subtitle="Vulnerability database queries" >}}
{{< /cards >}}
