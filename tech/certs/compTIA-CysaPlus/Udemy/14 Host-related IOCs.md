---
alias: 
tags: memory_analysis volatility_framework lsof alternate_data_stream sysinternals
---
# Host-related IOCs
Find out what's normal

# Malicious processes
Malware can be shimmed (injected) into a process using DLLs
## Windows
1. SFC
	- On Windows `sfc` can be used to detect any changes to system files
	- `sfc /scannow`
	- `sfc /verifyfile=/path/to/file`
2. `tasklist`: cli equivalent of task manager
3. `PE Explorer`
## Linux
1. `ps`
	- `ps -A` = `ps -e`: all processes (for all users)
	- `ps -C cron`: get processes that run the `cron` command
	- `ps -A | sort -k 3`: sorted by the third column
2. `pstree`

# Memory Forensics
- File-less Detection Techniques
	- 
## Memory Analysis Tools
### Features
	- Reverse engineering of code used by processes
	- discover how processes interact with file system (handles) and registry
	- examine network connections
	- retrieve cryptographic keys
	- extract strings
### Tools 
- Usage: to execute a memory dump
- Type:
	- Commercial and Proprietary tools
		1. FTK
		2. EnCase
		Both have memory analysis modules
	- FOSS tools
		1. [Volatility Framework](https://www.volatilityfoundation.org/)
			- Cross-platform: Windows, Mac OS X, Linux
			- Browser module
			- command prompt history
			- pslist
				- ![[volatility_framework_pslist.png]]
			- netscan
				- ![[volatility_framework_netscan.png]]
		2. [Memoryze](https://fireeye.market/apps?query=memoryze) - FireEye's
			1. Cross-platform: Windows, MacOS

# Consumption
- Always get a baseline of consumption for a system
## Tools
### Windows
- Tools
	- Task Manager
### Linux
- `free`: memory consumption
	- `top`: processes cpu & memory consumption
		- Other variations:
			- `htop`
			- `bpytop`
- Run the process in a sandbox
- Find the signature e.g. NOP-sled

# Disk and File System
## Data Staging Areas
- Any technique that an adversary can use to hide information e.g. alternate data streams in NTFS
- ![[Data_Staging_Area_NTFS_alternate_data_streams.png | 600]]
### Tools
- File System Viewers:
	- e.g. `File System Browser`
	- Search fs for keywords, including Recycle Bin, NTFS Shadow Copy, System Volume Information
	- Analyse metadata to create a timeline of events
- `dir`
	- `dir /AH`: show hidden files
	- `dir /Q`: show owner of files
	- `dir /R`:  display alternate data streams for a file
- Drive free space
- Disk utilisation tools: scan fs and gets comprehensive stats e.g. `WinDirStat`, `du`
#### Linux Tools
- `lsof`: gets a list of all resources a process if currently using
	- `lsof -u root -a -p 1234`: get all files used by process with PID 1234 run by user `root`
- `df`: disk space usage by all mounted file systems
- `du`: disk space usage at directory level
- Cryptographic Analysis Tools
	- find out what algorithm has been used to encrypt files to find out if an adversary is trying out staging
	- if a volume has been encrypted by an attacker, the analyst must recover or brute force the user password to obtain the decryption key for an encrypted volume

# Unauthorized Privilege
## Privilege Escalation
## Monitor authentication and authorization
- Unauthorized sessions
- Failed log-ons
- new accounts
- guest account usage
- off-hour usage
## Tools
### Windows
- Microsoft Policy Analyzer
- AccesChk (sysinternals)
- AccessEnum (sysinternals)
### Linux
#todo

# Unauthorized Software
- Most forensics applications like **EnCase** or **FTK** can view app usage and history
## Prefetch Files
- a file that records the names of apps that have been run, as well as the date and time, file path, run count, and DLLs used by the executable
## Shimcache
- an app usage cache stored in registry e.g.
	- `HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\AppCompatCache\AppCompatCache`
## Amcache
- an app usage cache stored as a hive file at
	- `c:\Windows\appcompat\Programs\Amcache.hve`

#todo Linux equivalents

# Unauthorized Change/Hardware
- Firmware of USB drives can be modified to act as a keyboard and send keystrokes  

# Persistence
- Most cases in Windows done via registry or scheduled tasks
## Registry
### Tools
#### Registry Viewer Tool
- part of EnCase and FTK
- `regedit` doesn't show modification history
- `regdump` exports registry into text file
### Autorun Keys
- `Run` async initialization of values when loading them from registry
- `RunOnce` initialization of values in order when loading them from registry
- Locations
	- `HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run`
	- `HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce`
	- `HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run`
	- `HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce`
### Services and Drivers
- `HKLM\SYSTEM\CurrentControlSet\Services`
### File Associations
- `HKCR`
- `HKLM\SOFTWARE\Classes`
- `HKCU\SOFTWARE\Classes`
### Recently Used Files
- `HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RunMRU`
### Baseline Registry
#todo Tools for comparing registry with a baseline

## Scheduled Jobs
### Windows 
#### Task Scheduler
#todo PowerShell basic commands

### Linux 
#### crontab
#todo basic commands
