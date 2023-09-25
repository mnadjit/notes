---
alias: 
tags: 
- tech
- cybsec
- comptia
- cysa_plus
- endpoint_monitoring
- procexp
- process_explorer
- sysinternals
category: cyber_security
subcategory: analyst
---
> [!tip] CompTIA CySA+ Objective
> Objective 3.1
> Objective 3.2

# Endpoint Analysis
# Sandboxing

# Reverse Engineering

# Malware Exploitation
## Further Reading
### MITRE
https://attack.mitre.org/techniques/T1036
#### Masquerading
Masquerading occurs when the name or location of an object, legitimate or malicious, is manipulated or abused for the sake of evading defenses and observation. This may include manipulating file metadata, tricking users into misidentifying the file type, and giving legitimate task or service names.
- Invalid Code Signature
- Right-to-left override
- Rename System Utilities
- Masquerade Task or Service
- Match Legitimate Name or Location
- Space after Filename
- Double File Extension
### Microsoft
https://www.microsoft.com/security/blog/2018/09/27/out-of-sight-but-not-invisible-defeating-fileless-malware-with-behavior-monitoring-amsi-and-next-gen-av/
> TODO_3: read article in url above

# Behaviour Analysis
Useful Tool: **SysInternals**
## Known-Good
### Windows
- Processes
	- `SMSS`: the parent of the first user-mode process called SMSS (Session Manager SubSystem). SMSS should only appear as a child of System and launch from `%windir%\System32`
		- Kernel Binaries:
			- PID 0: `System Idle`
			- PID 4: `System` - parent for interrupts and SMSS
	- `csrss.exe`: Client Server Runtime SubSystem
		- manages low-level Windows functions. Normal to see multiple instances as long as launched from `%windir%\System32` and having NO parents.
    - `wininit.exe`: manages drives and services. Single instance only.
    - `services.exe`: hosts non-boot drivers and background services. Single instance only.
    - `lsass.exe`: Local Security Authority SubSystem - handles authentication and authorization. Single instance only, child of `wininit`
    - `winlogon.exe`: manages access to the user desktop. One instance per user session. `dwm.exe` (Desktop Window Manager) likely to be child of this.
    - `userinit.exe`: sets up the shell (usually explorer.exe) and then quits. To be seen only briefly post logon.
    - `explorer.exe`: typically user shell, launched with user creds as opposed to system. Likely to be parent for processes started by the logged-on user.
- What to watch for or do:
    1. unrecognized process names
    2. processes with no icon, version info, description, or company name
    3. unsigned processes, especially those with company name
        - use `sigcheck.exe` part of SysInternals suite
    4. check for known processes and their parent/child relationships
    5. packed processes (highlighted in purple in process explorer
    6. how a process interacts with Windows registry and filesystem
        - where is it launched from
        - what files is it manipulating
        - if deleted, would it be restored on reboot?
        - if not possible to delete the process, what system privilege or service is blocking it 
    7. network interactions


    
![[procexp_normal.png]]

## Anomalous Behaviour in Process Explorer
![[procexp_normal.png]]



# Endpoint Detection and Response Config Changes
goad is to reduce false positives
## MAEC (Malware Attribute Enumeration & Characterization) Scheme
- A standardized language for sharing structured info about malware that is complementary to STIX and TAXII to improve the automated sharing of threat intelligence.
## Yara
- Multi-platform program for identifying, classifying and describing malware samples
- **Yara Rule**: a test for matching certain string combinations within a given data source

# Blacklisting & Whitelisting
## Execution Control
### Windows
- **SRP**: Software Restriction Policies - can be deployed as GPO
	- e.g. no executables can be run from `c:\` path
- **AppLocker**
- **WDAC**: Windows Defender Application Control
### Linux
- **MAC**: Mandatory Access Control
- **LSM**: Linux Security Module
	- SELinux: RedHat
	- AppArmor: Ubuntu

