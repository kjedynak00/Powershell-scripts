# 🚀 Powershell Scripts Collection
Production-ready PowerShell scripts for sysadmin and network automation.

![GitHub stars](https://img.shields.io/github/stars/kjedynak00/Powershell-scripts?style=social)
![Last commit](https://img.shields.io/github/last-commit/kjedynak00/Powershell-scripts)
![Repo size](https://img.shields.io/github/repo-size/kjedynak00/Powershell-scripts)
![Top language](https://img.shields.io/github/languages/top/kjedynak00/Powershell-scripts)
![PowerShell](https://img.shields.io/badge/PowerShell-Scripts-blue)
![Windows](https://img.shields.io/badge/Windows-Compatible-blueviolet)
![Automation](https://img.shields.io/badge/Automation-Ready-success)
![Maintained](https://img.shields.io/badge/Maintained-Yes-brightgreen)

---
# 🖥️ System Monitoring & Alerts
* `system-report` - 📊 System health reporter: Generates comprehensive system diagnostics
* `ping` - 🌐 Network reachability scanner: Pings machines from LIST.txt + detailed reachability report
* `Remote-CDrive-And-Uptime` - 🕒 Remote uptime & disk usage monitor: Checks Windows machine uptime and C: drive usage across multiple hosts via PowerShell remoting
---

# 📊 Quick Stats
Category | Script Name | Description | Status |
| :--- | :--- | :--- | :--- |
| **Reporting** | system-raport | Comprehensive system health & diagnostics report	 | 🟡 IN PROGRESS |
| **Monitoring** | ping | Multi-host ping scanner from LIST.txt + status report	 | 🟢 Production |
| **Monitoring** | Remote-CDrive-And-Uptime | Remote PowerShell script for checking Windows machine uptime and C: drive usage across multiple hosts using PowerShell remoting	 | 🟢 Production |

---
## ⚙️ Requirements
- Windows system
- PowerShell 5.1 or newer (PowerShell 7+ recommended)
- Optional:
  - Network access to remote hosts
  - PowerShell Remoting enabled (for remote scripts)
  - Input file (e.g. `LIST.txt` for ping script)
---
## ▶️ Usage
```powershell
.\script.ps1
```
