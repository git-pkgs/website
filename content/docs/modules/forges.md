---
title: forges
---

A Go library for fetching repository metadata from git forges. Routes requests to the right backend based on the URL domain, with a common data model across all forges.

```go
import (
    "context"
    "github.com/git-pkgs/forges"
)

client := forges.NewClient(
    forges.WithToken("github.com", os.Getenv("GITHUB_TOKEN")),
)

repo, err := client.FetchRepository(ctx, "https://github.com/lodash/lodash")
if err != nil {
    panic(err)
}
fmt.Printf("%s: %s (%s)\n", repo.FullName, repo.Description, repo.License)

// Fetch tags
tags, _ := client.FetchTags(ctx, "https://github.com/lodash/lodash")
for _, t := range tags {
    fmt.Printf("%s (%s)\n", t.Name, t.Commit[:8])
}

// List repositories for an owner
repos, _ := client.ListRepositories(ctx, "github.com", "lodash", forges.ListOptions{
    Archived: forges.ArchivedExclude,
    Forks:    forges.ForkExclude,
})
```

## Supported forges

- GitHub (github.com and GitHub Enterprise)
- GitLab (gitlab.com and self-hosted)
- Gitea / Forgejo (codeberg.org and self-hosted)
- Bitbucket

## Self-hosted instances

```go
client := forges.NewClient(
    forges.WithGitea("gitea.example.com", token),
    forges.WithGitLab("gitlab.example.com", token),
)

// Or auto-detect the forge type
client.RegisterDomain(ctx, "git.example.com", token)
```

## Installation

```bash
go get github.com/git-pkgs/forges
```

[View on GitHub](https://github.com/git-pkgs/forges)
