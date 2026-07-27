# Agent Configuration

## Workflow
- Always follow GitHub Flow: branch → implement → commit → push → PR → delete branch after merge
- **Every commit must be followed by a PR**: after pushing, immediately open a PR using `gh pr create`

## GitHub
- Username: `agent-walkllc`
- Email: `agent@walk-llc.com`
- gh CLI: authenticated (OAuth token, scopes: gist, read:org, repo)
- MCP PAT: `GitHub_MCP_PAT` in Bitwarden (30-day expiry, scopes: repo, project, read:user, read:org, gist)

## Bitwarden
- Email: `agent@walk-llc.com`
- CLI: installed at `/home/agent-walkllc/.local/bin/bw`
- Session: `BW_SESSION` env var (ephemeral)

## SSH
- Auth key: `~/.ssh/id_ed25519`
- Signing key: `~/.ssh/agent-gh-signing` (ed25519, registered as commit signing key)
- Config: `~/.ssh/config` with `Host github.com` entry

## MCP Configuration
- Global: `~/.config/opencode/opencode.jsonc` → `https://api.github.com/mcp`
- Project: `.mcp.json` in workspace
- Auth: `GH_TOKEN` from Bitwarden via direnv

## Git Protocol
- HTTPS via gh CLI OAuth token (git_protocol = https)

## Commit Signing
- ALL commits MUST be signed using SSH key `~/.ssh/agent-gh-signing`
- Signing email: `288607573+agent-walkllc@users.noreply.github.com`
- Use explicit `-S` flag on every `git commit` (e.g., `git commit -S -m "..."`)
- Ensure `gpg.format = ssh` is set: `git config gpg.format ssh`
- Before committing, verify signing is configured: `git config user.signingkey`, `git config gpg.format`, and `git config user.email` must return expected values
- If `gpg.format` is not `ssh`, `user.signingkey` is not `~/.ssh/agent-gh-signing.pub`, or `user.email` is not `288607573+agent-walkllc@users.noreply.github.com`, set them before committing

## Git Rules

- **Never force push.** `git push --force` is forbidden on any branch. Use `--force-with-lease` when necessary.
- **Always rebase, never merge.** Keep a linear history. Use `git pull --rebase` to incorporate upstream changes.
- **Rebase before every push.** Rebasing onto the target branch before pushing avoids merge conflicts.

## Bash Token Optimization

Always minimize token usage when calling the bash tool:

- **Batch independent calls**: Combine related commands with `&&` into single bash calls instead of separate tool invocations
- **Use built-in tools**: Prefer `read`, `grep`, `glob` tools over bash equivalents for file operations
- **Shorter alternatives**: Use `rg` over `grep -r`, `fd` over `find -name`
- **Suppress verbose output**: Add `-q`/`--quiet` flags, use `2>/dev/null`, or `| tail -1` to limit output
- **One-liners**: Chain operations with `&&` or `;` when they're sequential but independent

Example pattern:
```bash
# Instead of 3 separate tool calls:
systemctl status docker containerd && df -h
```

## Docker
- **Rootless context only.** Never switch to `default` or rootful context. Use `sg docker -c "..."` prefix if current session needs group membership.

## Boundaries

- ✅ **Always:** Follow naming conventions
- 🚫 **Never:** Commit secrets or API keys
