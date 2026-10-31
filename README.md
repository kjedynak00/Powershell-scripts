# 🚀 Powershell Scripts Collection
PowerShell scripts for sysadmin and network automation.

![GitHub stars](https://img.shields.io/github/stars/kjedynak00/Powershell-scripts?style=social)
![Last commit](https://img.shields.io/github/last-commit/kjedynak00/Powershell-scripts)
![Repo size](https://img.shields.io/github/repo-size/kjedynak00/Powershell-scripts)
![Top language](https://img.shields.io/github/languages/top/kjedynak00/Powershell-scripts)
![PowerShell](https://img.shields.io/badge/PowerShell-Scripts-blue)
![Windows](https://img.shields.io/badge/Windows-Compatible-blueviolet)
![Automation](https://img.shields.io/badge/Automation-Ready-success)
![Maintained](https://img.shields.io/badge/Maintained-Yes-brightgreen)

---
## 📊 Quick Stats

Category | Script | Description | Status |
| :--- | :--- | :--- | :--- |
| **Monitoring** | [`ping.ps1`](ping.ps1) | 🌐 GUI ping checker – paste hosts or load them from a file, see which are reachable | 🟢 Production |
| **Monitoring** | [`Remote-CDrive-And-Uptime.ps1`](Remote-CDrive-And-Uptime.ps1) | 🕒 Uptime and C: drive free space of many Windows machines via PowerShell remoting | 🟢 Production |
| **Reporting** | [`system-raport.ps1`](system-raport.ps1) | 📊 Local system report: hostname, OS, CPU, uptime, disks | 🟡 In progress |

---
## 🧰 Scripts

### 🌐 ping.ps1
Windows Forms app for quick reachability checks.
- Paste host names / IPs (one per line) or click **Load from file**
- Click **Check** – every host is tested with `Test-NetConnection`
- Results are colour-coded: `[OK]`, `[FAIL]`, `[ERROR]`

```powershell
.\ping.ps1
```

### 🕒 Remote-CDrive-And-Uptime.ps1
Connects to every machine from a list over PowerShell remoting and prints its uptime and C: drive free space, with a progress bar.
- Asks once for admin credentials (`Get-Credential`)
- C: drive shown as `free GB of total GB (free %)` – green when OK, red + warning when below the threshold
- Unreachable hosts are reported as warnings, the loop keeps going
- Sessions are always closed, even after an error

**Configuration:** at the top of the script set the path to your host list (one host per line) and the low space threshold:
```powershell
$list = Get-Content -Path "C:\Users\USERNAME\Desktop\testing-list.txt"
$MinFreePercent = 15   # warn when C: has less free space than this
```
```powershell
.\Remote-CDrive-And-Uptime.ps1
```

### 📊 system-raport.ps1
Collects basic information about the local machine: hostname, OS version, CPU, uptime and fixed disks with free space.  
🟡 Work in progress – the data is gathered, report output and RAM usage are not finished yet.

---
## ⚙️ Requirements
- Windows
- PowerShell 5.1 or newer (PowerShell 7+ recommended)
- For `Remote-CDrive-And-Uptime.ps1`:
  - PowerShell Remoting (WinRM) enabled on the target machines
  - Admin credentials for those machines
  - Network access to the hosts

---
## ▶️ Usage
If script execution is blocked, allow it for the current session only:
```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\script-name.ps1
```

---
## 👋 Contact
- Author: Kacper Jedynak
- Homelab: [kjedynak00/Home-lab](https://github.com/kjedynak00/Home-lab)
