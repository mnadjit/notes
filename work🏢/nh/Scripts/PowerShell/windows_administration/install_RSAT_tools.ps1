# Disable WSUS server to get updates online - Install RSAT tools (Remote Server Administration Tools) e.g. for Active Directory admin tools

reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v UseWUServer /t REG_DWORD /d 0 /f
net stop wuauserv
net start wuauserv

Get-WindowsCapability -Name RSAT* -Online | Add-WindowsCapability -Online

reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v UseWUServer /t REG_DWORD /d 1 /f
net stop wuauserv
net start wuauserv
