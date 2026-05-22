---
title: forge
aliases:
  - /docs/modules/forges/
---

A Go library and CLI for working with git forges. Routes requests to the right backend based on the URL domain, with a common data model across GitHub, GitLab, Gitea/Forgejo, and Bitbucket Cloud.

```go
import (
    "context"
    "github.com/git-pkgs/forge"
)

client := forges.NewClient(
    forges.WithToken("github.com", os.Getenv("GITHUB_TOKEN")),
)

repo, err := client.FetchRepository(ctx, "https://github.com/lodash/lodash")
if err != nil {
    panic(err)
}
fmt.Printf("%s: %s (%s)\n", repo.FullName, repo.Description, repo.License)

tags, _ := client.FetchTags(ctx, "https://github.com/lodash/lodash")
for _, t := range tags {
    fmt.Printf("%s (%s)\n", t.Name, t.Commit[:8])
}

repos, _ := client.ListRepositories(ctx, "github.com", "lodash", forges.ListRepoOpts{
    Archived: forges.ArchivedExclude,
    Forks:    forges.ForkExclude,
})
```

The `Forge` interface exposes services for repos, issues, pull requests, reviews, releases, CI, branches, labels, milestones, deploy keys, secrets, notifications, files, collaborators, and commit statuses.

```go
f, _ := client.ForgeFor("github.com")
issues, _ := f.Issues().List(ctx, "octocat", "hello-world", forges.ListIssueOpts{State: "open"})
pr, _ := f.PullRequests().Get(ctx, "octocat", "hello-world", 42)
```

## Supported forges

- GitHub (github.com and GitHub Enterprise)
- GitLab (gitlab.com and self-hosted)
- Gitea / Forgejo (codeberg.org and self-hosted)
- Bitbucket Cloud

## Self-hosted instances

```go
import (
    "github.com/git-pkgs/forge/gitea"
    "github.com/git-pkgs/forge/gitlab"
)

client := forges.NewClient(
    forges.WithForge("gitea.example.com", gitea.New("https://gitea.example.com", token, nil)),
    forges.WithForge("gitlab.internal.dev", gitlab.New("https://gitlab.internal.dev", token, nil)),
)

// or auto-detect the forge type
err := client.RegisterDomain(ctx, "git.example.com", token, forges.ForgeBuilders{
    GitHub: github.NewWithBase,
    GitLab: gitlab.New,
    Gitea:  gitea.New,
})
```

## CLI

The `forge` binary is a forge-agnostic alternative to `gh`/`glab`/`tea`. It detects which backend to use from your git remote.

```
forge repo view
forge issue list --state open
forge pr create --title "Fix bug" --head fix-branch
forge release list
forge ci log 67890
forge api repos/{owner}/{repo}
```

Authenticate with `forge auth login`. Tokens are read from CLI flags, then `FORGE_TOKEN` / `GITHUB_TOKEN` / `GITLAB_TOKEN` / `GITEA_TOKEN` / `BITBUCKET_TOKEN`, then `~/.config/forge/config`. Per-project defaults can be set in a `.forge` file at the repo root.

## Installation

```bash
go get github.com/git-pkgs/forge
```

```bash
brew install git-pkgs/git-pkgs/forge
# or
go install github.com/git-pkgs/forge/cmd/forge@latest
```

[View on GitHub](https://github.com/git-pkgs/forge)
