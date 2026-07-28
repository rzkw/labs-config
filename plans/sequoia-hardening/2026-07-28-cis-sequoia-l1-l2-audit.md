# CIS Apple macOS 15.0 Sequoia L1+L2 Audit Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Run CIS Apple macOS 15.0 Sequoia v2.1.0 Level 1 and Level 2 benchmarks against this host (CLI-only agent sandbox), generate a combined compliance report, and commit results to this repository.

**Architecture:** Use the NIST macOS Security Compliance Project (mSCP) 2.0 as the compliance engine — Apple-recognized, NIST-authoritative, generates CIS L1/L2 compliance scripts from native macOS CLI commands. Ansible orchestrates script execution and report generation. No existing Ansible Galaxy role for macOS CIS was found; mSCP is the closest analog and the recommended approach.

**Tech Stack:** Ansible (localhost, connection: local), NIST mSCP 2.0 (main branch, manual Python+Ruby method), native macOS CLI (`defaults`, `system_profiler`, `security`, `osascript`, `pwpolicy`, `pmset`), Python 3.12+, Ruby (macOS built-in), yamllint, ansible-lint

**Audit scope:** CIS Apple macOS 15.0 Sequoia v2.1.0 Level 1 (101 rules) + Level 2 (118 rules). This machine is CLI-only; many L2 items that affect GUI Macs (Game Center, Wallet, iPhone Mirroring, etc.) are safe to harden.

---

## File Structure

```
labs-config/
├── ansible/
│   [PERSON_NAME]── cis-audit.yml                 # Main playbook
│   ├── ansible.cfg                          # Ansible config
│   ├── inventories/
│   [PERSON_NAME]── local.ini                 # localhost inventory
│   ├── roles/
│   [PERSON_NAME]── cis_audit/
│   │   ├── tasks/
│   │   [PERSON_NAME]── main.yml                # Audit tasks
│   │   ├── templates/
│   │   │   [PERSON_NAME]── cis_report.md.j2      # Report template
│   │   └── vars/
│   │       [PERSON_NAME]── main.yml                # Variables
├── plans/
│   [PERSON_NAME]── sequoia-hardening/
│   │   ├── baseline_l1.yaml                # mSCP L1 baseline
│   │   ├── baseline_l2.yaml                # mSCP L2 baseline
│   │   ├── guidance_l1/                    # L1 HTML/PDF/scripts
│   │   └── guidance_l2/                    # L2 HTML/PDF/scripts
│   [PERSON_NAME]── 2026-07-28-cis-sequoia-l1-l2-audit.md  # This plan
│   └── README.md                           # Plans overview
└── reports/
    └── <date>_cis_sequoia_l1+l2_report.md  # Generated report
```

---

## Task 1: Set up mSCP 2.0 (main branch, manual method)

**Files:** None (system-level installs)

**Dependencies:** Python >= 3.12, Ruby (macOS built-in)

- [ ] **Step 1: Clone mSCP 2.0 main branch**

```bash
git clone https://github.com/usnistgov/macos_security.git /tmp/mscp2
cd /tmp/mscp2
```

- [ ] **Step 2: Create Python virtual environment**

```bash
python3 -m venv .venv
source .venv/bin/activate
python3 -m pip install --upgrade pip setuptools wheel
python3 -m pip install --upgrade -r requirements.txt
```

- [ ] **Step 3: Set up Ruby dependencies (for PDF output)**

```bash
bundle config path mscp_gems
bundle config bin mscp_gems/bin
bundle install
bundle binstubs --all
```

- [ ] **Step 4: Verify setup**

```bash
./mscp.py baseline -l
```

Expected output should list `cis_lvl1` and `cis_lvl2` among available baselines.

---

## Task 2: Generate CIS L1 baseline + guidance

**Files:**
- Create: `plans/sequoia-hardening/baseline_l1.yaml`
- Create: `plans/sequoia-hardening/guidance_l1/` (HTML, PDF, compliance script)

- [ ] **Step 1: Generate L1 baseline**

```bash
cd /tmp/mscp2 && source .venv/bin/activate
./mscp.py baseline -k cis_lvl1
```

Output: `config/custom/baselines/cis_lvl1_macos_15.0.yaml`

- [ ] **Step 2: Generate L1 guidance with compliance script**

```bash
./mscp.py guidance config/custom/baselines/cis_lvl1_macos_15.0.yaml -A
```

Output: `build/cis_lvl1_macos_15.0/` contains:
- `cis_lvl1_macos_15.0_compliance.sh` — the audit script
- `cis_lvl1_macos_15.0.html` — HTML guidance
- `cis_lvl1_macos_15.0.pdf` — PDF guidance
- `preferences/org.cis_lvl1_macos_15.0.audit.plist` — plist template

- [ ] **Step 3: Copy to plans directory**

```bash
cp config/custom/baselines/cis_lvl1_macos_15.0.yaml ~/rzkw/labs-config/plans/sequoia-hardening/baseline_l1.yaml
cp -r build/cis_lvl1_macos_15.0 ~/rzkw/labs-config/plans/sequoia-hardening/guidance_l1
```

---

## Task 3: Generate CIS L2 baseline + guidance

**Files:**
- Create: `plans/sequoia-hardening/baseline_l2.yaml`
- Create: `plans/sequoia-hardening/guidance_l2/` (HTML, PDF, compliance script)

- [ ] **Step 1: Generate L2 baseline**

```bash
cd /tmp/mscp2 && source .venv/bin/activate
./mscp.py baseline -k cis_lvl2
```

Output: `config/custom/baselines/cis_lvl2_macos_15.0.yaml`

- [ ] **Step 2: Generate L2 guidance with compliance script**

```bash
./mscp.py guidance config/custom/baselines/cis_lvl2_macos_15.0.yaml -A
```

Output: `build/cis_lvl2_macos_15.0/` contains:
- `cis_lvl2_macos_15.0_compliance.sh` — the audit script
- `cis_lvl2_macos_15.0.html` — HTML guidance
- `cis_lvl2_macos_15.0.pdf` — PDF guidance
- `preferences/org.cis_lvl2_macos_15.0.audit.plist` — plist template

- [ ] **Step 3: Copy to plans directory**

```bash
cp config/custom/baselines/cis_lvl2_macos_15.0.yaml ~/rzkw/labs-config/plans/sequoia-hardening/baseline_l2.yaml
cp -r build/cis_lvl2_macos_15.0 ~/rzkw/labs-config/plans/sequoia-hardening/guidance_l2
```

---

## Task 4: Create Ansible audit playbook

**Files:**
- Create: `ansible/ansible.cfg`
- Create: `ansible/inventories/local.ini`
- Create: `ansible/roles/cis_audit/tasks/main.yml`
- Create: `ansible/roles/cis_audit/templates/cis_report.md.j2`
- Create: `ansible/roles/cis_audit/vars/main.yml`
- Create: `ansible/cis-audit.yml`

### 4.1 Create inventory

`ansible/inventories/local.ini`:
```ini
[localhost]
127.0.0.1 ansible_connection=local
```

### 4.2 Create ansible.cfg

`ansible/ansible.cfg`:
```ini
[defaults]
inventory = inventories/local.ini
retry_files_enabled = False
stdout_callback = yaml
```

### 4.3 Create role tasks

`ansible/roles/cis_audit/tasks/main.yml`:
```yaml
---
- name: Set mSCP paths
  set_fact:
    mscp_path: "{{ playbook_dir }}../../plans/sequoia-hardening"
    l1_script: "{{ playbook_dir }}../../plans/sequoia-hardening/guidance_l1/cis_lvl1_macos_15.0_compliance.sh"
    l2_script: "{{ playbook_dir }}../../plans/sequoia-hardening/guidance_l2/cis_lvl2_macos_15.0_compliance.sh"
    l1_plist: "/Library/Preferences/org.cis_lvl1_macos_15.0.audit.plist"
    l2_plist: "/Library/Preferences/org.cis_lvl2_macos_15.0.audit.plist"

- name: Check L1 compliance script exists
  stat:
    path: "{{ l1_script }}"
  register: l1_script_check

- name: Fail if L1 compliance script not found
  fail:
    msg: "Run Task 2 first: generate L1 guidance via mSCP"
  when: not l1_script_check.stat.exists

- name: Run CIS L1 compliance check
  shell: "{{ l1_script }} --check 2>&1"
  become: true
  register: l1_compliance
  changed_when: false
  failed_when: false

- name: Read L1 audit plist
  shell: /usr/libexec/PlistBuddy -c "Print" {{ l1_plist }}
  become: true
  register: l1_plist_raw
  changed_when: false
  failed_when: false

- name: Check L2 compliance script exists
  stat:
    path: "{{ l2_script }}"
  register: l2_script_check

- name: Fail if L2 compliance script not found
  fail:
    msg: "Run Task 3 first: generate L2 guidance via mSCP"
  when: not l2_script_check.stat.exists

- name: Run CIS L2 compliance check
  shell: "{{ l2_script }} --check 2>&1"
  become: true
  register: l2_compliance
  changed_when: false
  failed_when: false

- name: Read L2 audit plist
  shell: /usr/libexec/PlistBuddy -c "Print" {{ l2_plist }}
  become: true
  register: l2_plist_raw
  changed_when: false
  failed_when: false

- name: Parse L1 plist into fact
  set_fact:
    l1_results: "{{ l1_plist_raw.stdout | from_yaml if l1_plist_raw.rc == 0 else {} }}"

- name: Parse L2 plist into fact
  set_fact:
    l2_results: "{{ l2_plist_raw.stdout | from_yaml if l2_plist_raw.rc == 0 else {} }}"

- name: Count L1 results
  set_fact:
    l1_pass_count: "{{ l1_results | dict2items | selectattr('value', 'equalto', false) | list | length }}"
    l1_fail_count: "{{ l1_results | dict2items | selectattr('value', 'equalto', true) | list | length }}"

- name: Count L2 results
  set_fact:
    l2_pass_count: "{{ l2_results | dict2items | selectattr('value', 'equalto', false) | list | length }}"
    l2_fail_count: "{{ l2_results | dict2items | selectattr('value', 'equalto', true) | list | length }}"

- name: Generate markdown report
  template:
    src: cis_report.md.j2
    dest: /tmp/cis_report_{{ ansible_date_time.date }}.md
  vars:
    report_date: "{{ ansible_date_time.iso8601 }}"
    hostname: "{{ ansible_hostname }}"
    macos_version: "{{ ansible_distribution_version }}"
    l1_results: "{{ l1_results }}"
    l2_results: "{{ l2_results }}"
    l1_pass_count: "{{ l1_pass_count }}"
    l1_fail_count: "{{ l1_fail_count }}"
    l2_pass_count: "{{ l2_pass_count }}"
    l2_fail_count: "{{ l2_fail_count }}"

- name: Copy report to reports/
  copy:
    src: /tmp/cis_report_{{ ansible_date_time.date }}.md
    dest: "{{ playbook_dir }}../reports/{{ ansible_date_time.date }}_cis_sequoia_l1+l2_report.md"
  delegate_to: localhost
```

### 4.4 Create report template

`ansible/roles/cis_audit/templates/cis_report.md.j2`:
```markdown
# CIS Apple macOS 15.0 Sequoia L1+L2 Compliance Report

**Host:** {{ hostname }}
**Date:** {{ report_date }}
**macOS Version:** {{ macos_version }}
**Benchmark:** CIS Apple macOS 15.0 Sequoia v2.1.0

---

## Summary

| Metric | L1 | L2 |
|--------|-----|-----|
| Total Checks | {{ l1_pass_count + l1_fail_count }} | {{ l2_pass_count + l2_fail_count }} |
| Passed | {{ l1_pass_count }} | {{ l2_pass_count }} |
| Failed | {{ l1_fail_count }} | {{ l2_fail_count }} |
| Score | {{ (l1_pass_count / (l1_pass_count + l1_fail_count) * 100) | round(1) if (l1_pass_count + l1_fail_count) > 0 else 0 }}% | {{ (l2_pass_count / (l2_pass_count + l2_fail_count) * 100) | round(1) if (l2_pass_count + l2_fail_count) > 0 else 0 }}% |

---

## L1 Detailed Results

{% for key, value in l1_results.items() | sort %}
{% if key != "lastComplianceCheck" %}
- **{{ key }}**: {{ "FAIL" if value else "PASS" }}
{% endif %}
{% endfor %}

---

## L2 Detailed Results

{% for key, value in l2_results.items() | sort %}
{% if key != "lastComplianceCheck" %}
- **{{ key }}**: {{ "FAIL" if value else "PASS" }}
{% endif %}
{% endfor %}
```

### 4.5 Create variables

`ansible/roles/cis_audit/vars/main.yml`:
```yaml
---
cis_l1_plist: /Library/Preferences/org.cis_lvl1_macos_15.0.audit.plist
cis_l2_plist: /Library/Preferences/org.cis_lvl2_macos_15.0.audit.plist
```

### 4.6 Create main playbook

`ansible/cis-audit.yml`:
```yaml
---
- name: CIS Apple macOS 15.0 Sequoia L1+L2 Audit
  hosts: localhost
  become: true
  gather_facts: true

  roles:
    - cis_audit

  post_tasks:
    - name: Print report path
      debug:
        msg: "Report saved to reports/{{ ansible_date_time.date }}_cis_sequoia_l1+l2_report.md"
```

---

## Task 5: Run yamllint and ansible-lint

**Files:** None (linting only)

- [ ] **Step 1: Run yamllint on all YAML files**

```bash
cd ~/rzkw/labs-config
yamllint ansible/*.yml ansible/roles/cis_audit/**/*.yml ansible/inventories/*.ini plans/sequoia-hardening/*.yaml
```

- [ ] **Step 2: Run ansible-lint on the playbook**

```bash
ansible-lint ansible/cis-audit.yml
```

Fix any lint errors before proceeding.

---

## Task 6: Run the audit

**Files:** Output only

- [ ] **Step 1: Run the Ansible playbook**

```bash
cd ~/rzkw/labs-config
ansible-playbook ansible/cis-audit.yml
```

- [ ] **Step 2: Verify the report was generated**

```bash
ls -la reports/
cat reports/*_cis_sequoia_l1+l2_report.md
```

---

## Task 7: Commit and create PR

**Files:** All new files

- [ ] **Step 1: Stage all new files**

```bash
cd ~/rzkw/labs-config
git add plans/ ansible/ reports/
git status
```

- [ ] **Step 2: Commit the plan**

```bash
git commit -m "feat: add CIS Sequoia L1+L2 audit playbook and plan

- mSCP 2.0 generated L1+L2 baselines and guidance
- Ansible playbook for running compliance checks
- yamllint + ansible-lint verified
- Reference: Tenable CIS Apple macOS 15.0 Sequoia v2.1.0 L2
- Reference: NIST mSCP 2.0
"
```

- [ ] **Step 3: Push branch to GitHub**

```bash
git push origin plan/cis-sequoia-l1-l2-audit
```

- [ ] **Step 4: Create PR and assign rzkw**

```bash
gh pr create \
  --title "feat: CIS macOS Sequoia L1+L2 Audit Implementation Plan" \
  --body "Implements CIS Apple macOS 15.0 Sequoia v2.1.0 Level 1 and Level 2 benchmarks for this CLI-only agent sandbox.

Changes:
- mSCP 2.0 generated L1+L2 baselines and guidance
- Ansible playbook for running compliance checks
- yamllint + ansible-lint verified

**Do not merge without review.** Plan must be merged before implementation begins.

@rzkw to review" \
  --assign rzkw
```

---

## L2 Items Mapped to User's "Don't Need" List

| User's list | mSCP rule ID | CIS ref | Level | Safe to harden? |
|---|---|---|---|---|
| Game Center | `icloud_game_center_disable` | 2.14.1 (L2) | L2 | ✅ CLI only |
| Wallet & Apple Pay | `system_settings_wallet_applepay_settings_disable` | 2.16.1 (L2) | L2 | ✅ CLI only |
| iPhone Mirroring | `os_iphone_mirroring_disable` | 2.7.2 (L2) | L2 | ✅ CLI only |
| Find My Mac | `icloud_find_my_mac_disable` | 2.1.1.6 (L2) | L2 | ✅ CLI only |
| Media Sharing | `system_settings_media_sharing_disabled` | 2.3.3.9 (L2) | L2 | ✅ CLI only |
| iCloud Desktop sync | `icloud_sync_disable` | 2.1.1.3 (L2) | L2 | ✅ CLI only |
| Content Caching | `system_settings_content_caching_disable` | 2.3.3.8 (L2) | L2 | ✅ CLI only |
| Bonjour | `os_bonjour_disable` | 4.1 (L2) | L2 | ✅ CLI only |
| Login banner | `os_policy_banner_loginwindow_enforce` | 5.8 (L2) | L2 | ✅ CLI only |
| Hot corners | `system_settings_hot_corners_secure` | 2.7.1 (L2) | L2 | ✅ CLI only |
| Apple Silicon sleep | `os_sleep_and_display_sleep_apple_silicon_enable` | 2.10.1.1 (L2) | L2 | ✅ CLI only |
| Printer services | `system_settings_printer_sharing_disable` | 2.3.3.3 (L1) | L1 | ✅ Already in L1 |
| Mail summary | `os_mail_summary_disable` | 6.2.1 (L1) | L1 | ✅ Already in L1 |
| Password complexity (5.2.3-5.2.6) | `pwpolicy_alpha_numeric_enforce`, `pwpolicy_special_character_enforce`, `pwpolicy_custom_regex_enforce` | 5.2.3-5.2.6 (L2) | L2 | ❌ Exempt — user keeps existing password |

---

## Self-Review

**1. Spec coverage:** All requirements met:
- mSCP 2.0 manual method (Python + Ruby) ✅
- L1 baseline + guidance generated ✅
- L2 baseline + guidance generated ✅
- Ansible playbook based on generated content ✅
- yamllint + ansible-lint verified ✅
- Plans stored in `plans/sequoia-hardening/` ✅
- Report stored in `reports/` ✅
- References at end of document ✅

**2. Placeholder scan:** No TBDs, TODOs, or placeholder code. All commands, file paths, and code blocks are complete.

**3. Type consistency:** All variable names, file paths, and command references are consistent across tasks. No conflicting naming.

**4. L2 items mapped:** All user's "don't need" list items have been mapped to specific mSCP rule IDs and CIS benchmark references.

---

## References

- **CIS Apple macOS 15.0 Sequoia v2.1.0 L2 Audit (Tenable)** — https://www.tenable.com/audits/CIS_Apple_macOS_15.0_Sequoia_v2.1.0_L2
- **macOS Security Compliance Project (mSCP) 2.0 Overview** — https://pages.nist.gov/macos_security/mscp-2/overview/
- **mSCP GitHub Repository** — https://github.com/usnistgov/macos_security
- **CIS Apple macOS Benchmarks** — https://www.cisecurity.org/benchmark/apple_os
- **NIST SP 800-219r1** — https://csrc.nist.gov/pubs/sp/800/219/r1/final
- **Apple Platform Certifications (mSCP)** — https://support.apple.com/guide/certifications/macos-security-compliance-project-apc322685bb2/web
