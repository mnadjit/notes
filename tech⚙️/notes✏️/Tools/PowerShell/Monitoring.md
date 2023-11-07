# Windows Events
> Find any hyper-v events of levels Critical, Error, and Warning for the past 10 minutes
```PowerShell
Get-WinEvent -FilterHashtable @{
  ProviderName='*hyper*'
  Level=1,2,3
  StartTime=(Get-Date).AddMinutes(-10)
}
```
> Find last 10 security events of id 5061
```PowerShell
Get-WinEvent -MaxEvents 10 -FilterHashtable @{
  LogName='Security'
  ID=5061
}
```
> Find event providers where the name contains hyper-v
```PowerShell
(Get-WinEvent -ListProvider *).Name | ? { $_ -like '*hyper-v*' }
```
# Last Logged in User
> Find last logged in users on a remote machine
## Windows Events (past 24 hours)
```PowerShell
# Windows Events
$hostname = ""
Get-WinEvent -ComputerName $hostname -FilterHashtable @{ Logname='Security'; ID=4672; StartTime=(Get-Date).AddDays(-1) } | Where-Object { @("SYSTEM", "$($hostname)$") -notcontains $_.Properties[1].Value } | Select-Object @{N='User';E={"$($_.Properties[2].Value)`\$($_.Properties[1].Value)"}}
```
- [Get-CimInstance Example 1](https://adamtheautomator.com/user-logon-event-id/)
## Last Written User Profile
```PowerShell
$hostname = ""
Get-ChildItem "\\$($hostname)\c`$\Users" | Sort-Object LastWriteTime -Descending | Select-Object Name, LastWriteTime -first 1
```
- References: 
- [Get-CimInstance Example 2](https://powershell-guru.com/powershell-tip-42-find-the-owner-of-a-process/)
- [Get-WinEvent](https://community.spiceworks.com/topic/2025022-find-last-user-logged-into-a-machine-via-powershell)
## CIM Instance
```PowerShell
# if WinRM (Remote Management) is accessible
$hostname = ""
Invoke-CimMethod -InputObject $(Get-CimInstance -Class Win32_Process -ComputerName $hostname | Where-Object name -Match explorer) -MethodName GetOwner | Select-Object Domain, User

# if WinRM NOT accessible
$hostname = ""
psexec "\\$($hostname)" powershell

Invoke-CimMethod -InputObject $(Get-CimInstance -Class Win32_Process | Where-Object name -Match explorer) -MethodName GetOwner
```
