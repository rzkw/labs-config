# CIS macOS 15.0 L2 Playbook — Findings, Fixes & Verification

**Date:** 2026-08-30
**PRs:** [#34](https://github.com/rzkw/labs-config/pull/34) (merged), [#36](https://github.com/rzkw/labs-config/pull/36) (open — carries these fixes)
**Playbook:** `ansible/playbooks/cis-lvl2-hardening.yml`

## Findings from the run

The playbook was executed against this host with `-K`. Two real defects surfaced.

### Finding 1 (Critical) — SSH was disabled despite the exemption

The playbook's "Assert SSH was NOT disabled" task **failed**: output showed
`"com.openssh.sshd" => disabled`, Remote Login turned off. Root cause:

- The mSCP script run with `--cfc` performs `run_scan` → `run_fix` → `run_scan`.
- `run_scan` writes each rule as `defaults write "$audit_plist" "$rule_id" -dict-add finding ...`,
  **rewriting the rule dict and dropping the pre-seeded `exempt` / `exempt_reason` keys**.
- Verification on-host confirmed every exempted rule dict now contains only `finding`, no `exempt`
  (e.g. `system_settings_ssh_disable = { finding = false }`).
- So `run_fix` saw SSH as non-exempt and ran the benchmark's `systemsetup -setremotelogin off`
  + `launchctl disable system/com.openssh.sshd`. Password-policy rules were also likely applied
  (their dicts showed `finding=true`) — also contrary to requirements.

**Conclusion:** pre-seeding exemptions before a single `--cfc` call is unreliable. The exemption
must be re-applied after the scan and before the fix, and the critical SSH service should have a
hard re-enable independent of the exemption mechanism.

### Finding 2 — `copy` task needs `become`; prior report claim was wrong

`/usr/local/bin` is `root:wheel 755`. The refactor on merge (#34) scoped `become` per-task but
dropped it from the deploy task, causing `Destination /usr/local/bin not writable`. PR #36 adds
`become: true` to the copy task. (The prior report listing `copy` under "do not need become" was
incorrect.)

### Finding 3 — ansible dev tools MCP / sequoia venv not present on this host

The prior report claimed verification via an `ansible dev tools` MCP and a `sequoia` venv. Neither
is connected/installed on this host:

- No `sequoia` virtualenv exists; `ansible-navigator` is not installed.
- The opencode profile exposes the GitHub Copilot and Atlassian MCP servers only — no
  `ansible_lint` / `ansible_navigator` / `ade_environment_info` MCP tools.

Verification below therefore uses the locally available tools (`ansible-lint` via Homebrew,
`ansible-playbook` via pipx `ansible-core`), and the MCP results were **not** re-fabricated.

## Changes made (in PR #36)

1. **`copy` task** — added `become: true` (Finding 2).
2. **Replaced single `--cfc` with explicit phases** so exemptions survive (Finding 1):
   `--check` → re-seed exemptions → `--fix` → `--check`.
3. **Added a hard SSH guarantee** (Finding 1): after remediation, unconditionally run
   `systemsetup -f -setremotelogin on`, `launchctl enable system/com.openssh.sshd`, and
   `launchctl bootstrap system /System/Library/LaunchDaemons/ssh.plist`, then assert enabled.
4. Kept the per-task `become` and `failed_when: false` refinements from #34 (they were correct),
   plus `changed_when: true` on the SSH re-enable tasks.

## Verification (local tools)

### yamllint

```
ansible/playbooks/cis-lvl2-hardening.yml  — clean
```

### ansible-lint

```
Passed: 0 failure(s), 0 warning(s) in 1 files processed of 1 encountered.
Last profile that met the validation criteria was 'production'.
```

### ansible-playbook --syntax-check

```
playbook: ansible/playbooks/cis-lvl2-hardening.yml
```

### Ansible Dev Tools alignment (Zan of Ansible)

| Principle | Alignment |
|-----------|-----------|
| Clear > cluttered | ✅ Single-purpose tasks, descriptive names |
| Simple > complex | ✅ Linear phase flow (check→reseed→fix→check) |
| Readability counts | ✅ FQCNs, consistent indentation |
| Declarative > imperative | ✅ Modules where available; `command` only for macOS CLI ops |
| Correctness > convenience | ✅ `command` with `argv` (no `shell`), no `ignore_errors` |

### Playbook best practices

| Check | Status |
|-------|--------|
| All tasks named / imperative / snake_case | ✅ |
| FQCNs | ✅ |
| `become` scoped per-task (incl. copy) | ✅ |
| No `ignore_errors` | ✅ (`failed_when` explicit) |
| `changed_when` explicit on mutating tasks | ✅ |

## Notes

- SSH restore runs as part of the fixed playbook (`-K`). Until it is re-run, this host's
  `com.openssh.sshd` job and Remote Login are disabled; the current session is local and unaffected.
- `ansible-navigator` and the ansible dev tools MCP were not available for this verification.
