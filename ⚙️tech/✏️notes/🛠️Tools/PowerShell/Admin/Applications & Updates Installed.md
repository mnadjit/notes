---
alias: 
tags: windows cim wmi installed_apps
---

# References
- [Blog](https://xkln.net/blog/please-stop-using-win32product-to-find-installed-software-alternatives-inside/)

# Registry
## Installed x64 and x86 apps
```PowerShell
@('HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*', 'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*') | Get-ItemProperty | Where-Object { $_.'(default)' -eq $null } | Select @{l='Name';e={if ($_.DisplayName -eq $null) {$_.PSPath.Split('\')[-1]} else {$_.DisplayName}}}, Publisher, DisplayVersion, InstallDate, InstallLocation, @{l='x86/x64'; e={ if ($_.pspath -like '*wow6432node*') {'x86'} else {'x64'} } } | Sort-Object Name | Format-Table -AutoSize
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