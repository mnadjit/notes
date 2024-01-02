---
aliases: 
tags:
  - windows
  - cim
  - wmi
  - installed_apps
  - installed_applications
---

# References
- [Blog](https://xkln.net/blog/please-stop-using-win32product-to-find-installed-software-alternatives-inside/)

# Registry
#registry 
## Installed x64 and x86 apps
```PowerShell
@('HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*', 'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*') | Get-ItemProperty | Where-Object { $_.'(default)' -eq $null } | Select @{l='Name';e={if ($_.DisplayName -eq $null) {$_.PSPath.Split('\')[-1]} else {$_.DisplayName}}}, Publisher, DisplayVersion, InstallDate, InstallLocation, @{l='Arch'; e={ if ($_.pspath -like '*wow6432node*') {'x86'} else {'x64'} } } | Sort-Object Name | Format-Table -AutoSize
```

# Directories / Folders
#directories #folders
```
ls -n prog* | % {ls $_ -fo}    # more details
ls -n program` * -fo           # just dir names
```
# CIM Instances
#cim #cim_instances #wmi #wmic
## Installed apps
#cim_instances #cim_instance
```PowerShell
Get-CimInstance -ClassName 'win32_product'
```
## Windows Updates
#win_updates #windows_updates #updates
```PowerShell
Get-CimInstance -ClassName 'win32_quickfixengineering'
```

# Find file by name
#fine_file
```powershell
ls -r -file -fo -errora si | select name,fullname,attributes | ? {$_.name -like 'filename*'}
#   ^ recurse
#            ^ force (show hidden)
#                ^ ErrorAction: SilentlyContinue
```
Exclude Windows directory
```powershell
ls -n * -ex win* | % { ls $_ -r -file -fo -errora si} | select name,fullname,attributes | ? {$_.name -like 'flag*'}
```
# Definitions
- CIM: Common Information Model
- WMI: Windows Management Instrumentation