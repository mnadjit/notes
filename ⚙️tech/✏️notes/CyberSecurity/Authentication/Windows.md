---
aliases:
  - Windows Authentication
tags:
  - tech
  - cybsec
author: Mehdi N Tehrani
creat_date: 2023-09-17
---

# SAM
> Security Account Manager

Windows Cached Credentials Locations:
- `%SystemRoot%\System32\config\SECURITY`
- `HKLM\Security\Cache\NL$n`

Open PowerShell with `NT Authority\System` account
```cmd
psexec.exe -i -s $(where.exe pwsh)
```