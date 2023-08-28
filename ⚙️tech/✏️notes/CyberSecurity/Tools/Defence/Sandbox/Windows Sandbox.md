---
alias: 
tags: sandbox windows_sandbox
---
# Windows Sandbox required services
	1. `CmService`: Container Manager Services (was not running by default)
		- dependencies:
			- HvHost
			- vmcompute (Hyper-V Host Compute Service)
			- RPC (Remote Procedure Call)
			- vds (Virtual Disk)
	1. `HvHost`: HV Host (was disabled by default)
	2. `vds`: Virtual Disk (was not running by default)
	3. `vmms`: Hyper-V Virtual Machine Management
	4. `vmcompute`: Hyper-V Host Compute Service
	5. `nvagent`: Network Virtualization Service
	
- https://answers.microsoft.com/en-us/windows/forum/all/windows-sandbox-does-not-start/299b8dd7-4756-4854-bcc1-6fe02a1a781a
- https://call4cloud.nl/2021/08/sandbox-multiverse-of-madness/

> Make sure all required services are running

```PowerShell
# Check the status and start type of services Win Sandbox is dependent on
@('vmms','vmcompute','nvagent','vds','CmService','HvHost') | Get-Service | select Name, StartType, Status
# Enable HvHost if disabled
Get-Service HvHost | Set-Service -StartType Manual
# Start all services
@('vmms','vmcompute','nvagent','vds','CmService','HvHost') | Start-Service
```
