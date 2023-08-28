---
alias: 
tags: tech pwsh powershell active_directory ad
author: Mehdi N Tehrani
creat_date: 2023-08-28 
---

# References
[lazy admin blog]()

# Get AD-Group
```PowerShell
Get-AdGroup -Filter "Name -like '*my group*'" -Properties * | select Name, Description
```
