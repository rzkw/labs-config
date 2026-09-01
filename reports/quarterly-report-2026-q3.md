# Quarterly Report — April 22 to August 22, 2026

> **Repositories:** walkable, oci-cloudinfra, ansible, labs-config
> **All repositories owned by rzkw under Walkable LLC**

## Overview

This report covers 4 months of work across 4 repositories. During this period:
- ~170+ commits were made
- ~57 pull requests were merged
- 3 pull requests remain open

| Repo | Commits | Merged PRs | Open PRs |
|------|---------|------------|----------|
| walkable | ~60 | 16 | 0 |
| oci-cloudinfra | ~80+ | 30+ | 1 |
| ansible | ~20 | 7 | 1 |
| labs-config | ~12 | 4 | 1 |
| **Total** | **~170+** | **57+** | **3** |

## How This Work Was Done

All work was carried out by rzkw (admin) under Walkable LLC, with the AI agent (`agent-walkllc`) as a collaborator. Plans were directed by the admin and submitted by the agent. All agent work required manual approval from the admin before merging, often requiring iteration and requests for changes. The agent was not permitted to merge PRs without explicit approval. Workflows were a mix — some written by the admin, some by the agent, with the admin always providing direction.

---

## walkable (Portfolio Site)

### Major Work

**AI SEO (July–August)**
Made the site discoverable to AI tools and search engines. Added structured data, author metadata, and a machine-readable site summary file. Set up automated daily updates to keep this information current. Implemented in phases: first enabling AI bot crawling and sitemap updates, then adding author bio and date information to all blog posts, and finally expanding the site summary with automated syncing.

**CI/Buildx & Tailscale (June–July)**
Built a custom CI pipeline using Docker Buildx on a local ARM machine connected via Tailscale. Added security hardening (SHA-pinned actions, step-security) to all workflows. Iterated on workflow issues including endpoint configuration, driver setup, and network connectivity.

**Content & Layout (August)**
Added a Tech Stack section to the home page. Fixed a 500 error caused by edge runtime on the Open Graph image endpoint. Improved blog post layouts and footer. Added Medium blog link support.

**Dependency Management (April–August)**
Kept dependencies current. Added auto-approve workflows for minor and patch updates. Set up release age requirements for npm packages to avoid installing brand-new, potentially unstable releases.

### Minor Work

- Fixed workflow issues in ts-buildx.yml (driver, endpoint, secret naming)
- Added `.worktrees` to `.gitignore`
- Updated `.npmrc` with comments and min-release-age setting
- Added AGENTS.md with Git Rules and commit signing requirements
- Clarified Walkable LLC focus in README

### Merged PRs Summary

16 PRs were merged, including AI SEO implementation (4 PRs), CI workflow fixes (3 PRs), content and layout updates (4 PRs), and documentation/configuration changes (5 PRs).

### Open PRs

None.

### Unfinished Work

None identified. All major features were merged.

---

## oci-cloudinfra (Cloud Infrastructure — Terraform)

### Major Work

**Infrastructure Setup (June)**
Established the initial cloud infrastructure using Terraform: virtual private cloud networking, compute instances, budgets, and GitHub Actions for automated review. This was the foundation for all subsequent work.

**Security & Hardening (June–July)**
Added in-transit encryption, SSH signing, CIS hardening, and cloud-init for automatic server configuration. Secured all CI jobs with step-security hardening and SHA-pinned actions.

**State Management (August)**
Fixed issues with how Terraform tracks cloud resources. State files were not properly separated between modules. This was resolved in two phases: first restoring distinct per-module state keys, then a full destroy-and-recreate cycle.

**Bastion Module Work (August)**
Added a bastion (secure gateway for server access) and service gateway for managed SSH. Merged the bastion into the VCN module in 6 steps. A plan to split it back into its own module is currently open (PR #77).

**Documentation (July–August)**
Restructured the entire documentation: rewrote the wiki as an internal reference, reorganized READMEs, added OCI API scope documentation, and auto-generated module documentation via terraform-docs.

### Minor Work

- Integrated OCI pricing server into MCP setup for cost checking
- Added instance outputs and cross-module data sharing
- Moved `oci-subnet-setup.sh` to `scripts/` directory
- Fixed terraform-docs trigger to run on pull_request instead of push
- Added opencode.json with OCI + Terraform MCP servers

### Merged PRs Summary

30+ PRs were merged, including infrastructure provisioning (5 PRs), bastion and networking (6 PRs), security hardening (4 PRs), state management (4 PRs), documentation (5 PRs), and CI/configuration (6 PRs).

### Open PRs

| # | Title | Status |
|---|-------|--------|
| [77](https://github.com/rzkw/oci-cloudinfra/pull/77) | feat: split bastion into its own root module | **Open** — waiting for review/merge |

### Unfinished Work

- **Bastion module split (PR #77):** The bastion was merged into the VCN module, but now needs to be split back out for clarity. In progress.
- **Phase B (destroy & recreate):** Plan was merged but execution not yet done.

---

## ansible (Server Automation)

### Major Work

**Playbooks (June–July)**
Created Ansible playbooks for the OCI devbox: a provisioning playbook for new servers, a headless server playbook (runs without user input), cloud-init integration with CIS hardening, and role-based organization.

**Tailscale SSH (July)**
Added support for connecting to servers via Tailscale (private network) using SSH. Uses authentication keys from the OCI metadata service.

**CI/Testing (July)**
Set up the Molecule testing framework for automated playbook testing. Added a CI workflow. Cleaned up the repo layout and fixed linting issues.

### Minor Work

- Standardized repo layout and removed dead files
- Fixed docker_rootless role
- Added ansible-lint and yamllint configuration
- Created roles for base and dev-box tasks
- Added opencode.json with Ansible MCP server

### Merged PRs Summary

7 PRs were merged, including provisioning playbooks (3 PRs), Tailscale SSH (2 PRs), and repo cleanup/configuration (2 PRs).

### Open PRs

| # | Title | Status |
|---|-------|--------|
| [28](https://github.com/rzkw/ansible/pull/28) | docs: plan approval policy + server playbook test plan | **Open** — waiting for review/merge |

### Unfinished Work

- **Plan approval policy (PR #28):** Documentation for how plans are approved before implementation. Not yet merged.
- **Molecule testing:** Framework was set up but test coverage is incomplete.

---

## labs-config (Global Configs & CIS Audit)

### Major Work

**CIS macOS Sequoia Audit (July–August)**
Audited macOS Sequoia against CIS (Center for Internet Security) L1 and L2 benchmarks. Created an implementation plan, built Ansible playbooks for the audit, ran it, and generated a results report (87/98 tests passed, 88.78%). Remediation plan is included in the open PR.

**Global Configuration (July)**
Added a global AGENTS.md file with opencode agent configuration, defining how the AI agent operates across all repos. Added branch isolation rules to Git Rules.

**MCP Integration (July)**
Added global opencode MCP config with GitHub and Atlassian integrations, enabling AI tools to work with GitHub and project management directly.

### Minor Work

- Tested SSH signing for commit verification
- Added homebrew auto-update to .zshrc
- Created zsh backup and sync script
- Added PR review infrastructure (linting, formatting checks)
- Added comment to rsync backup script

### Merged PRs Summary

4 PRs were merged, including the CIS audit plan and implementation (2 PRs), global opencode configuration (1 PR), and a minor rsync script comment (1 PR).

### Open PRs

| # | Title | Status |
|---|-------|--------|
| [30](https://github.com/rzkw/labs-config/pull/30) | report: CIS Sequoia L1+L2 audit results and remediation | **Open** — waiting for review/merge |

### Unfinished Work

- **CIS audit report (PR #30):** Audit results and remediation plan. Not yet merged.

---

## Open Items Across All Repos

| Repo | PR | Title | Status |
|------|----|-------|--------|
| oci-cloudinfra | [#77](https://github.com/rzkw/oci-cloudinfra/pull/77) | feat: split bastion into its own root module | **Open** |
| ansible | [#28](https://github.com/rzkw/ansible/pull/28) | docs: plan approval policy + server playbook test plan | **Open** |
| labs-config | [#30](https://github.com/rzkw/labs-config/pull/30) | report: CIS Sequoia L1+L2 audit results and remediation | **Open** |
