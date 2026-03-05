# 🛠️ PowerShell Tools

A growing collection of PowerShell scripts for Microsoft 365, Active Directory, Intune, and Azure administration — built and maintained by a Systems Administrator working in a hybrid cloud enterprise environment.

---

## 📋 Scripts

### `Get-SystemReport.ps1`
Pulls a quick summary of a Windows machine's key system information — OS, CPU, RAM usage, last boot time, and current user. Useful for remote diagnostics and asset checks.

**Output includes:**
- Computer name & current user
- OS version
- Last boot time
- CPU model
- Total & free RAM (GB)

**Usage:**
```powershell
.\Get-SystemReport.ps1
```

---

### `Get-DiskSpaceReport.ps1`
Checks disk space across all fixed drives on a Windows machine, flags any drives below a configurable warning threshold, and exports a timestamped CSV report.

**Output includes:**
- Computer name & drive letter
- Total and free disk space (GB)
- Percentage free
- Status (OK / WARNING)
- Date and time checked

**Parameters:**
| Parameter | Default | Description |
|---|---|---|
| `-ComputerName` | Local machine | Target computer to check |
| `-WarningThreshold` | 20 | % free space that triggers a WARNING |
| `-ExportPath` | Desktop\DiskSpaceReport.csv | Where to save the CSV report |

**Usage:**
```powershell
# Run against local machine with defaults
.\Get-DiskSpaceReport.ps1

# Run with custom threshold
.\Get-DiskSpaceReport.ps1 -WarningThreshold 15

# Run against a remote machine
.\Get-DiskSpaceReport.ps1 -ComputerName "PC123" -WarningThreshold 10
```

---

## 🚀 More scripts coming soon
This repository is actively being developed. Upcoming scripts will cover:
- Microsoft 365 licence reporting
- Active Directory user auditing
- Intune device compliance checks
- Azure automation tasks

---

## 👨‍💻 About

I'm an IT professional with a strong background in service desk support and a growing focus on system administration. I currently support over 300+ users in a hybrid cloud environment, working with Active Directory, Microsoft Intune, Office 365, and Azure AD.

I enjoy solving problems, streamlining processes, and making tech work better for people. I've been involved in cloud migrations, security improvements, and automation with PowerShell.

**Certifications:**
- Microsoft Certified: Azure Fundamentals (AZ-900)
- ITIL Foundation Certificate in IT Service Management
- City & Guilds Level 3 — ICT Support Technician
- Level 3 ICT — Cloud Support Specialist (QA Apprenticeships)

---

## 📬 Connect
- [LinkedIn](https://www.linkedin.com/in/kamen-chan-40a962264/)