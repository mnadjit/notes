---
aliases:
  - Microsoft Active Directory
tags:
  - tech
  - microsoft
  - ms
  - active_directory
  - ms_active_directory
author: Mehdi N Tehrani
creat_date: 2023-12-02
category: Windows
subcategory: Active Directory
---

# Installation
```powershell
Add-WindowsFeature AD-Domain-Services
Install-ADDSForest -DomainName $domain_name -InstallDNS
```

# Get Domain Info
```powershell
Get-ADForst
Get-ADDomain
```

