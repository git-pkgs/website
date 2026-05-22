---
title: attestation
---

Parses a sigstore bundle's DSSE envelope and the in-toto statement inside it, returning the SLSA Provenance v1 identity fields: predicate type, builder, source repository, source revision, signer identity.

npm, PyPI trusted publishing, Maven Central, Cargo, and GitHub artifact attestations all emit the same DSSE-wrapped in-toto statement, so one parser serves all of them.

```go
import "github.com/git-pkgs/attestation"

att, err := attestation.Parse(bundleBytes)
if err != nil {
    return err
}
if att == nil {
    return nil // not a SLSA Provenance v1 statement
}
fmt.Println(att.BuilderID, att.SourceRepository, att.SourceRevision)
```

`Parse` returns `(nil, nil)` for an empty body or a bundle whose DSSE payload is empty (some sigstore bundles carry non-SLSA predicates that this parser intentionally ignores). It only errors on malformed DSSE or in-toto JSON.

This extracts identity fields. It does not verify the signature, certificate chain, or transparency log inclusion proof. Pair it with [sigstore](../sigstore/) for verification. The split is deliberate: parsing identity is stdlib-only and useful when you just want to record what was claimed (SBOMs, audit logs); verification pulls in sigstore-go and TUF.

## Installation

```bash
go get github.com/git-pkgs/attestation
```

Stdlib only.

[View on GitHub](https://github.com/git-pkgs/attestation)
