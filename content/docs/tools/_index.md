---
title: Tools
weight: 65
---

Standalone tools built alongside git-pkgs. Each is a single binary (or workflow) that can be used on its own; several share the same Go modules listed in the previous section.

- **brief** detects a project's toolchain, conventions, and security surface
- **proxy** caches package registries with a version-age cooldown filter
- **pin** vendors browser assets without npm
- **outline** reduces a source tree to a structural skeleton for LLMs
- **capcheck** fails CI when Go code gains new privileged capabilities
- **actions** are reusable GitHub Actions wrapping git-pkgs commands
- **skills** is a Claude Code plugin exposing git-pkgs as agent skills

{{< cards >}}
  {{< card link="brief" title="brief" subtitle="Project toolchain detection" >}}
  {{< card link="proxy" title="proxy" subtitle="Caching registry proxy" >}}
  {{< card link="pin" title="pin" subtitle="Browser asset vendoring" >}}
  {{< card link="outline" title="outline" subtitle="Source tree compression" >}}
  {{< card link="capcheck" title="capcheck" subtitle="Go capability drift" >}}
  {{< card link="actions" title="actions" subtitle="Reusable GitHub Actions" >}}
  {{< card link="skills" title="skills" subtitle="Claude Code plugin" >}}
{{< /cards >}}
