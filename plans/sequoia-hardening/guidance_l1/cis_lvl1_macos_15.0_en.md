<style>
  * {
    text-align: left;
  }

  table {
    border-collapse: collapse;
  }

  td {
    vertical-align: top;
  }

  .outer-table {
    width: 100%;
    border: 1px solid;
  }

  .outer-table td {
    padding: 10px;
  }

  .nested-table {
    border: none;
    width: 100%;
    background-color: none;
  }

  .nested-table td {
    padding: 8px 16px;
    border-left: 1px solid;
  }

  .nested-table td:first-child {
    border-left: none;
  }

  .remediation {
    border: 1px solid;
    width: 100%;
    border-radius: 10px;
  }

  .remediation td, .remediation tr {
    border: none;
    width: 100%;
  }
</style>

#


## Foreword
The macOS Security Compliance Project is an open source effort to provide a programmatic approach to generating security guidance. The configuration settings in this document were derived from National Institute of Standards and Technology (NIST) Special Publication (SP) 800-53, _Security and Privacy Controls for Information Systems and Organizations_, Revision 5.

This project can be used as a resource to easily create customized security baselines of technical security controls by leveraging a library of atomic actions which are mapped to the compliance requirements defined in NIST SP 800-53 (Rev. 5). It can also be used to develop customized guidance to meet the particular cybersecurity needs of any organization.

The objective of this effort was to simplify and radically accelerate the process of producing up-to-date macOS security guidance that is also accessible to any organization and tailorable to meet each organization's specific security needs.

Any and all risk based decisions to tailor the content produced by this project in order to meet the needs of a specific organization shall be approved by the responsible Information System Owner (ISO) and Authorizing Official (AO) and formally documented in their System Security Plan (SSP). While the project attempts to provide settings to meet compliance requirements, it is recommended that each rule be reviewed by your organization's Information System Security Officer (ISSO) prior to implementation.

## Scope

This guide describes the actions to take when securing a macOS 15.0 system against the configuration requirements outlined in the  Center for Internet Security (CIS) Benchmark for the Level 1 Profile.


## Maintainers and Contributors
*macOS Security Compliance Project*

CIS Critical Security Controls® (CIS Controls®) are referenced with the permission and support of the Center for Internet Security® (CIS®)

<table>
  <tr>
    <td>Bob Gendler</td>
    <td>National Institute of Standards and Technology</td>
  </tr>
  <tr>
    <td>Dan Brodjieski</td>
    <td>National Aeronautics and Space Administration</td>
  </tr>
  <tr>
    <td>Allen Golbig</td>
    <td>Jamf</td>
  </tr>
  <tr>
    <td>Edward Byrd</td>
    <td>Center for Internet Security</td>
  </tr>
</table>


## Acronyms and Definitions

### Acronyms and Abbreviations

<table>
<tr>
<td>ABM</td>
<td>Apple Business (formerly Apple Business Manager)</td>
</tr>
<tr>
<td>AES</td>
<td>Advanced Encryption Standard</td>
</tr>
<tr>
<td>AO</td>
<td>Authorizing Official</td>
</tr>
<tr>
<td>APFS</td>
<td>Apple File System</td>
</tr>
<tr>
<td>ARD</td>
<td>Apple Remote Desktop</td>
</tr>
<tr>
<td>ASL</td>
<td>Apple System Log</td>
</tr>
<tr>
<td>ASLR</td>
<td>Address Space Layout Randomization</td>
</tr>
<tr>
<td>ASM</td>
<td>Apple School Manager</td>
</tr>
<tr>
<td>BIO</td>
<td>Baseline informatiebeveiliging Overheid (Netherlands Baseline Information Security for Government)</td>
</tr>
<tr>
<td>BSD</td>
<td>Berkeley Software Distribution</td>
</tr>
<tr>
<td>BSI</td>
<td>Bundesamt für Sicherheit in der Informationstechnik (German Federal Office for Information Security)</td>
</tr>
<tr>
<td>BSM</td>
<td>Basic Security Module</td>
</tr>
<tr>
<td>BZK</td>
<td>Ministerie van Binnenlandse Zaken en Koninkrijksrelaties (Netherlands Ministry of the Interior and Kingdom Relations)</td>
</tr>
<tr>
<td>CCE</td>
<td>Common Configuration Enumeration</td>
</tr>
<tr>
<td>CIS</td>
<td>Center for Internet Security</td>
</tr>
<tr>
<td>CM</td>
<td>Configuration Management</td>
</tr>
<tr>
<td>CMMC</td>
<td>Cybersecurity Maturity Model Certification</td>
</tr>
<tr>
<td>CNSSI</td>
<td>Committee on National Security Systems Instruction</td>
</tr>
<tr>
<td>COMSEC</td>
<td>Communications Security</td>
</tr>
<tr>
<td>CRL</td>
<td>Certificate Revocation List</td>
</tr>
<tr>
<td>CUI</td>
<td>Controlled Unclassified Information</td>
</tr>
<tr>
<td>DDM</td>
<td>Declarative Device Management</td>
</tr>
<tr>
<td>DISA</td>
<td>Defense Information Systems Agency</td>
</tr>
<tr>
<td>DMA</td>
<td>Direct Memory Access</td>
</tr>
<tr>
<td>DNS</td>
<td>Domain Name System</td>
</tr>
<tr>
<td>EAP</td>
<td>Extensible Authentication Protocol</td>
</tr>
<tr>
<td>ESS</td>
<td>Enterprise Software Solutions</td>
</tr>
<tr>
<td>FIPS</td>
<td>Federal Information Processing Standard</td>
</tr>
<tr>
<td>GUI</td>
<td>Graphical User Interface</td>
</tr>
<tr>
<td>iOS</td>
<td>iPhone Operating System</td>
</tr>
<tr>
<td>ISSO</td>
<td>Information System Security Officer</td>
</tr>
<tr>
<td>MCX</td>
<td>Managed Client for Mac OS X</td>
</tr>
<tr>
<td>MDM</td>
<td>Mobile Device Management</td>
</tr>
<tr>
<td>NFS</td>
<td>Network File System</td>
</tr>
<tr>
<td>NIST</td>
<td>National Institute of Standards and Technology</td>
</tr>
<tr>
<td>OCSP</td>
<td>Online Certificate Status Protocol</td>
</tr>
<tr>
<td>OMB</td>
<td>Office of Management and Budget</td>
</tr>
<tr>
<td>PAM</td>
<td>Pluggable Authentication Modules</td>
</tr>
<tr>
<td>PEAP</td>
<td>Protected Extensible Authentication Protocol</td>
</tr>
<tr>
<td>PKI</td>
<td>Public Key Infrastructure</td>
</tr>
<tr>
<td>PPPC</td>
<td>Privacy Preferences Policy Control</td>
</tr>
<tr>
<td>SIP</td>
<td>System Integrity Protection</td>
</tr>
<tr>
<td>SIPRNET</td>
<td>Secret Internet Protocol Router Network</td>
</tr>
<tr>
<td>SMB</td>
<td>Server Message Block</td>
</tr>
<tr>
<td>SSH</td>
<td>Secure Shell</td>
</tr>
<tr>
<td>STIG</td>
<td>Security Technical Implementation Guide</td>
</tr>
<tr>
<td>TCP</td>
<td>Transmission Control Protocol</td>
</tr>
<tr>
<td>TFTP</td>
<td>Trivial File Transfer Protocol</td>
</tr>
<tr>
<td>TLS</td>
<td>Transport Layer Security</td>
</tr>
<tr>
<td>TTL</td>
<td>Time to Live</td>
</tr>
<tr>
<td>UAMDM</td>
<td>User Approved MDM</td>
</tr>
<tr>
<td>UID</td>
<td>User ID</td>
</tr>
<tr>
<td>USB</td>
<td>Universal Serial Bus</td>
</tr>
<tr>
<td>USG</td>
<td>U.S. Government</td>
</tr>
<tr>
<td>UUCP</td>
<td>Unix-to-Unix Copy</td>
</tr>
<tr>
<td>VTC</td>
<td>Video Teleconference</td>
</tr>
</table>

### Definitions

<table>
<tr>
<td>Baseline</td>
<td>A baseline is a predefined set of controls (also referred to as "a catalog" of settings) that address the protection needs of an organization's information systems. A baseline serves as a starting point for the creation of security benchmarks.</td>
</tr>
<tr>
<td>Benchmark</td>
<td>Benchmarks are a defined list of settings with values that an organization has defined.</td>
</tr>
</table>

## Applicable Documents

### Government Documents

#### National Institute of Standards and Technology (NIST)

| Document Number or Descriptor                                                                       | Document Title                              |
|-----------------------------------------------------------------------------------------------------|---------------------------------------------|
| [NIST Special Publication 800-53 Rev 5](https://nvd.nist.gov/800-53)                                | _NIST Special Publication 800-53 Rev 5.1.1_ |
| [NIST Special Publication 800-63](https://www.nist.gov/itl/tig/projects/special-publication-800-63) | _NIST Special Publication 800-63_           |
| [NIST Special Publication 800-171](https://csrc.nist.gov/pubs/sp/800/171/r3/final)                  | _NIST Special Publication 800-171 Rev 3_    |
| [NIST Special Publication 800-219](https://csrc.nist.gov/pubs/sp/800/219/r1/final)                  | _NIST Special Publication 800-219 Rev 1_    |




### Non-Government Documents

#### Apple

| Document Number or Descriptor                                                                                             | Document Title                  |
|---------------------------------------------------------------------------------------------------------------------------|---------------------------------|
| [Apple Platform Security Guide](https://support.apple.com/guide/security/welcome/web)                                     | _Apple Platform Security_       |
| [Apple Platform Deployment](https://support.apple.com/guide/deployment/welcome/web)                                       | _Apple Platform Deployment_     |
| [Apple Platform Certifications](https://support.apple.com/guide/certifications/welcome/web)                               | _Apple Platform Certifications_ |
| [Profile-Specific Payload Keys](https://developer.apple.com/documentation/devicemanagement/profile-specific_payload_keys) | _Profile-Specific Payload Keys_ |

#### Center for Internet Security

| Document Number or Descriptor | Document Title |
|--------------------------------------------------------------------|------------------------------------------------|
| [Apple macOS 15.0](https://www.cisecurity.org/benchmark/apple_os/) | _CIS Apple macOS 15.0 Benchmark version 1.0.0_ |



## Auditing

This section contains the configuration and enforcement of the OpenBSM settings.

> **NOTE:** The BSM Audit subsystem has been marked as deprecated by Apple.

> **NOTE:** The check/fix commands outlined in this section _MUST_ be run with elevated privileges.


### Configure Audit Log Files to Not Contain Access Control Lists

The audit log files _MUST_ not contain access control lists (ACLs).

This rule ensures that audit information and audit files are configured to be readable and writable only by system administrators, thereby preventing unauthorized access, modification, and deletion of files.

To check the state of the system, run the following command(s):

```bash
/bin/ls -le $(/usr/bin/grep '^dir' /etc/security/audit_control | /usr/bin/awk -F: '{print $2}') | /usr/bin/awk '{print $1}' | /usr/bin/grep -c ":"
```

If the result is not _0_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
/bin/chmod -RN /var/audit
```


</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>audit_acls_files_configure</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AU-9</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 3.5 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 3.3</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94101-3</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Configure Audit Log Folder to Not Contain Access Control Lists

The audit log folder _MUST_ not contain access control lists (ACLs).

Audit logs contain sensitive data about the system and users. This rule ensures that the audit service is configured to create log folders that are readable and writable only by system administrators in order to prevent normal users from reading audit logs.

To check the state of the system, run the following command(s):

```bash
/bin/ls -lde /var/audit | /usr/bin/awk '{print $1}' | /usr/bin/grep -c ":"
```

If the result is not _0_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
/bin/chmod -N /var/audit
```


</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>audit_acls_folders_configure</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AU-9</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 3.5 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 3.3</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94102-1</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Enable Security Auditing

The information system _MUST_ be configured to generate audit records.

Audit records establish what types of events have occurred, when they occurred, and which users were involved. These records aid an organization in their efforts to establish, correlate, and investigate the events leading up to an outage or attack.

The content required to be captured in an audit record varies based on the impact level of an organization's system. Content that may be necessary to satisfy this requirement includes, for example, time stamps, source addresses, destination addresses, user identifiers, event descriptions, success/fail indications, filenames involved, and access or flow control rules invoked.

The information system initiates session audits at system start-up.

> **NOTE:** Security auditing is NOT enabled by default on macOS 14 and later.

To check the state of the system, run the following command(s):

```bash
LAUNCHD_RUNNING=$(/bin/launchctl list | /usr/bin/grep -c com.apple.auditd)
AUDITD_RUNNING=$(/usr/sbin/audit -c | /usr/bin/grep -c "AUC_AUDITING")
if [[ $LAUNCHD_RUNNING == 1 ]] && [[ -e /etc/security/audit_control ]] && [[ $AUDITD_RUNNING == 1 ]]; then
  echo "pass"
else
  echo "fail"
fi
```

If the result is not _pass_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
if [[ ! -e /etc/security/audit_control ]] && [[ -e /etc/security/audit_control.example ]];then
  /bin/cp /etc/security/audit_control.example /etc/security/audit_control
fi

/bin/launchctl enable system/com.apple.auditd
/bin/launchctl bootstrap system /System/Library/LaunchDaemons/com.apple.auditd.plist
/usr/sbin/audit -i
```


</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>audit_auditd_enabled</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AU-12, AU-12(1), AU-12(3)<br />- AU-14(1)<br />- AU-3, AU-3(1)<br />- AU-8<br />- CM-5(1)<br />- MA-4(1)</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 3.1 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 8.2<br>- 8.5</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94104-7</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Configure Audit_Control to Not Contain Access Control Lists

/etc/security/audit_control _MUST_ not contain Access Control Lists (ACLs).

To check the state of the system, run the following command(s):

```bash
/bin/ls -le /etc/security/audit_control | /usr/bin/awk '{print $1}' | /usr/bin/grep -c ":"
```

If the result is not _0_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
/bin/chmod -N /etc/security/audit_control
```


</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>audit_control_acls_configure</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AU-9</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 3.5 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 3.3</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94106-2</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Configure Audit_Control Group to Wheel

/etc/security/audit_control _MUST_ have the group set to wheel.

To check the state of the system, run the following command(s):

```bash
/bin/ls -dn /etc/security/audit_control | /usr/bin/awk '{print $4}'
```

If the result is not _0_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
/usr/bin/chgrp wheel /etc/security/audit_control
```


</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>audit_control_group_configure</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AU-9</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 3.5 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 3.3</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94107-0</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Configure Audit_Control Owner to Mode 440 or Less Permissive

/etc/security/audit_control _MUST_ be configured so that it is readable only by the root user and group wheel.

To check the state of the system, run the following command(s):

```bash
/bin/ls -l /etc/security/audit_control | /usr/bin/awk '!/-r--[r-]-----|current|total/{print $1}' | /usr/bin/wc -l | /usr/bin/xargs
```

If the result is not _0_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
/bin/chmod 440 /etc/security/audit_control
```


</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>audit_control_mode_configure</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AU-9</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 3.5 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 3.3</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94108-8</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Configure Audit_Control Owner to Root

/etc/security/audit_control _MUST_ have the owner set to root.

To check the state of the system, run the following command(s):

```bash
/bin/ls -dn /etc/security/audit_control | /usr/bin/awk '{print $3}'
```

If the result is not _0_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
/usr/sbin/chown root /etc/security/audit_control
```


</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>audit_control_owner_configure</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AU-9</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 3.5 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 3.3</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94109-6</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Configure Audit Log Files Group to Wheel

Audit log files _MUST_ have the group set to wheel.

The audit service _MUST_ be configured to create log files with the correct group ownership to prevent normal users from reading audit logs.

Audit logs contain sensitive data about the system and users. If log files are set to be readable and writable only by system administrators, the risk is mitigated.

To check the state of the system, run the following command(s):

```bash
/bin/ls -n $(/usr/bin/grep '^dir' /etc/security/audit_control | /usr/bin/awk -F: '{print $2}') | /usr/bin/awk '{s+=$4} END {print s}'
```

If the result is not _0_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
/usr/bin/chgrp -R wheel /var/audit/*
```


</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>audit_files_group_configure</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AU-9</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 3.5 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 3.3</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94112-0</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Configure Audit Log Files to Mode 440 or Less Permissive

The audit service _MUST_ be configured to create log files that are readable only by the root user and group wheel. To achieve this, audit log files _MUST_ be configured to mode 440 or less permissive; thereby preventing normal users from reading, modifying or deleting audit logs.

To check the state of the system, run the following command(s):

```bash
/bin/ls -l $(/usr/bin/grep '^dir' /etc/security/audit_control | /usr/bin/awk -F: '{print $2}') | /usr/bin/awk '!/-r--r-----|current|total/{print $1}' | /usr/bin/wc -l | /usr/bin/tr -d ' '
```

If the result is not _0_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
/bin/chmod 440 /var/audit/*
```


</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>audit_files_mode_configure</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AU-9</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 3.5 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 3.3</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94113-8</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Configure Audit Log Files to be Owned by Root

Audit log files _MUST_ be owned by root.

The audit service _MUST_ be configured to create log files with the correct ownership to prevent normal users from reading audit logs.

Audit logs contain sensitive data about the system and users. If log files are set to only be readable and writable by system administrators, the risk is mitigated.

To check the state of the system, run the following command(s):

```bash
/bin/ls -n $(/usr/bin/grep '^dir' /etc/security/audit_control | /usr/bin/awk -F: '{print $2}') | /usr/bin/awk '{s+=$3} END {print s}'
```

If the result is not _0_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
/usr/sbin/chown -R root /var/audit/*
```


</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>audit_files_owner_configure</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AU-9</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 3.5 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 3.3</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94114-6</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Configure Audit Log Folders Group to Wheel

Audit log files _MUST_ have the group set to wheel.

The audit service _MUST_ be configured to create log files with the correct group ownership to prevent normal users from reading audit logs.

Audit logs contain sensitive data about the system and users. If log files are set to be readable and writable only by system administrators, the risk is mitigated.

To check the state of the system, run the following command(s):

```bash
/bin/ls -dn $(/usr/bin/grep '^dir' /etc/security/audit_control | /usr/bin/awk -F: '{print $2}') | /usr/bin/awk '{print $4}'
```

If the result is not _0_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
/usr/bin/chgrp wheel /var/audit
```


</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>audit_folder_group_configure</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AU-9</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 3.5 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 3.3</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94124-5</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Configure Audit Log Folders to be Owned by Root

Audit log folders _MUST_ be owned by root.

The audit service _MUST_ be configured to create log folders with the correct ownership to prevent normal users from reading audit logs.

Audit logs contain sensitive data about the system and users. If log folders are set to only be readable and writable by system administrators, the risk is mitigated.

To check the state of the system, run the following command(s):

```bash
/bin/ls -dn $(/usr/bin/grep '^dir' /etc/security/audit_control | /usr/bin/awk -F: '{print $2}') | /usr/bin/awk '{print $3}'
```

If the result is not _0_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
/usr/sbin/chown root /var/audit
```


</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>audit_folder_owner_configure</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AU-9</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 3.5 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 3.3</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94125-2</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Configure Audit Log Folders to Mode 700 or Less Permissive

The audit log folder _MUST_ be configured to mode 700 or less permissive so that only the root user is able to read, write, and execute changes to folders.

Because audit logs contain sensitive data about the system and users, the audit service _MUST_ be configured to mode 700 or less permissive; thereby preventing normal users from reading, modifying or deleting audit logs.

To check the state of the system, run the following command(s):

```bash
/usr/bin/stat -f %A $(/usr/bin/grep '^dir' /etc/security/audit_control | /usr/bin/awk -F: '{print $2}')
```

If the result is not _700_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
/bin/chmod 700 /var/audit
```


</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>audit_folders_mode_configure</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AU-9</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 3.5 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 3.3</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94126-0</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Configure Audit Retention to 60d OR 5G

The audit service _MUST_ be configured to require records be kept for a organizational defined value before deletion, unless the system uses a central audit record storage facility.

When "expire-after" is set to "60d OR 5G", the audit service will not delete audit logs until the log data criteria is met.

To check the state of the system, run the following command(s):

```bash
/usr/bin/awk -F: '/expire-after/{print $2}' /etc/security/audit_control
```

If the result is not _60d OR 5G_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
/usr/bin/sed -i.bak 's/^expire-after.*/expire-after:$ODV/' /etc/security/audit_control; /usr/sbin/audit -s
```


</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>audit_retention_configure</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AU-11<br />- AU-4</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 3.4 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 8.1<br>- 8.3</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94130-2</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

## Operating System

This section contains the configuration and enforcement of operating system settings.


### Disable AirDrop

AirDrop _MUST_ be disabled to prevent file transfers to or from unauthorized devices.
AirDrop allows users to share and receive files from other nearby Apple devices.

To check the state of the system, run the following command(s):

```bash
/usr/bin/osascript -l JavaScript << EOS
$.NSUserDefaults.alloc.initWithSuiteName('com.apple.applicationaccess')\
.objectForKey('allowAirDrop').js
EOS
```

If the result is not _false_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>allowAirDrop</key>
  <false/>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>os_airdrop_disable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AC-20<br />- AC-3<br />- CM-7, CM-7(1)</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.3.1.1 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 4.1<br>- 4.8<br>- 6.7</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94156-7</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Must Use an Approved Antivirus Program

An approved antivirus product _MUST_ be installed and configured to run.

Malicious software can establish a base on individual desktops and servers. Employing an automated mechanism to detect this type of software will aid in elimination of the software from the operating system.'

To check the state of the system, run the following command(s):

```bash
/usr/bin/xprotect status | /usr/bin/grep -cE "(launch scans: enabled|background scans: enabled)"
```

If the result is not _2_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
/bin/launchctl load -w /Library/Apple/System/Library/LaunchDaemons/com.apple.XProtect.daemon.scan.plist
/bin/launchctl load -w /Library/Apple/System/Library/LaunchDaemons/com.apple.XprotectFramework.PluginService.plist
```

> **NOTE:** These services cannot be unloaded or loaded while System Integrity Protection (SIP) is enabled.

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>os_anti_virus_installed</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td></td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 5.10 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 10.1<br>- 10.2<br>- 10.5</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94158-3</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Enable Authenticated Root

Authenticated Root _MUST_ be enabled.

When Authenticated Root is enabled the macOS is booted from a signed volume that is cryptographically protected to prevent tampering with the system volume.

> **NOTE:** Authenticated Root is enabled by default on macOS systems.

WARNING: If more than one partition with macOS is detected, the csrutil command will hang awaiting input.

To check the state of the system, run the following command(s):

```bash
/usr/libexec/mdmclient QuerySecurityInfo 2>/dev/null | /usr/bin/grep -c "AuthenticatedRootVolumeEnabled = 1;"
```

If the result is not _1_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
/usr/bin/csrutil authenticated-root enable
```

> **NOTE:** To re-enable "Authenticated Root", boot the affected system into "Recovery" mode, launch "Terminal" from the "Utilities" menu, and run the command.

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>os_authenticated_root_enable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AC-3<br />- CM-5<br />- MA-4(1)<br />- SC-34<br />- SI-7, SI-7(6)</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 5.1.4 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 3.11<br>- 3.6</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94164-1</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Enforce Installation of XProtect Remediator and Gatekeeper Updates Automatically

Software Update _MUST_ be configured to update XProtect Remediator and Gatekeeper automatically.

This setting enforces definition updates for XProtect Remediator and Gatekeeper; with this setting in place, new malware and adware that Apple has added to the list of malware or untrusted software will not execute. These updates do not require the computer to be restarted.

[https://support.apple.com/en-us/HT207005](https://support.apple.com/en-us/HT207005)

> **NOTE:** Software update will automatically update XProtect Remediator and Gatekeeper by default in the macOS.

To check the state of the system, run the following command(s):

```bash
/usr/bin/osascript -l JavaScript << EOS
$.NSUserDefaults.alloc.initWithSuiteName('com.apple.SoftwareUpdate')\
.objectForKey('ConfigDataInstall').js
EOS
```

If the result is not _true_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>ConfigDataInstall</key>
  <true/>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>os_config_data_install_enforce</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- SI-2(5)<br />- SI-3</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 1.6 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 7.3<br>- 7.4<br>- 7.7</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94176-5</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Enable Gatekeeper

Gatekeeper _MUST_ be enabled.

Gatekeeper is a security feature that ensures that applications are digitally signed by an Apple-issued certificate before they are permitted to run. Digital signatures allow the macOS host to verify that the application has not been modified by a malicious third party.

Administrator users will still have the option to override these settings on a case-by-case basis.

To check the state of the system, run the following command(s):

```bash
/usr/bin/osascript -l JavaScript << EOS
$.NSUserDefaults.alloc.initWithSuiteName('com.apple.systempolicy.control')\
.objectForKey('EnableAssessment').js
EOS
```

If the result is not _true_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>EnableAssessment</key>
  <true/>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>os_gatekeeper_enable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- CM-14<br />- CM-5<br />- SI-3<br />- SI-7(1), SI-7(15)</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.6.5 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 10.1<br>- 10.2<br>- 10.5</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94195-5</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Remove Guest Folder if Present

The guest folder _MUST_ be deleted if present.

To check the state of the system, run the following command(s):

```bash
/bin/ls /Users/ | /usr/bin/grep -c "Guest"
```

If the result is not _0_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
/bin/rm -Rf /Users/Guest
```


</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>os_guest_folder_removed</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td></td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 5.9 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 4.1</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94198-9</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Secure User's Home Folders

The system _MUST_ be configured to prevent access to other user's home folders.

The default behavior of macOS is to allow all valid users access to the top level of every other user's home folder while restricting access only to the Apple default folders within.

To check the state of the system, run the following command(s):

```bash
/usr/bin/find /System/Volumes/Data/Users -mindepth 1 -maxdepth 1 -type d ! \( -perm 700 -o -perm 711 \) | /usr/bin/grep -v "Shared" | /usr/bin/grep -v "Guest" | /usr/bin/wc -l | /usr/bin/xargs
```

If the result is not _0_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
IFS=$'\n'
for userDirs in $( /usr/bin/find /System/Volumes/Data/Users -mindepth 1 -maxdepth 1 -type d ! \( -perm 700 -o -perm 711 \) | /usr/bin/grep -v "Shared" | /usr/bin/grep -v "Guest" ); do
  /bin/chmod og-rwx "$userDirs"
done
unset IFS
```


</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>os_home_folders_secure</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AC-6</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 5.1.1 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 3.3</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94204-5</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Disable the Built-in Web Server

The built-in web server which is managed by launchd is a non-essential service built into macOS and _MUST_ be disabled and not running.

> **NOTE:** The built in web server service is disabled at startup by default macOS.

To check the state of the system, run the following command(s):

```bash
result="FAIL"
enabled=$(/bin/launchctl print-disabled system | /usr/bin/grep '"org.apache.httpd" => enabled')
running=$(/bin/launchctl print system/org.apache.httpd 2>/dev/null)

if [[ -z "$running" ]] && [[ -z "$enabled" ]]; then
  result="PASS"
elif [[ -n "$running" ]]; then
  result="${result}  RUNNING"
elif [[ -n "$enabled" ]]; then
  result="${result}  ENABLED"
fi
echo $result
```

If the result is not _PASS_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
/usr/sbin/apachectl stop 2>/dev/null
/bin/launchctl disable system/org.apache.httpd
```


</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>os_httpd_disable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AC-17<br />- AC-3</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 4.2 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 4.1<br>- 4.8</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94205-2</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Configure Install.log Retention to 365

The install.log _MUST_ be configured to require records be kept for a organizational defined value before deletion, unless the system uses a central audit record storage facility.

To check the state of the system, run the following command(s):

```bash
/usr/sbin/aslmanager -dd 2>&1 | /usr/bin/awk '/\/var\/log\/install.log$/ {count++} /Processing module com.apple.install/,/Finished/ { for (i=1;i<=NR;i++) { if ($i == "TTL" && $(i+2) >= $ODV) { ttl="True" }; if ($i == "MAX") {max="True"}}} END{if (count > 1) { print "Multiple config files for /var/log/install, manually remove the extra files"} else if (max == "True") { print "all_max setting is configured, must be removed" } if (ttl != "True") { print "TTL not configured" } else { print "Yes" }}'
```

If the result is not _Yes_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
/usr/bin/sed -i '' "s/\* file \/var\/log\/install.log.*/\* file \/var\/log\/install.log format='\$\(\(Time\)\(JZ\)\) \$Host \$\(Sender\)\[\$\(PID\\)\]: \$Message' rotate=utc compress file_max=50M size_only ttl=$ODV/g" /etc/asl/com.apple.install
```

> **NOTE:** If there are multiple configuration files in /etc/asl that are set to process the file /var/log/install.log, these files will have to be manually removed.

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>os_install_log_retention_configure</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AU-11<br />- AU-4</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 3.3 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 8.1<br>- 8.3</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94212-8</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Disable Apple Intelligence Mail Summary

Apple Intelligence features such as Apple Mail Summary that use off device AI _MUST_ be disabled.

To check the state of the system, run the following command(s):

```bash
/usr/bin/osascript -l JavaScript << EOS
$.NSUserDefaults.alloc.initWithSuiteName('com.apple.applicationaccess')\
.objectForKey('allowMailSummary').js
EOS
```

If the result is not _false_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>allowMailSummary</key>
  <false/>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>os_mail_summary_disable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AC-20, AC-20(1)<br />- CM-7, CM-7(1)<br />- SC-7(10)</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.5.1.3 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td></td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94521-2</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Enforce Enrollment in Mobile Device Management

You _MUST_ enroll your Mac in a Mobile Device Management (MDM) software.

User Approved MDM (UAMDM) enrollment or enrollment via Apple Business Manager (ABM)/Apple School Manager (ASM) is required to manage certain security settings. Currently these include:

- Allowed Kernel Extensions
- Allowed Approved System Extensions
- Privacy Preferences Policy Control Payload
- ExtensibleSingleSignOn
- FDEFileVault

In macOS 11, UAMDM grants Supervised status on a Mac, unlocking the following MDM features, which were previously locked behind ABM:

- Activation Lock Bypass
- Access to Bootstrap Tokens
- Scheduling Software Updates
- Query list and delete local users

To check the state of the system, run the following command(s):

```bash
/usr/bin/profiles status -type enrollment | /usr/bin/awk -F: '/MDM enrollment/ {print $2}' | /usr/bin/grep -c "Yes (User Approved)"
```

If the result is not _1_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Ensure that system is enrolled via UAMDM.

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>os_mdm_require</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- CM-2<br />- CM-6</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 1.8 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 4.1<br>- 5.1</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94227-6</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Enable Apple Mobile File Integrity

Mobile file integrity _MUST_ be enabled.

To check the state of the system, run the following command(s):

```bash
/usr/sbin/nvram -p | /usr/bin/grep -c "amfi_get_out_of_my_way=1"
```

If the result is not _0_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
/usr/sbin/nvram boot-args=""
```


</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>os_mobile_file_integrity_enable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td></td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 5.1.3 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 2.3<br>- 2.6</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94231-8</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Disable Network File System Service

Support for Network File Systems (NFS) services is non-essential and, therefore, _MUST_ be disabled.

To check the state of the system, run the following command(s):

```bash
isDisabled=$(/sbin/nfsd status | /usr/bin/awk '/nfsd service/ {print $NF}')
if [[ "$isDisabled" == "disabled" ]] && [[ -z $(/usr/bin/pgrep nfsd) ]]; then
  echo "pass"
else
  echo "fail"
fi
```

If the result is not _pass_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
/bin/launchctl disable system/com.apple.nfsd
/bin/rm -rf /etc/exports
```

The system may need to be restarted for the update to take effect.

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>os_nfsd_disable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AC-17<br />- AC-3</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 4.3 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 4.1<br>- 4.8</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94235-9</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Disable Apple Intelligence Notes Transcription

Apple Intelligence features such as Notes Transcription that use off device AI _MUST_ be disabled.

To check the state of the system, run the following command(s):

```bash
/usr/bin/osascript -l JavaScript << EOS
$.NSUserDefaults.alloc.initWithSuiteName('com.apple.applicationaccess')\
.objectForKey('allowNotesTranscription').js
EOS
```

If the result is not _false_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>allowNotesTranscription</key>
  <false/>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>os_notes_transcription_disable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AC-20, AC-20(1)<br />- CM-7, CM-7(1)<br />- SC-7(10)</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.5.1.4 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td></td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94568-3</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Disable Apple Intelligence Notes Transcription Summary

Apple Intelligence features such as Notes Transcription Summary that use off device AI _MUST_ be disabled.

To check the state of the system, run the following command(s):

```bash
/usr/bin/osascript -l JavaScript << EOS
$.NSUserDefaults.alloc.initWithSuiteName('com.apple.applicationaccess')\
.objectForKey('allowNotesTranscriptionSummary').js
EOS
```

If the result is not _false_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>allowNotesTranscriptionSummary</key>
  <false/>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>os_notes_transcription_summary_disable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AC-20, AC-20(1)<br />- CM-7, CM-7(1)<br />- SC-7(10)</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.5.1.4 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td></td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94569-1</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Enforce On Device Dictation

The system _MUST_ be configured for on device dictation.

By enforcing on device dictation this will mitigate the risk of unwanted data being sent to Apple.

To check the state of the system, run the following command(s):

```bash
/usr/bin/osascript -l JavaScript << EOS
$.NSUserDefaults.alloc.initWithSuiteName('com.apple.applicationaccess')\
.objectForKey('forceOnDeviceOnlyDictation').js
EOS
```

If the result is not _true_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>forceOnDeviceOnlyDictation</key>
  <true/>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>os_on_device_dictation_enforce</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AC-20<br />- CM-7, CM-7(1)<br />- SC-7(10)</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.18.1 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 4.1<br>- 4.8</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94245-8</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Remove Password Hint From User Accounts

User accounts _MUST_ not contain password hints.

To check the state of the system, run the following command(s):

```bash
HINT=$(/usr/bin/dscl . -list /Users hint | /usr/bin/awk '{ print $2 }')

if [ -z "$HINT" ]; then
  echo "PASS"
else
  echo "FAIL"
fi
```

If the result is not _PASS_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
for u in $(/usr/bin/dscl . -list /Users UniqueID | /usr/bin/awk '$2 > 500 {print $1}'); do
  /usr/bin/dscl . -delete /Users/$u hint
done
```


</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>os_password_hint_remove</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- IA-6</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.12.1 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 5.2</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94248-2</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Disable Power Nap

Power Nap _MUST_ be disabled.

> **NOTE:** Power Nap allows your Mac to perform actions while a Mac is asleep. This can interfere with USB power and may cause devices such as smartcards to stop functioning until a reboot and must therefore be disabled on all applicable systems.

The following Macs support Power Nap:

- MacBook (Early 2015 and later)
- MacBook Air (Late 2010 and later)
- MacBook Pro (all models with Retina display)
- Mac mini (Late 2012 and later)
- iMac (Late 2012 and later)
- Mac Pro (Late 2013 and later)

To check the state of the system, run the following command(s):

```bash
/usr/bin/pmset -g custom | /usr/bin/awk '/powernap/ { sum+=$2 } END {print sum}'
```

If the result is not _0_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
/usr/bin/pmset -a powernap 0
```


</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>os_power_nap_disable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- CM-7, CM-7(1)</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.10.2 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 4.1<br>- 4.8</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94257-3</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Disable Root Login

To assure individual accountability and prevent unauthorized access, logging in as root at the login window _MUST_ be disabled.

The macOS system _MUST_ require individuals to be authenticated with an individual authenticator prior to using a group authenticator, and administrator users _MUST_ never log in directly as root.

To check the state of the system, run the following command(s):

```bash
/usr/bin/dscl '/Local/Default' read '/Users/root' AuthenticationAuthority 2>/dev/null | /usr/bin/grep -c 'AuthenticationAuthority'
```

If the result is not _0_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
/usr/bin/fdesetup remove -user root
/usr/bin/dscl '/Local/Default' delete '/Users/root' AuthenticationAuthority
```


</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>os_root_disable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- IA-2, IA-2(5)</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 5.6 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 5.4</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94279-7</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Ensure Advertising Privacy Protection in Safari Is Enabled

Allow privacy-preserving measurement of ad effectiveness _MUST_ be enabled in Safari.

To check the state of the system, run the following command(s):

```bash
/usr/bin/profiles -P -o stdout | /usr/bin/grep -c '"WebKitPreferences.privateClickMeasurementEnabled" = 1' | /usr/bin/awk '{ if ($1 >= 1) {print "1"} else {print "0"}}'
```

If the result is not _1_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>WebKitPreferences.privateClickMeasurementEnabled</key>
  <true/>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>os_safari_advertising_privacy_protection_enable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td></td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 6.3.6 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 9.1</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94280-5</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Disable Automatic Opening of Safe Files in Safari

Open "safe" files after downloading _MUST_ be disabled in Safari.

To check the state of the system, run the following command(s):

```bash
/usr/bin/profiles -P -o stdout | /usr/bin/grep -c 'AutoOpenSafeDownloads = 0' | /usr/bin/awk '{ if ($1 >= 1) {print "1"} else {print "0"}}'
```

If the result is not _1_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>AutoOpenSafeDownloads</key>
  <false/>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>os_safari_open_safe_downloads_disable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td></td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 6.3.1 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 9.1<br>- 9.6</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94281-3</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Ensure Prevent Cross-site Tracking in Safari Is Enabled

Prevent cross-site tracking _MUST_ be enabled in Safari.

To check the state of the system, run the following command(s):

```bash
/usr/bin/profiles -P -o stdout | /usr/bin/grep -cE '"WebKitPreferences.storageBlockingPolicy" = 1|"WebKitStorageBlockingPolicy" = 1|"BlockStoragePolicy" =2' | /usr/bin/awk '{ if ($1 >= 1) {print "1"} else {print "0"}}'
```

If the result is not _1_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>WebKitPreferences.storageBlockingPolicy</key>
  <integer>1</integer>
  <key>WebKitStorageBlockingPolicy</key>
  <integer>1</integer>
  <key>BlockStoragePolicy</key>
  <integer>2</integer>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>os_safari_prevent_cross-site_tracking_enable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td></td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 6.3.4 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 9.1<br>- 9.3</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94282-1</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Ensure Show Full Website Address in Safari Is Enabled

Show full website address _MUST_ be enabled in Safari.

To check the state of the system, run the following command(s):

```bash
/usr/bin/profiles -P -o stdout | /usr/bin/grep -c 'ShowFullURLInSmartSearchField = 1' | /usr/bin/awk '{ if ($1 >= 1) {print "1"} else {print "0"}}'
```

If the result is not _1_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>ShowFullURLInSmartSearchField</key>
  <true/>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>os_safari_show_full_website_address_enable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td></td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 6.3.7 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 9.1</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94283-9</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Ensure Show Safari shows the Status Bar is Enabled

Safari _MUST_ be configured to show the status bar.

To check the state of the system, run the following command(s):

```bash
/usr/bin/profiles -P -o stdout | /usr/bin/grep -c 'ShowOverlayStatusBar = 1' | /usr/bin/awk '{ if ($1 >= 1) {print "1"} else {print "0"}}'
```

If the result is not _1_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>ShowOverlayStatusBar</key>
  <true/>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>os_safari_show_status_bar_enabled</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td></td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 6.3.10 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 9.1</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94284-7</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Ensure Warn When Visiting A Fraudulent Website in Safari Is Enabled

Warn when visiting a fraudulent website _MUST_ be enabled in Safari.

To check the state of the system, run the following command(s):

```bash
/usr/bin/profiles -P -o stdout | /usr/bin/grep -c 'WarnAboutFraudulentWebsites = 1' | /usr/bin/awk '{ if ($1 >= 1) {print "1"} else {print "0"}}'
```

If the result is not _1_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>WarnAboutFraudulentWebsites</key>
  <true/>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>os_safari_warn_fraudulent_website_enable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td></td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 6.3.3 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 9.1<br>- 9.3</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94285-4</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Enable Show All Filename Extensions

Show all filename extensions _MUST_ be enabled in the Finder.

[NOTE]
====
The check and fix are for the currently logged in user. To get the currently logged in user, run the following.
```bash
CURRENT_USER=$( /usr/bin/defaults read /Library/Preferences/com.apple.loginwindow lastUserName )
```
====

To check the state of the system, run the following command(s):

```bash
/usr/bin/sudo -u "$CURRENT_USER" /usr/bin/defaults read .GlobalPreferences AppleShowAllExtensions 2>/dev/null
```

If the result is not _1_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
/usr/bin/sudo -u "$CURRENT_USER" /usr/bin/defaults write /Users/"$CURRENT_USER"/Library/Preferences/.GlobalPreferences AppleShowAllExtensions -bool true
```


</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>os_show_filename_extensions_enable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td></td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 6.1.1 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 2.3</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94293-8</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Ensure System Integrity Protection is Enabled

System Integrity Protection (SIP) _MUST_ be enabled.

SIP is vital to protecting the integrity of the system as it prevents malicious users and software from making unauthorized and/or unintended modifications to protected files and folders; ensures the presence of an audit record generation capability for defined auditable events for all operating system components; protects audit tools from unauthorized access, modification, and deletion; restricts the root user account and limits the actions that the root user can perform on protected parts of the macOS; and prevents non-privileged users from granting other users direct access to the contents of their home directories and folders.

> **NOTE:** SIP is enabled by default in macOS.

To check the state of the system, run the following command(s):

```bash
/usr/bin/csrutil status | /usr/bin/grep -c 'System Integrity Protection status: enabled.'
```

If the result is not _1_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
/usr/bin/csrutil enable
```

> **NOTE:** To re-enable "System Integrity Protection", boot the affected system into "Recovery" mode, launch "Terminal" from the "Utilities" menu, and run the command.

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>os_sip_enable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AC-3<br />- AU-9, AU-9(3)<br />- CM-5, CM-5(6)<br />- SC-4<br />- SI-2<br />- SI-7</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 5.1.2 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 2.3<br>- 2.6<br>- 10.5</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94294-6</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Ensure Software Update Deferment Is Less Than or Equal to 30 Days

Software updates _MUST_ be deferred for 30 days or less.

If you need to defer software updates, create a Restrictions profile using the com.apple.applicationaccess domain and the key enforcedSoftwareUpdateDelay.

To check the state of the system, run the following command(s):

```bash
/usr/bin/osascript -l JavaScript << EOS
function run() {
  let timeout = ObjC.unwrap($.NSUserDefaults.alloc.initWithSuiteName('com.apple.applicationaccess')\
.objectForKey('enforcedSoftwareUpdateDelay')) || 0
  if ( timeout <= $ODV ) {
    return("true")
  } else {
    return("false")
  }
}
EOS
```

If the result is not _true_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />



</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>os_software_update_deferral</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td></td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 1.7 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 7.3<br>- 7.4</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94298-7</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Configure Sudo To Log Events

Sudo _MUST_ be configured to log privilege escalation.

To check the state of the system, run the following command(s):

```bash
/usr/bin/sudo /usr/bin/sudo -V | /usr/bin/grep -c "Log when a command is allowed by sudoers"
```

If the result is not _1_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
/usr/bin/find /etc/sudoers* -type f -exec sed -i '' '/^Defaults[[:blank:]]*\!log_allowed/s/^/# /' '{}' \;
/bin/echo "Defaults log_allowed" >> /etc/sudoers.d/mscp
```


</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>os_sudo_log_enforce</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AC-6(9)</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 5.11 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td></td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94310-0</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Configure Sudo Timeout Period to 0

The file /etc/sudoers _MUST_ include a timestamp_timeout of 0.

To check the state of the system, run the following command(s):

```bash
/usr/bin/sudo /usr/bin/sudo -V | /usr/bin/grep -c "Authentication timestamp timeout: $ODV.0 minutes"
```

If the result is not _1_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
/usr/bin/find /etc/sudoers* -type f -exec sed -i '' '/timestamp_timeout/d' '{}' \;
/bin/echo "Defaults timestamp_timeout=$ODV" >> /etc/sudoers.d/mscp
```


</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>os_sudo_timeout_configure</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td></td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 5.4 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 4.3</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94311-8</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Configure Sudoers Timestamp Type

The file /etc/sudoers _MUST_ be configured to not include a timestamp_type of global or ppid and be configured for timestamp record types of tty.

This rule ensures that the "sudo" command will prompt for the administrator's password at least once in each newly opened terminal window. This prevents a malicious user from taking advantage of an unlocked computer or an abandoned logon session by bypassing the normal password prompt requirement.

To check the state of the system, run the following command(s):

```bash
/usr/bin/sudo /usr/bin/sudo -V | /usr/bin/awk -F": " '/Type of authentication timestamp record/{print $2}'
```

If the result is not _tty_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
/usr/bin/find /etc/sudoers* -type f -exec sed -i '' '/timestamp_type/d; /!tty_tickets/d' '{}' \;
```


</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>os_sudoers_timestamp_type_configure</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- CM-5(1)<br />- IA-11</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 5.5 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 4.3</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94312-6</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Ensure Appropriate Permissions Are Enabled for System Wide Applications

Applications in the System Applications Directory (/Applications) _MUST_ not be world-writable.

To check the state of the system, run the following command(s):

```bash
/usr/bin/find /Applications -iname "*\.app" -type d -perm -2 -ls | /usr/bin/wc -l | /usr/bin/xargs
```

If the result is not _0_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
IFS=$'\n'
for apps in $( /usr/bin/find /Applications -iname "*\.app" -type d -perm -2 ); do
  /bin/chmod -R o-w "$apps"
done
```


</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>os_system_wide_applications_configure</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td></td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 5.1.5 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 3.3</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94314-2</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Ensure Secure Keyboard Entry Terminal.app is Enabled

Secure keyboard entry _MUST_ be enabled in Terminal.app.

To check the state of the system, run the following command(s):

```bash
/usr/bin/osascript -l JavaScript << EOS
$.NSUserDefaults.alloc.initWithSuiteName('com.apple.Terminal')\
.objectForKey('SecureKeyboardEntry').js
EOS
```

If the result is not _true_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>SecureKeyboardEntry</key>
  <true/>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>os_terminal_secure_keyboard_enable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td></td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 6.4.1 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 4.8</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94315-9</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Enable Time Synchronization Daemon

The macOS time synchronization daemon (timed) _MUST_ be enabled for proper time synchronization to an authorized time server.

> **NOTE:** The time synchronization daemon is enabled by default on macOS.

To check the state of the system, run the following command(s):

```bash
/bin/launchctl list | /usr/bin/grep -c com.apple.timed
```

If the result is not _1_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
/bin/launchctl load -w /System/Library/LaunchDaemons/com.apple.timed.plist
```

> **NOTE:** The service `timed` cannot be unloaded or loaded while System Integrity Protection (SIP) is enabled.

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>os_time_server_enabled</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AU-12(1)<br />- SC-45(1)</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.3.2.2 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 8.4</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94319-1</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Disable Login to Other User's Active and Locked Sessions

The ability to log in to another user's active or locked session _MUST_ be disabled.

macOS has a privilege that can be granted to any user that will allow that user to unlock active user's sessions. Disabling the admins and/or user's ability to log into another user's active and locked session prevents unauthorized persons from viewing potentially sensitive and/or personal information.

> **NOTE:** Configuring this setting will change the user experience and disable TouchID from unlocking the screensaver. A configuration profile will be generated to include the setting that restores the expected behavior. You can also apply the settings using `/usr/bin/sudo /usr/bin/defaults write /Library/Preferences/com.apple.loginwindow screenUnlockMode -int 1`.

WARNING: Do not apply this rule if your organization uses smartcards and Platform Single Sign-On (PSSO).

To check the state of the system, run the following command(s):

```bash
RESULT="FAIL"
SS_RULE=$(/usr/bin/security -q authorizationdb read system.login.screensaver  2>&1 | /usr/bin/xmllint --xpath "//dict/key[.='rule']/following-sibling::array[1]/string/text()" -)

if [[ "${SS_RULE}" == "$ODV" ]]; then
    RESULT="PASS"
else
    PSSO_CHECK=$(/usr/bin/security -q authorizationdb read "$SS_RULE"  2>&1 | /usr/bin/xmllint --xpath '//key[.="rule"]/following-sibling::array[1]/string/text()' -)
    if /usr/bin/grep -Fxq "$ODV" <<<"$PSSO_CHECK"; then
        RESULT="PASS"
    fi
fi

echo $RESULT
```

If the result is not _PASS_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
SS_RULE=$(/usr/bin/security -q authorizationdb read system.login.screensaver 2>&1 | /usr/bin/xmllint --xpath "//dict/key[.='rule']/following-sibling::array[1]/string/text()" -)

if [[ "$SS_RULE" == *psso* ]]; then
    /usr/bin/security -q authorizationdb read psso-screensaver > "/tmp/psso-screensaver-mscp.plist"
    /usr/bin/sed -i.bak 's/<string>authenticate-session-owner-or-admin<\/string>/<string>$ODV<\/string>/' /tmp/psso-screensaver-mscp.plist
    /usr/bin/security -q authorizationdb write psso-screensaver-mscp < /tmp/psso-screensaver-mscp.plist
    /usr/bin/security -q authorizationdb write system.login.screensaver psso-screensaver-mscp 2>&1
else
    /usr/bin/security -q authorizationdb write system.login.screensaver "$ODV" 2>&1
fi
```


</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>os_unlock_active_user_session_disable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- IA-2, IA-2(5)</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 5.7 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 4.3</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94322-5</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Ensure No World Writable Files Exist in the System Folder

Folders in /System/Volumes/Data/System _MUST_ not be world-writable.

To check the state of the system, run the following command(s):

```bash
/usr/bin/find /System/Volumes/Data/System -type d -perm -2 -ls | /usr/bin/grep -vE "downloadDir|locks" | /usr/bin/wc -l | /usr/bin/xargs
```

If the result is not _0_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
IFS=$'\n'
for sysPermissions in $( /usr/bin/find /System/Volumes/Data/System -type d -perm -2 | /usr/bin/grep -vE "downloadDir|locks" ); do
  /bin/chmod -R o-w "$sysPermissions"
done
```


</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>os_world_writable_system_folder_configure</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td></td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 5.1.6 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 3.3</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94327-4</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Disable Apple Intelligence Writing Tools

Apple Intelligence features such as writing tools that use off device AI _MUST_ be disabled.

To check the state of the system, run the following command(s):

```bash
/usr/bin/osascript -l JavaScript << EOS
$.NSUserDefaults.alloc.initWithSuiteName('com.apple.applicationaccess')\
.objectForKey('allowWritingTools').js
EOS
```

If the result is not _false_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>allowWritingTools</key>
  <false/>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>os_writing_tools_disable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AC-20, AC-20(1)<br />- CM-7, CM-7(1)<br />- SC-7(10)</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.5.1.2 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td></td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94328-2</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

## Password Policy

This section contains the configuration and enforcement of settings pertaining to password policies in macOS.

> **NOTE:** The check/fix commands outlined in this section _MUST_ be run by a user with elevated privileges.

> **IMPORTANT:** The password policy recommendations in the NIST 800-53 (Rev 5) and NIST 800-63B state that complexity rules should be organizationally defined. The values defined are based off of common complexity values. But your organization may define its own password complexity rules.

> **NOTE:** The settings outlined in this section adhere to the recommendations provided in this document for systems that utilize passwords for local accounts. If systems are integrated with a directory service, local password policies should align with domain password policies to the fullest extent feasible.


### Limit Consecutive Failed Login Attempts to 5

The system _MUST_ be configured to limit the number of failed login attempts to a maximum of 5. When the maximum number of failed attempts is reached, the system _MUST_ prevent logins for a period of time after.

This rule protects against malicious users attempting to gain access to the system via brute-force hacking methods.

To check the state of the system, run the following command(s):

```bash
/usr/bin/pwpolicy -getaccountpolicies 2> /dev/null | /usr/bin/tail +2 | /usr/bin/xmllint --xpath '//dict/key[text()="policyAttributeMaximumFailedAuthentications"]/following-sibling::integer[1]/text()' - | /usr/bin/awk '{ if ($1 <= $ODV) {print "pass"} else {print "fail"}}' | /usr/bin/uniq
```

If the result is not _pass_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>maxFailedAttempts</key>
  <integer>5</integer>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>pwpolicy_account_lockout_enforce</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AC-7</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 5.2.1 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 6.2</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94331-6</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Set Account Lockout Time to 15 Minutes

The macOS _MUST_ be configured to enforce a lockout time period of at least 15 minutes when the maximum number of failed logon attempts is reached.

This rule protects against malicious users attempting to gain access to the system via brute-force hacking methods.

To check the state of the system, run the following command(s):

```bash
/usr/bin/pwpolicy -getaccountpolicies 2> /dev/null | /usr/bin/tail +2 | /usr/bin/xmllint --xpath '//dict/key[text()="autoEnableInSeconds"]/following-sibling::integer[1]/text()' - | /usr/bin/awk '{ if ($1/60 >= $ODV ) {print "pass"} else {print "fail"}}' | /usr/bin/uniq
```

If the result is not _pass_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>minutesUntilFailedLoginReset</key>
  <integer>15</integer>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>pwpolicy_account_lockout_timeout_enforce</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AC-7</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 5.2.1 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 6.2</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94332-4</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Prohibit Password Reuse for a Minimum of 24 Generations

The device _MUST_ be configured to enforce a password history of at least 24 previous passwords when a password is created.

This rule ensures that users are not allowed to re-use a password that was used in any of the 24 previous password generations.

Limiting password reuse protects against malicious users attempting to gain access to the system via brute-force hacking methods.

To check the state of the system, run the following command(s):

```bash
/usr/bin/pwpolicy -getaccountpolicies 2> /dev/null | /usr/bin/tail +2 | /usr/bin/xmllint --xpath '//dict/key[text()="policyAttributePasswordHistoryDepth"]/following-sibling::*[1]/text()' - | /usr/bin/awk '{ if ($1 >= $ODV ) {print "pass"} else {print "fail"}}' | /usr/bin/uniq
```

If the result is not _pass_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>pinHistory</key>
  <integer>24</integer>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>pwpolicy_history_enforce</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- IA-5(1)</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 5.2.8 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 5.2</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94337-3</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Restrict Maximum Password Lifetime to 365 Days

The system _MUST_ be configured to enforce a maximum password lifetime limit of 365 days.

This rule ensures that users are forced to change their passwords frequently enough to prevent malicious users from gaining and maintaining access to the system.

> **NOTE:** To comply with Executive Order 14028, “Improving the Nation's Cybersecurity”, OMB M-22-09, “Moving the U.S. Government Toward Zero Trust Cybersecurity Principles”, and NIST SP-800-63b, “Digital Identity Guidelines: Authentication and Lifecycle Management” federal, military, and intelligence communities must adopt the following configuration settings. Password policies must not require the use of complexity policies such as upper characters, lower characters, or special characters. Password policies must also not require the use of regular rotation. Password policies should define a minimum length. Multifactor authentication should be used where ever possible.

To check the state of the system, run the following command(s):

```bash
/usr/bin/pwpolicy -getaccountpolicies 2> /dev/null | /usr/bin/tail +2 | /usr/bin/xmllint --xpath '//dict/key[text()="policyAttributeExpiresEveryNDays"]/following-sibling::*[1]/text()' - | /usr/bin/awk '{ if ($1 <= $ODV ) {print "pass"} else {print "fail"}}' | /usr/bin/uniq
```

If the result is not _pass_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>maxPINAgeInDays</key>
  <integer>365</integer>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>pwpolicy_max_lifetime_enforce</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- IA-5</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 5.2.7 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 5.3</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94339-9</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Require a Minimum Password Length of 15 Characters

The macOS _MUST_ be configured to require a minimum of 15 characters be used when a password is created.

This rule enforces password complexity by requiring users to set passwords that are less vulnerable to malicious users.

> **NOTE:** To comply with Executive Order 14028, "Improving the Nation's Cybersecurity", OMB M-22-09, "Moving the U.S. Government Toward Zero Trust Cybersecurity Principles", and NIST SP-800-63b, "Digital Identity Guidelines: Authentication and Lifecycle Management" federal, military, and intelligence communities must adopt the following configuration settings. Password policies must not require the use of complexity policies such as upper characters, lower characters, or special characters. Password policies must also not require the use of regular rotation. Password policies should define a minimum length. Multifactor authentication should be used where ever possible.

To check the state of the system, run the following command(s):

```bash
/usr/bin/pwpolicy -getaccountpolicies 2>/dev/null | tail +2 | grep -oE "policyAttributePassword matches '.\{[0-9]+," | awk -F'[{,]' -v ODV=$ODV '{if ($2 > max) max=$2} END {print (max >= ODV) ? "pass" : "fail"}'
```

If the result is not _pass_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>minLength</key>
  <integer>15</integer>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>pwpolicy_minimum_length_enforce</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- IA-5(1)</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 5.2.2 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 5.2</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94340-7</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

## System Settings

This section contains the configuration and enforcement of the settings within the macOS System Settings application.

> **NOTE:** The check/fix commands outlined in this section _MUST_ be run by a user with elevated privileges.


### Disable Airplay Receiver

Airplay Receiver allows you to send content from another Apple device to be displayed on the screen as it's being played from your other device.

Support for Airplay Receiver is non-essential and _MUST_ be disabled.

The information system _MUST_ be configured to provide only essential capabilities.

To check the state of the system, run the following command(s):

```bash
/usr/bin/osascript -l JavaScript << EOS
$.NSUserDefaults.alloc.initWithSuiteName('com.apple.applicationaccess')\
.objectForKey('allowAirPlayIncomingRequests').js
EOS
```

If the result is not _false_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>allowAirPlayIncomingRequests</key>
  <false/>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_airplay_receiver_disable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- CM-7, CM-7(1)</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.3.1.2 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 4.1<br>- 4.8</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94348-0</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Disable Unattended or Automatic Logon to the System

Automatic logon _MUST_ be disabled.

When automatic logons are enabled, the default user account is automatically logged on at boot time without prompting the user for a password. Even if the screen is later locked, a malicious user would be able to reboot the computer and find it already logged in. Disabling automatic logons mitigates this risk.

To check the state of the system, run the following command(s):

```bash
/usr/bin/osascript -l JavaScript << EOS
$.NSUserDefaults.alloc.initWithSuiteName('com.apple.loginwindow')\
.objectForKey('com.apple.login.mcx.DisableAutoLoginClient').js
EOS
```

If the result is not _true_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>com.apple.login.mcx.DisableAutoLoginClient</key>
  <true/>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_automatic_login_disable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- IA-2<br />- IA-5(13)</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.13.3 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 4.7</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94350-6</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Enable Bluetooth Menu

The bluetooth menu _MUST_ be enabled.

To check the state of the system, run the following command(s):

```bash
/usr/bin/osascript -l JavaScript << EOS
$.NSUserDefaults.alloc.initWithSuiteName('com.apple.controlcenter')\
.objectForKey('Bluetooth').js
EOS
```

If the result is not _18_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>Bluetooth</key>
  <integer>18</integer>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_bluetooth_menu_enable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td></td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.4.2 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 4.8<br>- 13.9</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94353-0</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Disable Bluetooth Sharing

Bluetooth Sharing _MUST_ be disabled.

Bluetooth Sharing allows users to wirelessly transmit files between the macOS and Bluetooth-enabled devices, including personally owned cellphones and tablets. A malicious user might introduce viruses or malware onto the system or extract sensitive files via Bluetooth Sharing. When Bluetooth Sharing is disabled, this risk is mitigated.

[NOTE]
====
The check and fix are for the last logged in user. To get the last logged in user, run the following.
```bash
CURRENT_USER=$( /usr/bin/defaults read /Library/Preferences/com.apple.loginwindow lastUserName )
```
====

To check the state of the system, run the following command(s):

```bash
/usr/bin/sudo -u "$CURRENT_USER" /usr/bin/defaults -currentHost read com.apple.Bluetooth PrefKeyServicesEnabled
```

If the result is not _0_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
/usr/bin/sudo -u "$CURRENT_USER" /usr/bin/defaults -currentHost write com.apple.Bluetooth PrefKeyServicesEnabled -bool false
```


</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_bluetooth_sharing_disable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AC-18(4)<br />- AC-3<br />- CM-7, CM-7(1)</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.3.3.10 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 3.3<br>- 4.1</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94355-5</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Enforce Critical Security Updates to be Installed

Ensure that security updates are installed as soon as they are available from Apple.

To check the state of the system, run the following command(s):

```bash
/usr/bin/osascript -l JavaScript << EOS
$.NSUserDefaults.alloc.initWithSuiteName('com.apple.SoftwareUpdate')\
.objectForKey('CriticalUpdateInstall').js
EOS
```

If the result is not _true_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>CriticalUpdateInstall</key>
  <true/>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_critical_update_install_enforce</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- SI-2</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 1.6 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 7.3<br>- 7.4<br>- 7.7</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94358-9</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Disable Sending Diagnostic and Usage Data to Apple

The ability to submit diagnostic data to Apple _MUST_ be disabled.

The information system _MUST_ be configured to provide only essential capabilities. Disabling the submission of diagnostic and usage information will mitigate the risk of unwanted data being sent to Apple.

To check the state of the system, run the following command(s):

```bash
/usr/bin/osascript -l JavaScript << EOS
function run() {
let pref1 = $.NSUserDefaults.alloc.initWithSuiteName('com.apple.SubmitDiagInfo')\
.objectForKey('AutoSubmit').js
let pref2 = $.NSUserDefaults.alloc.initWithSuiteName('com.apple.applicationaccess')\
.objectForKey('allowDiagnosticSubmission').js
if ( pref1 == false && pref2 == false ){
    return("true")
} else {
    return("false")
}
}
EOS
```

If the result is not _true_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>AutoSubmit</key>
  <false/>
</Payload>
<Payload>
  <key>allowDiagnosticSubmission</key>
  <false/>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_diagnostics_reports_disable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AC-20<br />- SC-7(10)<br />- SI-11</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.6.3.1 (level 1)<br>- 2.6.3.4 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 4.1<br>- 4.8</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94359-7</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Disable External Intelligence Integrations

Integration with external intelligence systems _MUST_ be disabled unless approved by the organization. Disabling external intelligence integration will mitigate the risk of data being sent to unapproved third party.

The information system _MUST_ be configured to provide only essential capabilities.

To check the state of the system, run the following command(s):

```bash
/usr/bin/osascript -l JavaScript << EOS
$.NSUserDefaults.alloc.initWithSuiteName('com.apple.applicationaccess')\
.objectForKey('allowExternalIntelligenceIntegrations').js
EOS
```

If the result is not _false_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>allowExternalIntelligenceIntegrations</key>
  <false/>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_external_intelligence_disable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AC-20<br />- CM-7, CM-7(1)</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.5.1.1 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 4.1<br>- 4.8<br>- 15.3</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94523-8</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Disable External Intelligence Integration Sign In

The ability to sign into an external intelligence systems _MUST_ be disabled unless approved by the organization. Disabling external intelligence integration will mitigate the risk of data being sent to unapproved third party.

The information system _MUST_ be configured to provide only essential capabilities.

To check the state of the system, run the following command(s):

```bash
/usr/bin/osascript -l JavaScript << EOS
$.NSUserDefaults.alloc.initWithSuiteName('com.apple.applicationaccess')\
.objectForKey('allowExternalIntelligenceIntegrationsSignIn').js
EOS
```

If the result is not _false_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>allowExternalIntelligenceIntegrationsSignIn</key>
  <false/>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_external_intelligence_sign_in_disable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AC-20<br />- CM-7, CM-7(1)</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.5.1.1 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 4.1<br>- 4.8<br>- 15.3</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94524-6</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Enforce FileVault

FileVault _MUST_ be enforced.

The information system implements cryptographic mechanisms to protect the confidentiality and integrity of information stored on digital media during transport outside of controlled areas.

> **NOTE:** See the FileVault supplemental to implement this rule.

To check the state of the system, run the following command(s):

```bash
dontAllowDisable=$(/usr/bin/osascript -l JavaScript << EOS
$.NSUserDefaults.alloc.initWithSuiteName('com.apple.MCX')\
.objectForKey('dontAllowFDEDisable').js
EOS
)
fileVault=$(/usr/bin/fdesetup status | /usr/bin/grep -c "FileVault is On.")
if [[ "$dontAllowDisable" == "true" ]] && [[ "$fileVault" == 1 ]]; then
  echo "1"
else
  echo "0"
fi
```

If the result is not _1_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>dontAllowFDEDisable</key>
  <true/>
</Payload>
```
> **NOTE:** See the FileVault supplemental to implement this rule.

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_filevault_enforce</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- SC-28, SC-28(1)</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.6.6 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 3.11<br>- 3.6</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94360-5</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Enable macOS Application Firewall

The macOS Application Firewall is the built-in firewall that comes with macOS, and it _MUST_ be enabled.

When the macOS Application Firewall is enabled, the flow of information within the information system and between interconnected systems will be controlled by approved authorizations.

To check the state of the system, run the following command(s):

```bash
/usr/bin/osascript -l JavaScript << EOS
$.NSUserDefaults.alloc.initWithSuiteName('com.apple.security.firewall')\
.objectForKey('EnableFirewall').js
EOS
```

If the result is not _true_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
/usr/bin/defaults write /Library/Preferences/com.apple.alf globalstate -int 1
```


</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_firewall_enable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AC-4<br />- CM-7, CM-7(1)<br />- SC-7, SC-7(12)</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.2.1 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 4.1<br>- 4.5<br>- 13.1</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94362-1</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Enable Firewall Stealth Mode

Firewall Stealth Mode _MUST_ be enabled.

When stealth mode is enabled, the Mac will not respond to any probing requests, and only requests from authorized applications will still be authorized.

> **IMPORTANT:** Enabling firewall stealth mode may prevent certain remote mechanisms used for maintenance and compliance scanning from properly functioning. Information System Security Officers (ISSOs) are advised to first fully weigh the potential risks posed to their organization before opting not to enable stealth mode.

To check the state of the system, run the following command(s):

```bash
/usr/bin/osascript -l JavaScript << EOS
$.NSUserDefaults.alloc.initWithSuiteName('com.apple.security.firewall')\
.objectForKey('EnableStealthMode').js
EOS
```

If the result is not _true_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
/usr/bin/defaults write /Library/Preferences/com.apple.alf stealthenabled -int 1
```


</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_firewall_stealth_mode_enable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- CM-7, CM-7(1)<br />- SC-7, SC-7(16)</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.2.2 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 4.1<br>- 4.5<br>- 4.8</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94363-9</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Disable Guest Access to Shared SMB Folders

Guest access to shared Server Message Block (SMB) folders _MUST_ be disabled.

Turning off guest access prevents anonymous users from accessing files shared via SMB.

To check the state of the system, run the following command(s):

```bash
/usr/bin/defaults read /Library/Preferences/SystemConfiguration/com.apple.smb.server AllowGuestAccess
```

If the result is not _0_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
/usr/sbin/sysadminctl -smbGuestAccess off
```


</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_guest_access_smb_disable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AC-2, AC-2(9)</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.13.2 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 3.3</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94366-2</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Disable the Guest Account

Guest access _MUST_ be disabled.

Turning off guest access prevents anonymous users from accessing files.

To check the state of the system, run the following command(s):

```bash
/usr/bin/osascript -l JavaScript << EOS
function run() {
  let pref1 = ObjC.unwrap($.NSUserDefaults.alloc.initWithSuiteName('com.apple.MCX')\
.objectForKey('DisableGuestAccount'))
  let pref2 = ObjC.unwrap($.NSUserDefaults.alloc.initWithSuiteName('com.apple.MCX')\
.objectForKey('EnableGuestAccount'))
  if ( pref1 == true && pref2 == false ) {
    return("true")
  } else {
    return("false")
  }
}
EOS
```

If the result is not _true_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>DisableGuestAccount</key>
  <true/>
  <key>EnableGuestAccount</key>
  <false/>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_guest_account_disable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AC-2, AC-2(9)</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.13.1 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 5.2<br>- 6.2<br>- 6.8</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94367-0</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Disable Sending Audio Recordings and Transcripts to Apple

The ability for Apple to store and review audio of your audio recordings and transcripts of your vocal shortcuts and voice control interactions _MUST_ be disabled. This will disable "Improve Assistive Voice Features" in Privacy & Security within System Settings.

The information system _MUST_ be configured to provide only essential capabilities. Disabling the submission of this information will mitigate the risk of unwanted data being sent to Apple.

To check the state of the system, run the following command(s):

```bash
/usr/bin/osascript -l JavaScript << EOS
$.NSUserDefaults.alloc.initWithSuiteName('com.apple.Accessibility')\
.objectForKey('AXSAudioDonationSiriImprovementEnabled').js
EOS
```

If the result is not _false_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>AXSAudioDonationSiriImprovementEnabled</key>
  <false/>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_improve_assistive_voice_disable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AC-20<br />- CM-7, CM-7(1)<br />- SC-7(10)</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.6.3.3 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 4.1<br>- 4.8</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94370-4</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Disable Improve Search Information to Apple

Sending data to Apple to help improve search _MUST_ be disabled. This will disable "Improve Search" within Spotlight in System Settings.

The information system _MUST_ be configured to provide only essential capabilities. Disabling the submission of search data will mitigate the risk of unwanted data being sent to Apple.

To check the state of the system, run the following command(s):

```bash
/usr/bin/osascript -l JavaScript << EOS
$.NSUserDefaults.alloc.initWithSuiteName('com.apple.assistant.support')\
.objectForKey('Search Queries Data Sharing Status').js
EOS
```

If the result is not _2_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>Search Queries Data Sharing Status</key>
  <integer>2</integer>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_improve_search_disable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AC-20<br />- CM-7, CM-7(1)<br />- SC-7(10)</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.9.1 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 4.1<br>- 4.8</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94371-2</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Disable Improve Siri and Dictation Information to Apple

The ability for Apple to store and review audio of your Siri and Dictation interactions _MUST_ be disabled.

The information system _MUST_ be configured to provide only essential capabilities. Disabling the submission of Siri and Dictation information will mitigate the risk of unwanted data being sent to Apple.

To check the state of the system, run the following command(s):

```bash
/usr/bin/osascript -l JavaScript << EOS
$.NSUserDefaults.alloc.initWithSuiteName('com.apple.assistant.support')\
.objectForKey('Siri Data Sharing Opt-In Status').js
EOS
```

If the result is not _2_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>Siri Data Sharing Opt-In Status</key>
  <integer>2</integer>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_improve_siri_dictation_disable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AC-20<br />- CM-7, CM-7(1)<br />- SC-7(10)</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.6.3.2 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 4.1<br>- 4.8</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94372-0</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Enforce macOS Updates are Automatically Installed

Software Update _MUST_ be configured to enforce automatic installation of macOS updates is enabled.

To check the state of the system, run the following command(s):

```bash
/usr/bin/osascript -l JavaScript << EOS
$.NSUserDefaults.alloc.initWithSuiteName('com.apple.SoftwareUpdate')\
.objectForKey('AutomaticallyInstallMacOSUpdates').js
EOS
```

If the result is not _true_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>AutomaticallyInstallMacOSUpdates</key>
  <true/>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_install_macos_updates_enforce</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td></td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 1.4 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 7.3<br>- 7.4</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94373-8</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Disable Internet Sharing

If the system does not require Internet sharing, support for it is non-essential and _MUST_ be disabled.

The information system _MUST_ be configured to provide only essential capabilities. Disabling Internet sharing helps prevent the unauthorized connection of devices, unauthorized transfer of information, and unauthorized tunneling.

To check the state of the system, run the following command(s):

```bash
/usr/bin/osascript -l JavaScript << EOS
$.NSUserDefaults.alloc.initWithSuiteName('com.apple.MCX')\
.objectForKey('forceInternetSharingOff').js
EOS
```

If the result is not _true_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>forceInternetSharingOff</key>
  <true/>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_internet_sharing_disable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AC-20<br />- AC-4</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.3.3.7 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 4.1<br>- 4.8</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94375-3</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Ensure Location Services Is In the Menu Bar

Location Services menu item _MUST_ be enabled.

To check the state of the system, run the following command(s):

```bash
/usr/bin/defaults read /Library/Preferences/com.apple.locationmenu.plist ShowSystemServices
```

If the result is not _1_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
/usr/bin/defaults write /Library/Preferences/com.apple.locationmenu.plist ShowSystemServices -bool true
```


</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_location_services_menu_enforce</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td></td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.6.1.2 (level 2)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 4.1<br>- 4.8</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94378-7</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Configure Login Window to Show A Custom Message

The login window _MUST_ be configured to show a custom access warning message.

To check the state of the system, run the following command(s):

```bash
/usr/bin/osascript -l JavaScript << EOS | /usr/bin/base64
$.NSUserDefaults.alloc.initWithSuiteName('com.apple.loginwindow')\
.objectForKey('LoginwindowText').js
EOS
```

If the result is not _Center for Internet Security Test Message_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>LoginwindowText</key>
  <string>Center for Internet Security Test Message</string>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_loginwindow_loginwindowtext_enable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td></td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.11.3 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 4.1</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94379-5</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Configure Login Window to Prompt for Username and Password

The login window _MUST_ be configured to prompt all users for both a username and a password.

By default, the system displays a list of known users on the login window, which can make it easier for a malicious user to gain access to someone else's account. Requiring users to type in both their username and password mitigates the risk of unauthorized users gaining access to the information system.

To check the state of the system, run the following command(s):

```bash
/usr/bin/osascript -l JavaScript << EOS
$.NSUserDefaults.alloc.initWithSuiteName('com.apple.loginwindow')\
.objectForKey('SHOWFULLNAME').js
EOS
```

If the result is not _true_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>SHOWFULLNAME</key>
  <true/>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_loginwindow_prompt_username_password_enforce</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- IA-2</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.11.4 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 4.1</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94380-3</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Disable Password Hints

Password hints _MUST_ be disabled.

Password hints leak information about passwords that are currently in use and can lead to loss of confidentiality.

To check the state of the system, run the following command(s):

```bash
/usr/bin/osascript -l JavaScript << EOS
$.NSUserDefaults.alloc.initWithSuiteName('com.apple.loginwindow')\
.objectForKey('RetriesUntilHint').js
EOS
```

If the result is not _0_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>RetriesUntilHint</key>
  <integer>0</integer>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_password_hints_disable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- IA-6</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.11.5 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 4.1</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94382-9</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Disable Personalized Advertising

Ad tracking and targeted ads _MUST_ be disabled.

The information system _MUST_ be configured to provide only essential capabilities. Disabling ad tracking ensures that applications and advertisers are unable to track users' interests and deliver targeted advertisements.

To check the state of the system, run the following command(s):

```bash
/usr/bin/osascript -l JavaScript << EOS
$.NSUserDefaults.alloc.initWithSuiteName('com.apple.applicationaccess')\
.objectForKey('allowApplePersonalizedAdvertising').js
EOS
```

If the result is not _false_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>allowApplePersonalizedAdvertising</key>
  <false/>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_personalized_advertising_disable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AC-20<br />- CM-7, CM-7(1)<br />- SC-7(10)</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.6.4 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 4.8</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94383-7</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Disable Printer Sharing

Printer Sharing _MUST_ be disabled.

To check the state of the system, run the following command(s):

```bash
/usr/sbin/cupsctl | /usr/bin/grep -c "_share_printers=0"
```

If the result is not _1_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
/usr/sbin/cupsctl --no-share-printers
/usr/bin/lpstat -p | awk '{print $2}'| /usr/bin/xargs -I{} lpadmin -p {} -o printer-is-shared=false
```


</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_printer_sharing_disable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- CM-7, CM-7(1)</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.3.3.3 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 4.1<br>- 4.8</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94384-5</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Disable Remote Apple Events

If the system does not require Remote Apple Events, support for Apple Remote Events is non-essential and _MUST_ be disabled.

The information system _MUST_ be configured to provide only essential capabilities. Disabling Remote Apple Events helps prevent the unauthorized connection of devices, the unauthorized transfer of information, and unauthorized tunneling.

To check the state of the system, run the following command(s):

```bash
/bin/launchctl print-disabled system | /usr/bin/grep -c '"com.apple.AEServer" => disabled'
```

If the result is not _1_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
/usr/sbin/systemsetup -setremoteappleevents off
/bin/launchctl disable system/com.apple.AEServer
```

> **NOTE:** Systemsetup with -setremoteappleevents flag will fail unless you grant Full Disk Access to systemsetup or its parent process. Requires supervision.

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_rae_disable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AC-17<br />- AC-3</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.3.3.6 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 4.1<br>- 4.8</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94385-2</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Disable Remote Management

Remote Management _MUST_ be disabled.

To check the state of the system, run the following command(s):

```bash
/usr/libexec/mdmclient QuerySecurityInfo 2>/dev/null | /usr/bin/grep -c "RemoteDesktopEnabled = 0"
```

If the result is not _1_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -deactivate -stop
```


</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_remote_management_disable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- CM-7, CM-7(1)</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.3.3.5 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 4.1<br>- 4.8<br>- 5.4</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94386-0</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Disable Screen Sharing and Apple Remote Desktop

Support for both Screen Sharing and Apple Remote Desktop (ARD) is non-essential and _MUST_ be disabled.

The information system _MUST_ be configured to provide only essential capabilities. Disabling screen sharing and ARD helps prevent the unauthorized connection of devices, the unauthorized transfer of information, and unauthorized tunneling.

To check the state of the system, run the following command(s):

```bash
/bin/launchctl print-disabled system | /usr/bin/grep -c '"com.apple.screensharing" => disabled'
```

If the result is not _1_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
/bin/launchctl disable system/com.apple.screensharing
```

NOTE - This will apply to the whole system

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_screen_sharing_disable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AC-17<br />- AC-3</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.3.3.1 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 4.1<br>- 4.8</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94387-8</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Enforce Session Lock After Screen Saver is Started

A screen saver _MUST_ be enabled and the system _MUST_ be configured to require a password to unlock once the screensaver has been on for a maximum of 5 seconds.

An unattended system with an excessive grace period is vulnerable to a malicious user.

To check the state of the system, run the following command(s):

```bash
/usr/bin/osascript -l JavaScript << EOS
function run() {
  let delay = ObjC.unwrap($.NSUserDefaults.alloc.initWithSuiteName('com.apple.screensaver')\
.objectForKey('askForPasswordDelay'))
  if ( delay <= $ODV ) {
    return("true")
  } else {
    return("false")
  }
}
EOS
```

If the result is not _true_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>askForPasswordDelay</key>
  <integer>5</integer>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_screensaver_ask_for_password_delay_enforce</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AC-11</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.11.2 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 4.7</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94388-6</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Enforce Screen Saver Timeout

The screen saver timeout _MUST_ be set to 900 seconds or a shorter length of time.

This rule ensures that a full session lock is triggered within no more than 900 seconds of inactivity.

To check the state of the system, run the following command(s):

```bash
/usr/bin/osascript -l JavaScript << EOS
function run() {
  let timeout = ObjC.unwrap($.NSUserDefaults.alloc.initWithSuiteName('com.apple.screensaver')\
.objectForKey('idleTime'))
  if ( timeout <= $ODV ) {
    return("true")
  } else {
    return("false")
  }
}
EOS
```

If the result is not _true_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>idleTime</key>
  <integer>900</integer>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_screensaver_timeout_enforce</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AC-11<br />- IA-11</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.11.1 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 4.3</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94390-2</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Disable Siri

Support for Siri is non-essential and _MUST_ be disabled to prevent organizational data from being synchronized to Apple servers.

Apple's Siri service does not provide an organization with enough control over the storage and access of data, and, therefore, automated synchronization _MUST_ be controlled by an organization approved service.

The information system _MUST_ be configured to provide only essential capabilities.

To check the state of the system, run the following command(s):

```bash
/usr/bin/osascript -l JavaScript << EOS
$.NSUserDefaults.alloc.initWithSuiteName('com.apple.applicationaccess')\
.objectForKey('allowAssistant').js
EOS
```

If the result is not _false_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>allowAssistant</key>
  <false/>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_siri_disable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AC-20<br />- CM-7, CM-7(1)<br />- SC-7(10)</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.5.2.1 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 4.1<br>- 4.8</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94391-0</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Disable Server Message Block Sharing

Support for Server Message Block (SMB) file sharing is non-essential and _MUST_ be disabled.

The information system _MUST_ be configured to provide only essential capabilities.

To check the state of the system, run the following command(s):

```bash
/bin/launchctl print-disabled system | /usr/bin/grep -c '"com.apple.smbd" => disabled'
```

If the result is not _1_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
/bin/launchctl disable system/com.apple.smbd
```

The system may need to be restarted for the update to take effect.

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_smbd_disable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AC-17<br />- AC-3</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.3.3.2 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 4.1<br>- 4.8<br>- 5.4</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94394-4</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Enforce Software Update App Update Updates Automatically

Software Update _MUST_ be configured to enforce automatic updates of App Updates is enabled.

To check the state of the system, run the following command(s):

```bash
/usr/bin/osascript -l JavaScript << EOS
$.NSUserDefaults.alloc.initWithSuiteName('com.apple.SoftwareUpdate')\
.objectForKey('AutomaticallyInstallAppUpdates').js
EOS
```

If the result is not _true_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>AutomaticallyInstallAppUpdates</key>
  <true/>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_software_update_app_update_enforce</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td></td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 1.5 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 7.3<br>- 7.4</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94395-1</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Enforce Software Update Downloads Updates Automatically

Software Update _MUST_ be configured to enforce automatic downloads of updates is enabled.

To check the state of the system, run the following command(s):

```bash
/usr/bin/osascript -l JavaScript << EOS
$.NSUserDefaults.alloc.initWithSuiteName('com.apple.SoftwareUpdate')\
.objectForKey('AutomaticDownload').js
EOS
```

If the result is not _true_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>AutomaticDownload</key>
  <true/>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_software_update_download_enforce</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td></td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 1.3 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 7.3<br>- 7.4</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94396-9</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Enforce Software Update Automatically

Software Update _MUST_ be configured to enforce automatic update is enabled.

To check the state of the system, run the following command(s):

```bash
/usr/bin/osascript -l JavaScript << EOS
$.NSUserDefaults.alloc.initWithSuiteName('com.apple.SoftwareUpdate')\
.objectForKey('AutomaticCheckEnabled').js
EOS
```

If the result is not _true_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>AutomaticCheckEnabled</key>
  <true/>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_software_update_enforce</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- SI-2(5)</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 1.2 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 7.3<br>- 7.4</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94397-7</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Ensure Software Update is Updated and Current

Make sure Software Update is updated and current.

[Update macOS on Mac](https://support.apple.com/en-us/108382) or if enrolled in an MDM consult your MDM's documentation for automated methods.

To check the state of the system, run the following command(s):

```bash
softwareupdate_date_epoch=$(/bin/date -j -f "%Y-%m-%d" "$(/usr/bin/defaults read /Library/Preferences/com.apple.SoftwareUpdate.plist LastFullSuccessfulDate | /usr/bin/awk '{print $1}')" "+%s")
thirty_days_epoch=$(/bin/date -v -30d "+%s")
if [[ $softwareupdate_date_epoch -lt $thirty_days_epoch ]]; then
  /bin/echo "0"
else
  /bin/echo "1"
fi
```

If the result is not _1_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
/usr/sbin/softwareupdate -i -a
```

NOTE - This will apply to the whole system

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_softwareupdate_current</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- SI-2</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 1.1 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 7.3<br>- 7.4</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94398-5</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Disable SSH Server for Remote Access Sessions

SSH service _MUST_ be disabled for remote access.

To check the state of the system, run the following command(s):

```bash
/bin/launchctl print-disabled system | /usr/bin/grep -c '"com.openssh.sshd" => disabled'
```

If the result is not _1_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
/usr/sbin/systemsetup -f -setremotelogin off >/dev/null
/bin/launchctl disable system/com.openssh.sshd
```

> **NOTE:** Systemsetup with -setremotelogin flag will fail unless you grant Full Disk Access to systemsetup or its parent process. Requires supervision.

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_ssh_disable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AC-17<br />- CM-7, CM-7(1)</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.3.3.4 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 4.1<br>- 4.8</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94399-3</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Require Administrator Password to Modify System-Wide Preferences

The system _MUST_ be configured to require an administrator password in order to modify the system-wide preferences in System Settings.

Some Preference Panes in System Settings contain settings that affect the entire system. Requiring a password to unlock these system-wide settings reduces the risk of a non-authorized user modifying system configurations.

To check the state of the system, run the following command(s):

```bash
authDBs=("system.preferences" "system.preferences.energysaver" "system.preferences.network" "system.preferences.printing" "system.preferences.sharing" "system.preferences.softwareupdate" "system.preferences.startupdisk" "system.preferences.timemachine")
result="1"
for section in ${authDBs[@]}; do
  if [[ $(/usr/bin/security -q authorizationdb read "$section" | /usr/bin/xmllint -xpath 'name(//*[contains(text(), "shared")]/following-sibling::*[1])' -) != "false" ]]; then
    result="0"
  fi
  if [[ $(/usr/bin/security -q authorizationdb read "$section" | /usr/bin/xmllint -xpath '//*[contains(text(), "group")]/following-sibling::*[1]/text()' - ) != "admin" ]]; then
    result="0"
  fi
  if [[ $(/usr/bin/security -q authorizationdb read "$section" | /usr/bin/xmllint -xpath 'name(//*[contains(text(), "authenticate-user")]/following-sibling::*[1])' -) != "true" ]]; then
    result="0"
  fi
  if [[ $(/usr/bin/security -q authorizationdb read "$section" | /usr/bin/xmllint -xpath 'name(//*[contains(text(), "session-owner")]/following-sibling::*[1])' -) != "false" ]]; then
    result="0"
  fi
done
echo $result
```

If the result is not _1_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
authDBs=("system.preferences" "system.preferences.energysaver" "system.preferences.network" "system.preferences.printing" "system.preferences.sharing" "system.preferences.softwareupdate" "system.preferences.startupdisk" "system.preferences.timemachine")

for section in ${authDBs[@]}; do
  /usr/bin/security -q authorizationdb read "$section" > "/tmp/$section.plist"

  class_key_value=$(/usr/libexec/PlistBuddy -c "Print :class" "/tmp/$section.plist" 2>&1)
  if [[ "$class_key_value" == *"Does Not Exist"* ]]; then
    /usr/libexec/PlistBuddy -c "Add :class string user" "/tmp/$section.plist"
  else
    /usr/libexec/PlistBuddy -c "Set :class user" "/tmp/$section.plist"
  fi

  key_value=$(/usr/libexec/PlistBuddy -c "Print :shared" "/tmp/$section.plist" 2>&1)  	
  if [[ "$key_value" == *"Does Not Exist"* ]]; then
    /usr/libexec/PlistBuddy -c "Add :shared bool false" "/tmp/$section.plist"
  else
    /usr/libexec/PlistBuddy -c "Set :shared false" "/tmp/$section.plist"
  fi

  auth_user_key=$(/usr/libexec/PlistBuddy -c "Print :authenticate-user" "/tmp/$section.plist" 2>&1)  	
  if [[ "$auth_user_key" == *"Does Not Exist"* ]]; then
    /usr/libexec/PlistBuddy -c "Add :authenticate-user bool true" "/tmp/$section.plist"
  else
    /usr/libexec/PlistBuddy -c "Set :authenticate-user true" "/tmp/$section.plist"
  fi

  session_owner_key=$(/usr/libexec/PlistBuddy -c "Print :session-owner" "/tmp/$section.plist" 2>&1)  	
  if [[ "$session_owner_key" == *"Does Not Exist"* ]]; then
    /usr/libexec/PlistBuddy -c "Add :session-owner bool false" "/tmp/$section.plist"
  else
    /usr/libexec/PlistBuddy -c "Set :session-owner false" "/tmp/$section.plist"
  fi

  group_key=$(/usr/libexec/PlistBuddy -c "Print :group" "/tmp/$section.plist" 2>&1)
  if [[ "$group_key" == *"Does Not Exist"* ]]; then
    /usr/libexec/PlistBuddy -c "Add :group string admin" "/tmp/$section.plist"
  else
    /usr/libexec/PlistBuddy -c "Set :group admin" "/tmp/$section.plist"
  fi

  /usr/bin/security -q authorizationdb write "$section" < "/tmp/$section.plist"
done
```


</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_system_wide_preferences_configure</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AC-6, AC-6(1), AC-6(2)</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.6.8 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 4.1</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94401-7</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Ensure Time Machine Volumes are Encrypted

Time Machine volumes _MUST_ be encrypted.

To check the state of the system, run the following command(s):

```bash
/usr/bin/sudo /usr/bin/defaults read /Library/Preferences/com.apple.TimeMachine.plist | grep -c NotEncrypted
```

If the result is not _0_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

**Go to System Settings -> Time Machine**
**Click *Select Disk***
**Select existing Backup Disk under *Available Disks***
**Click *Encrypt Backups***
**Click *Use Disk***

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_time_machine_encrypted_configure</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td></td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.3.4.2 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 3.11<br>- 3.6<br>- 11.3</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94403-3</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Configure macOS to Use an Authorized Time Server

Approved time server _MUST_ be the only server configured for use.

This rule ensures the uniformity of time stamps for information systems with multiple system clocks and systems connected over a network.

> **NOTE:** As of macOS 10.13 only one time server is supported.

To check the state of the system, run the following command(s):

```bash
/usr/bin/osascript -l JavaScript << EOS
$.NSUserDefaults.alloc.initWithSuiteName('com.apple.MCX')\
.objectForKey('timeServer').js
EOS
```

If the result is not _time.apple.com_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>timeServer</key>
  <string>time.apple.com</string>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_time_server_configure</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AU-12(1)<br />- SC-45(1)</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.3.2.1 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 8.4</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94404-1</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Enforce macOS Time Synchronization

Time synchronization _MUST_ be enforced on all networked systems.

This rule ensures the uniformity of time stamps for information systems with multiple system clocks and systems connected over a network.

To check the state of the system, run the following command(s):

```bash
/usr/bin/osascript -l JavaScript << EOS
$.NSUserDefaults.alloc.initWithSuiteName('com.apple.timed')\
.objectForKey('TMAutomaticTimeOnlyEnabled').js
EOS
```

If the result is not _true_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>com.apple.timed</key>
  <dict>
    <key>TMAutomaticTimeOnlyEnabled</key>
    <true/>
  </dict>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_time_server_enforce</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td>- AU-12(1)<br />- SC-45(1)</td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.3.2.1 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 8.4</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94405-8</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Ensure Wake for Network Access Is Disabled

Wake for network access _MUST_ be disabled.

To check the state of the system, run the following command(s):

```bash
/usr/bin/pmset -g custom | /usr/bin/awk '/womp/ { sum+=$2 } END {print sum}'
```

If the result is not _0_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />

Perform the following to configure the system to meet the requirements:

Run the following command(s):

```bash
/usr/bin/pmset -a womp 0
```


</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_wake_network_access_disable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td></td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.10.3 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 4.8</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94410-8</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

### Enable Wifi Menu

The WiFi menu _MUST_ be enabled.

To check the state of the system, run the following command(s):

```bash
/usr/bin/osascript -l JavaScript << EOS
$.NSUserDefaults.alloc.initWithSuiteName('com.apple.controlcenter')\
.objectForKey('WiFi').js
EOS
```

If the result is not _18_, this is a finding.

<table class="remediation">
<tr>
<td>
<p>
<strong>Remediation Description</strong><br /><br />


Deploy a configuration profile containing the following payload.
```xml
<Payload>
  <key>WiFi</key>
  <integer>18</integer>
</Payload>
```

</p>
</td>
</tr>
</table>

<table class="outer-table" border="1">
  <tr>
    <td> ID </td>
    <td>system_settings_wifi_menu_enable</td>
  </tr>
  <tr>
    <td>References</td>
    <td>
      <table class="nested-table">
        <tr>
          <td><strong>800-53r5</strong></td>
          <td></td>
        </tr>
        <tr>
          <td><strong>CIS Benchmark</strong></td>
          <td>- 2.4.1 (level 1)</td>
        </tr>
        <tr>
          <td><strong>CIS Controls V8</strong></td>
          <td>- 4.8<br>- 12.6</td>
        </tr>
        <tr>
          <td><strong>CCE</strong></td>
          <td>- CCE-94414-0</td>
        </tr>
      </table>
    </td>
  </tr>
</table>
