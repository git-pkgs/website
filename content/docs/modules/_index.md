---
title: Go Modules
weight: 60
---

git-pkgs is built from a set of Go libraries that handle different aspects of dependency management. Each library is independently usable if you're building your own tooling.

- **archives** reads and browses archive files in memory
- **attestation** parses SLSA Provenance v1 identity fields from sigstore bundles
- **changelog** parses changelog files into structured entries
- **cooldown** filters package versions by publish age
- **enrichment** combines registry and ecosyste.ms lookups behind a single interface
- **forge** fetches repository metadata and drives issues/PRs/CI across git forges
- **gitignore** matches paths against gitignore rules
- **managers** wraps package manager CLIs behind a common interface for install, add, update, and remove
- **manifests** parses lockfiles and manifest files to extract dependency information
- **markup** renders README markup formats to HTML
- **platforms** translates platform identifiers across package ecosystems
- **pom** resolves effective Maven POMs without a JVM
- **purl** handles Package URL parsing and generation
- **registries** fetches package metadata from registry APIs
- **resolve** parses package manager CLI output into dependency trees with PURLs
- **reuse** extracts SPDX license info from REUSE-compliant projects
- **sbom** reads and writes CycloneDX and SPDX documents
- **sigstore** verifies sigstore bundles against the TUF trust root
- **spdx** normalizes and validates license expressions
- **vers** parses version ranges across different ecosystem syntaxes
- **vulns** queries vulnerability databases (OSV, NVD, GitHub Advisories) with PURL-based lookups

{{< cards >}}
  {{< card link="archives" title="archives" subtitle="In-memory archive reading" >}}
  {{< card link="attestation" title="attestation" subtitle="SLSA provenance parsing" >}}
  {{< card link="changelog" title="changelog" subtitle="Changelog file parsing" >}}
  {{< card link="cooldown" title="cooldown" subtitle="Version-age filtering" >}}
  {{< card link="enrichment" title="enrichment" subtitle="Package metadata enrichment" >}}
  {{< card link="forge" title="forge" subtitle="Git forge API client and CLI" >}}
  {{< card link="gitignore" title="gitignore" subtitle="Gitignore pattern matching" >}}
  {{< card link="managers" title="managers" subtitle="Package manager CLI wrapper" >}}
  {{< card link="manifests" title="manifests" subtitle="Manifest and lockfile parsing" >}}
  {{< card link="markup" title="markup" subtitle="Markup to HTML rendering" >}}
  {{< card link="platforms" title="platforms" subtitle="Cross-ecosystem platform mapping" >}}
  {{< card link="pom" title="pom" subtitle="Effective-POM resolution" >}}
  {{< card link="purl" title="purl" subtitle="Package URL handling" >}}
  {{< card link="registries" title="registries" subtitle="Registry API clients" >}}
  {{< card link="resolve" title="resolve" subtitle="Dependency tree parsing" >}}
  {{< card link="reuse" title="reuse" subtitle="REUSE spec parsing" >}}
  {{< card link="sbom" title="sbom" subtitle="SBOM read/write" >}}
  {{< card link="sigstore" title="sigstore" subtitle="Sigstore bundle verification" >}}
  {{< card link="spdx" title="spdx" subtitle="SPDX license utilities" >}}
  {{< card link="vers" title="vers" subtitle="Version range parsing" >}}
  {{< card link="vulns" title="vulns" subtitle="Vulnerability database queries" >}}
{{< /cards >}}
