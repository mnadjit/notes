---
aliases:
  - application-related indications of compromise
tags:
  - tech
  - cybersec
  - comptia
  - cysa_plus
  - application
  - ioc
  - compromise
  - cron
  - log
  - linux
  - windows
  - android
  - last_login
category: cyber_security
subcategory: analyst
---
[!tip] CompTIA CySA+ Objective
> Objective 4.3
> Objective 4.4
# Anomalous Activity 
- Web apps
- databases
- DNS services
- Remote Access Servers
## Symptoms
- Unexpected outbound communication
	- `netstat -anob`
- Unexpected Output
	- Increased database reads or Large HTTP response packet sizes might indicate XSS
	- unformatted error messages
- Service Defacement
	- e.g. modifying a website's frontpage

# Service Interruptions
- check logs; potential reasons
	- security services are prevented from running
	- process running the service is compromised
	- service is disabled by DDOS/DOS attack
	- Excessive bandwidth usage 

## Services
### Windows
- services.msc
- cmd: `net start`
- powershell: `Get-Service`
### Linux
- [[Init Systems]]
- [[CRON]]
- Running processes: `ps` and `top`

# App Logs
- DNS event log
	- Windows: Application log source=`DNS Client Events`
- HTTP access log
	- Log formats:
		- CLF: Common Log Format
		- W3C extended
	- What to look for:
		- Status Codes
		- User Agent 
- FTP access log
	- in W3C format
- SQL event log
	- MySql Workbench is a tool where audits can be inspected in 
- Linux authentication log
```sh
egrep "Failed|failure" /var/log/auth.log
```

# New Accounts
## Windows
- Local Users and Accounts `lusermgr.msc`
```cmd
net user %username% /add /active:yes
net user %username% *
net localgroup %groupname% %username% /add
net localgroup %groupname% %username% /delete
```
- Active Directory Users and Computers
- PowerShell
	- #todo
- WMIC
	- #todo
## Linux
- `who`: shows what users are logged in and into which tty
- `w`: same as who but also returns the remote host, how long been idle, etc.
- `rwho`: same as who but is on a client/server architecture
- `lastlog`:  retrieves data from `/var/log/lastlog`
- `faillog`
	- `faillog -u $username`

# Virtualization Forensics
> Challenges
## Process and memory analysis
- VMI (VM Introspection): Uses tools installed to the hypervisor to retrieve pages of memory for analysis
	- WinDBG
	- gdb

## Persistent data acquisition

## File-carving-deleted VM disk images
- find files in unallocated spaces
- VMWare uses VMFS which makes file carving more difficult

## Lost System Logs

# Mobile Forensics
## Data Collection
- Challenges
	- SSD devices
	- phone data storage encryption
	- Need for using Faraday bag
	- data privacy laws e.g. 5th amendment in USA
## Extraction and Analysis Methods
- Manual extraction
- Logical Extraction
	- from iCloud for example
- ADB (Android Device Bridge) #adb #android_device_bridge
- data in many parts are stored in SQLite databases
## Mobile Device Forensics Software
- Cellebrite: tool focused on evidence extraction from smartphones and other mobile devices and cloud data using Universal Forensic Extraction Device (UFED). There is also a software version of it.
- Mobile Phone Examiner Plus (MPE+): created by AccessData - developers of FTK application
- EnCase Portable: mobile version of EnCase application 
- Carrier Provided Logs
	- Type of data that can be collected:
		- Call details
		- Voicemail
		- SMS
		- MMS
		- IP destination
		- Session info
		- Geolocation data
