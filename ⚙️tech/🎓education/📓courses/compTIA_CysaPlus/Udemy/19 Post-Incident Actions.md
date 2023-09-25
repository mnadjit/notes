---
aliases: CySA+ Incident Response Eradication, Recovery and Post-Incident Actions
tags:
  - tech
  - cybsec
  - comptia
  - cysa_plus
  - incident_response
  - eradication
  - recovery
  - post-incident_actions
category: cyber_security
subcategory: analyst
---
[!tip] CompTIA CySA+ Objectives
> Objective 4.2
# Eradication
## Sanitization
### CE 
#self_encrypting_drive
Cryptographic Erase - a feature of SSD self-encrypting drives
### Zero-Fill
Only useful for magnetic media. not useful for SSD or hybrid media as they have **wear levelling routine built into their controller**. This does not guarantee zeros are being written across the whole drive 
#zero_fill
```cmd
:: Fill with zero -  two passes, across the whole drive
format c: /fs:ntfs /p:2
```
### Secure Erase
Provided by the manufacturer
### Secure Disposal
Useful for highly classified data
- Mechanical Shredding
- Incineration
- Degaussing

[NIST SP 800-88 - Guidelines for Media Sanitization](https://csrc.nist.gov/pubs/sp/800/88/r1/final)

# Eradication Actions
## Reconstruction
using scripted installation routines and templates
## Reimaging
use an image-based backup
## Reconstitution
Manual removal, reinstallation and monitoring processes
1. Analyse processes and network activity for signs of malware
2. terminating suspicious processes and securely removing them from the system
3. identify and disable auto-start locations
4. replace contaminated processes with clean versions from trusted media - preferably from DML (Definitive Media Library) #definitive_media_library #dml 
5. Reboot the system and analyze for signs of continued malware infection
6. analyze firmware and any removable devices
7. if all tests are negative, reintroduce the system to the work environment

# Recovery
- The process of making sure a similar issue will not occur in the future
- The longest and most challenging part of the process
## Recovery Action
### Patching
**Scan - Patch - Scan** approach
### Permissions
- Passwords
- FileSystem ACLs
- System ACLs
- Firewall ACLs
### Logging
- Make sure logging is enabled following an incident and it's not been disabled by the attacker
- Audit logs to make sure they're useable in the future and not corrupted by the attacked
### System Hardening
- Deactivate unnecessary components
- Disable unused user accounts
- Implement patch management
- Restrict host access to peripherals
- Restrict shell commands

> Three important steps:
> 1. Uninstall anything not in use
> 2. Patch frequently
> 3. Restrict users to least privilege

# Post-Incident Activities
## Report Writing

## Incident Summary Report
The content depends on the target audience
## Evidence Retention
how long the evidence needs to be preserved

# Lessons Learned
- Questions to answer in a lessons learned working group:
	1. Who was the adversary?
	2. What were the motives?
	3. When did the incident occur?
	4. Where did it happen - what system was affected?
	5. How did the incident happen?
	6. What Controls could have mitigated the incident?
- Name of the report
	- **After-Action Report** (AAR)
	- **Lessons Learned Report** (LLR)
- Benefits
	- Incident Response Plan Update
	- IoC Generation and Monitoring
	- Change Control Process