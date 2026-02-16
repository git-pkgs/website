---
title: Go Modules
weight: 60
---

git-pkgs is built from a set of Go libraries that handle different aspects of dependency management. Each library is independently usable if you're building your own tooling.

- **archives** reads and browses archive files in memory
- **changelog** parses changelog files into structured entries
- **enrichment** combines registry and ecosyste.ms lookups behind a single interface
- **forges** fetches repository metadata from git forges
- **gitignore** matches paths against gitignore rules
- **managers** wraps package manager CLIs behind a common interface for install, add, update, and remove
- **manifests** parses lockfiles and manifest files to extract dependency information
- **platforms** translates platform identifiers across package ecosystems
- **purl** handles Package URL parsing and generation
- **registries** fetches package metadata from registry APIs
- **spdx** normalizes and validates license expressions
- **vers** parses version ranges across different ecosystem syntaxes
- **vulns** queries vulnerability databases (OSV, NVD, GitHub Advisories) with PURL-based lookups

{{< cards >}}
  {{< card link="archives" title="archives" subtitle="In-memory archive reading" >}}
  {{< card link="changelog" title="changelog" subtitle="Changelog file parsing" >}}
  {{< card link="enrichment" title="enrichment" subtitle="Package metadata enrichment" >}}
  {{< card link="forges" title="forges" subtitle="Git forge API clients" >}}
  {{< card link="gitignore" title="gitignore" subtitle="Gitignore pattern matching" >}}
  {{< card link="managers" title="managers" subtitle="Package manager CLI wrapper" >}}
  {{< card link="manifests" title="manifests" subtitle="Manifest and lockfile parsing" >}}
  {{< card link="platforms" title="platforms" subtitle="Cross-ecosystem platform mapping" >}}
  {{< card link="purl" title="purl" subtitle="Package URL handling" >}}
  {{< card link="registries" title="registries" subtitle="Registry API clients" >}}
  {{< card link="spdx" title="spdx" subtitle="SPDX license utilities" >}}
  {{< card link="vers" title="vers" subtitle="Version range parsing" >}}
  {{< card link="vulns" title="vulns" subtitle="Vulnerability database queries" >}}
{{< /cards >}}
