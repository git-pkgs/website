---
title: distill
---

Trains a small multi-label classifier that assigns [oss-taxonomy](https://github.com/ecosyste-ms/oss-taxonomy) terms to a repository from code-derived signals: [brief](../brief) detection output, [outline](../outline) identifiers, and structural facts, with the README as an optional and explicitly-distrusted input. An LLM teacher labels a corpus at curation time; the trained student runs offline inside brief at scan time and generalises to repos the teacher never saw.

Needs `brief` and `claude` on `PATH`.

```
distill classify pkg:pypi/torch pkg:gem/rails > labels.jsonl
distill extract  pkg:pypi/torch pkg:gem/rails > features.jsonl
distill corpus   -from corpus/seed.txt -labels labels.jsonl -features features.jsonl
distill analyse  labels.jsonl
```

`classify` shells to `claude -p` (using your existing Claude Code login) and emits one JSON line per package with `{tags: [{facet, term, evidence, evidence_kind, confidence}], unclassified, cost_usd}`. `extract` produces the deterministic feature record with no model call. `corpus` clones each target once, writes both the label and feature records, and skips inputs that already succeeded so an interrupted run resumes where it stopped. `analyse` summarises a labels file: success/error breakdown, evidence grounding, per-facet coverage, top terms, and clustered unclassified themes that feed back into oss-taxonomy term proposals.

## Generators

```
go generate ./...                       # regenerate cmd/distill/{terms,vocab}.txt
go run ./tools/gencorpus                # fetch top-deps + rebuild corpus/seed.txt
go run ./tools/gencorpus -fetch=false   # rebuild seed from existing top-deps.txt
```

`tools/genvocab` reads a local oss-taxonomy `combined-taxonomy.json` and writes the embedded vocabulary; `tools/gencorpus` builds the seed from packages.ecosyste.ms plus `corpus/knowledge.txt`.

## Installation

```bash
go install github.com/git-pkgs/distill/cmd/distill@latest
```

[View on GitHub](https://github.com/git-pkgs/distill)
