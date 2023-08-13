---
alias: 
tags: windows cim wmi
---

# References
- [Blog](https://xkln.net/blog/please-stop-using-win32product-to-find-installed-software-alternatives-inside/)

# Registry
## Installed x64 and x86 apps
```PowerShell
@('HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*', 'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*') | Get-ItemProperty | Where-Object { $_.'(default)' -eq $null } | Select DisplayName, Publisher, DisplayVersion, InstallDate | Format-Table -AutoSize
```

# CIM Instances
## Installed apps
```PowerShell
Get-CimInstance -ClassName 'win32_product'
```
## Windows Updates
```PowerShell
Get-CimInstance -ClassName 'win32_quickfixengineering'
```

# Definitions
- CIM: Common Information Model
- WMI: Windows Management Instrumentation