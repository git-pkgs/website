# git-pkgs.dev

Documentation website for [git-pkgs](https://github.com/git-pkgs/git-pkgs), built with [Hugo](https://gohugo.io/) and the [Hextra](https://github.com/imfing/hextra) theme.

## Local development

```bash
hugo server
```

Open http://localhost:1313

## Build

```bash
hugo --minify
```

Output is in `public/`.

## Structure

```
content/
├── _index.md           # Homepage
└── docs/
    ├── _index.md       # Docs landing
    ├── getting-started.md
    ├── vulnerabilities.md
    ├── licenses.md
    ├── outdated.md
    ├── stale.md
    ├── integrity.md
    ├── sbom.md
    ├── ci-cd.md
    ├── bisect.md
    ├── managing-packages.md
    └── modules/        # Go library docs
```

## Deployment

Pushes to `main` trigger GitHub Actions to build and deploy to GitHub Pages.
