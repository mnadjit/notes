---
alias: 
tags: 
---

# Module
```PowerShell
Install-WindowsFeature DHCP -IncludeManagementTools
```

# Get Scope
```PowerShell
Get-DHCPServerv4Scope -ComputerName $fqdn -ScopeId $scope_ip

# example
Get-DHCPServerv4Scope -ComputerName dhcpserver.my.org
Get-DHCPServerv4Scope -ComputerName dhcpserver.my.org -ScopeId 172.28.16.0
```
