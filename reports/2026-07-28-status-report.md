# CIS Sequoia L1+L2 Audit — Status Report

**Date:** 2026-07-28
**Branch:** `plan/cis-sequoia-l1-l2-audit`
**Repo:** `rzkw/labs-config`

---

## Current State

### Completed
1. **mSCP 2.0 Setup** — cloned, Python venv created, Ruby deps installed, `mscp.py baseline -l` verified
2. **L1 Baseline Generated** — `cis_lvl1_macos_15.0.yaml` (98 rules) in `plans/sequoia-hardening/baseline_l1.yaml`
3. **L1 Guidance Generated** — `.md`, `.json`, `.sh` in `guidance_l1/`
4. **L2 Baseline Generated** — `cis_lvl2_macos_15.0.yaml` (118 rules) in `plans/sequoia-hardening/baseline_l2.yaml`
5. **L2 Guidance Generated** — `.md`, `.json`, `.sh` in `guidance_l2/`
6. **Ansible Playbook Created** — `ansible/cis-audit.yml` with role `cis_audit`
7. **Linting Passed** — yamllint + ansible-lint pass with `production` profile
8. **Playbook Runs** — completes with `ok=15, changed=2, failed=0`
9. **Plist Files Generated** — `/Library/Preferences/org.cis_lvl1_macos_15.0.audit.plist` and L2 equivalent

### What's Broken — The plist parsing logic

The compliance scripts generate plist files with this structure:

```
{
  "rule_id": {
    "finding": true/false
  },
  "lastComplianceCheck": "2026-07-29T04:48:31Z"
}
```

**Not** a flat `{ "rule_id": true/false }` dictionary.

The current Ansible tasks assume a flat structure:
- `l1_results | dict2items | selectattr('value', 'equalto', false)` — expects value to be a boolean
- But value is a dict `{ "finding": true/false }`, so `selectattr('value', 'equalto', false)` never matches

This means the report shows 0 results despite the plist being correctly populated.

### Root cause
The plan's Ansible tasks were written assuming a flat plist structure. The actual mSCP plist structure is nested: each rule key maps to a dict with a `finding` boolean.

### Fix needed
The Ansible tasks need to:
1. Extract `finding` from each nested dict: `cis_audit_l1_results | dict2items | map(attribute='value.finding')`
2. Or flatten the dict in a `set_fact` task before counting

### User note
- `sudo visudo` was configured for passwordless sudo — **reminder to remove after audit completes**

---

## Files

| Path | Status |
|------|--------|
| `ansible/cis-audit.yml` | Created |
| `ansible/ansible.cfg` | Created |
| `ansible/inventories/local.ini` | Created |
| `ansible/roles/cis_audit/tasks/main.yml` | Created |
| `ansible/roles/cis_audit/templates/cis_report.md.j2` | Created |
| `ansible/roles/cis_audit/vars/main.yml` | Created |
| `plans/sequoia-hardening/PLAN.md` | Already merged (PR #24) |
| `plans/sequoia-hardening/baseline_l1.yaml` | Generated |
| `plans/sequoia-hardening/baseline_l2.yaml` | Generated |
| `plans/sequoia-hardening/guidance_l1/cis_lvl1_macos_15.0_compliance.sh` | Generated |
| `plans/sequoia-hardening/guidance_l1/cis_lvl1_macos_15.0_en.md` | Generated |
| `plans/sequoia-hardening/guidance_l1/cis_lvl1_macos_15.0.json` | Generated |
| `plans/sequoia-hardening/guidance_l2/cis_lvl2_macos_15.0_compliance.sh` | Generated |
| `plans/sequoia-hardening/guidance_l2/cis_lvl2_macos_15.0_en.md` | Generated |
| `plans/sequoia-hardening/guidance_l2/cis_lvl2_macos_15.0.json` | Generated |
| `reports/2026-07-28_cis_sequoia_l1+l2_report.md` | Generated (0 results due to parsing bug) |
| `.yamllint` | Created |

## Next Step
Fix the plist parsing logic in `ansible/roles/cis_audit/tasks/main.yml` to handle the nested dict structure, then re-run the audit.
