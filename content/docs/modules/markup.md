---
title: markup
---

A Go library for rendering markup files to HTML. Given a filename and its contents, it picks the right renderer and produces HTML. Markdown and Org-mode are rendered natively in Go; other formats shell out to external tools.

```go
import "github.com/git-pkgs/markup"

r := markup.NewDefaultRegistry()

result, err := r.Render("README.md", content)
fmt.Println(result.HTML)
fmt.Println(result.Format) // "Markdown"
```

The default registry comes with all supported formats configured. Native formats always work; external formats return `markup.ErrToolNotFound` if the required tool isn't on `$PATH`, and unrecognised extensions return `markup.ErrUnsupportedFormat`.

## Supported formats

| Format | Extensions | Renderer |
|---|---|---|
| Markdown | .md, .markdown, .mdown, .mkdn, .mdn, .mdtext, .livemd | goldmark (native) |
| Org-mode | .org | go-org (native) |
| AsciiDoc | .adoc, .asciidoc, .asc | asciidoctor (external) |
| reStructuredText | .rst, .rest, .rst.txt | rst2html (external) |
| Pod | .pod | pod2html (external) |
| Textile | .textile | consumer-provided |
| MediaWiki | .mediawiki, .wiki | consumer-provided |
| Creole | .creole | consumer-provided |
| RDoc | .rdoc | consumer-provided |

## Custom renderers

```go
r := markup.NewRegistry()

r.Register(markup.FormatMarkdown, markup.NewMarkdownRenderer(), ".md", ".markdown")

r.Register(markup.FormatTextile, markup.NewExternalRenderer(markup.ExternalConfig{
    Command: "pandoc",
    Args:    []string{"-f", "textile", "-t", "html"},
}), ".textile")

r.RegisterFilename(markup.FormatMarkdown, markup.NewMarkdownRenderer(), "README")
```

## Installation

```bash
go get github.com/git-pkgs/markup
```

[View on GitHub](https://github.com/git-pkgs/markup)
