---
title: sigstore
---

A thin sigstore-go wrapper that validates a sigstore bundle against the live (or cached) Sigstore TUF trust root. Handles any `(digestAlg, digest)` pair, so npm tarball (`sha512`), GitHub artifact (`sha256`), PyPI distribution, Maven Central, and Cargo package attestations all use the same code path.

```go
import (
    "crypto/sha512"

    "github.com/sigstore/sigstore-go/pkg/root"

    "github.com/git-pkgs/sigstore"
)

tr, err := root.FetchTrustedRoot()
if err != nil {
    return err
}

v := sigstore.New(tr)
digest := sha512.Sum512(artifactBytes)
err = v.VerifyBundle(ctx, bundleBytes, "sha512", digest[:])
```

`VerifyBundle` returns nil when the bundle's Fulcio cert chains to the trust root, the Rekor inclusion proof is valid, the DSSE envelope signature matches the cert, and the in-toto subject digest matches the supplied `(digestAlg, digest)`.

`*Verifier` structurally satisfies a one-method `VerifyBundle(ctx, body, alg, digest) error` interface, so consumers can declare that locally and swap in other verifiers (witness, SBOMit, plain in-toto) without a shared interface package.

sigstore-go is a heavy dependency (TUF, Fulcio, Rekor, x509, protobuf). Importing this package opts in explicitly; for identity-field extraction without verification, use [attestation](../attestation/) instead.

## Installation

```bash
go get github.com/git-pkgs/sigstore
```

[View on GitHub](https://github.com/git-pkgs/sigstore)
