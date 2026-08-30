# CIS macOS 15.0 Level 2 — Headless VM Ansible Playbook

> **Goal:** Harden a headless macOS 15.0 VM to the CIS Level 2 baseline using a single, minimal Ansible playbook that wraps the existing NIST mSCP v2.0 compliance script (`cis_lvl2_macos_15.0_compliance.sh`).

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task.

## Requirements (from user)

- **Headless VM** target.
- **Keep SSH server running** (do NOT disable) — needed for access.
- **Exclude password policy controls entirely** (do not apply).
- **Disable GUI settings** (do not skip) where the benchmark enforces it — since they're unnecessary on headless but harmless to harden.

## Approach

Wrap the existing, validated NIST mSCP compliance script. It already encodes every CIS L2 remediation in native zsh + macOS CLI. Ansible:
1. copies the script to the target,
2. pre-seeds **exemptions** only for SSH + all 8 password-policy rules,
3. runs the script in non-interactive mode `--cfc` (check → fix → check),
4. reports residual non-compliant rules via `--non-compliant` + `--stats`.

This is the "lazy-correct" path: smallest diff, reuses NIST-authoritative remediation logic instead of re-writing ~100 shell tasks by hand.

## Files

```
ansible/
├── playbooks/
│   └── cis-lvl2-hardening.yml          # NEW — the playbook
└── inventories/
    └── cis-lvl2.ini                    # NEW — remote VM inventory template
plans/sequoia-hardening/
└── 2026-08-29-cis-lvl2-headless-ansible-playbook.md   # this plan
```

## Playbook tasks (`cis-lvl2-hardening.yml`)

Host group `cis_lvl2`, `become: yes`, `vars`: `mscp_script_src` pointing at the local guidance_l2 script, `mscp_script_dest=/usr/local/bin/cis_lvl2_macos_15.0_compliance.sh`.

1. **copy** the compliance script to `/usr/local/bin/` with mode `0755`.
2. **command** pre-seed exemptions via `defaults write org.cis_lvl2_macos_15.0.audit <rule> -dict-add exempt 1 exempt_reason "..."` for the 9 rules below.
3. **command** run `cis_lvl2_macos_15.0_compliance.sh --cfc` (remediate then re-scan).
4. **command** `cis_lvl2_macos_15.0_compliance.sh --non-compliant` and `--stats` to surface findings.
5. **assert** SSH rule is now non-compliant (i.e. exempt) — sanity check that SSH was NOT disabled.

## Exempted rules (skipped by script)

**SSH (keep access):** `system_settings_ssh_disable`

**Password policy (all 8, per user):**
- `pwpolicy_account_lockout_enforce`
- `pwpolicy_account_lockout_timeout_enforce`
- `pwpolicy_alpha_numeric_enforce`
- `pwpolicy_custom_regex_enforce`
- `pwpolicy_history_enforce`
- `pwpolicy_max_lifetime_enforce`
- `pwpolicy_minimum_length_enforce`
- `pwpolicy_special_character_enforce`

## GUI / headless settings — APPLIED (not skipped), per user instruction

These run through the script and are disabled/enforced by the benchmark (all "disable" direction already):
- AirPlay receiver, Bluetooth (menu enable, sharing disable), Wi-Fi menu, Safari ×6, show filename extensions, Terminal secure keyboard, hot corners, screen saver + session lock, login window (message, prompt user/pw), guest account + guest SMB, Siri + Improve Siri/dictation + Improve search + Improve assistive voice, personalized advertising, password hints, location services (+ menu).

## Not in playbook

Only the 9 exempted rules above (SSH + password policy). Everything else in the L2 profile runs.

## Verification

- `yamllint` and `ansible-lint` on playbook + plan YAML.
- Placeholder inventory uses `ansible_host`/`ansible_user` vars so the real VM is wired without code changes.

## Open items

- Inventory `cis-lvl2.ini` ships with placeholder host `cis-lvl2-vm` — user fills in SSH host/user (or replaces with real inventory).
- `FileVault`, `Time Machine`, Sleep/Display-Sleep, Time-Server controls are hardware/MDM-dependent; script reports them as findings if inapplicable — acceptable for headless, left to run.
