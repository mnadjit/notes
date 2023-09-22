---
aliases: 
tags:
  - tech
  - cybsec
  - comptia
  - cysa_plus
  - mimikatz
  - kerberos
  - golden_ticket
  - pass_the_hash
  - lateral_movement
  - pivoting
category: cyber_security
subcategory: analyst
---
[!tip] CompTIA CySA+ Objective
> Objective 4.3
# Pass the hash
> SAM: Security Account Manager 
> [[Windows Cached Creds|Windows Authentication Cached Credentials]]

## Tooling
- **Mimikatz**
scans memory for cached passwords processed by *lsass.exe* **Local Security Authority Subsystem Service**

# Golden Ticket
A *Kerberos* ticket that can grant other tickets in an Active Directory environment
## krbtgt hash
> Kerberos Ticket Granting Ticket
> The trust anchor of the AD domain which functions like a private key of a root CA and generates TGT's *Ticket Granting Tickets* that are used by users to access services within Kerberos

![[Kerberos.png|600]]

## Golden Ticket Attack
#golden_ticket #attack #kbrtgt
1. Access AD data store `NTDS.DIT` 
	- Location`%systemroot%\NTDS` on a domain controller server
2. Dump NTDS.DIT file and get domain admin account hashes
3. if *kbrtgt* is not reset, even if all compromised accounts change their passwords, attacker can still use the *kbrtgt* to access any system
4. Attacker with access to a valid *kbrtgt* hash can use an exploit module to create golden tickets for a user with admin rights

![[Golden_Ticket_Attack.png|600]]

### Prevention
- *krbtgt* account password needs to be changed regularly
	- to do so, the *kbrtgt* account password should be changed twice in short period of time to invalidate the golden ticket
	- change password, reboot the computer, change the password again, and reboot a second time

# Lateral Movement
## Remote acce
## WMIC
Windows Management Instrumentation Command-Line

## PSExec
## PowerShell
- **PowerShell Empire**
	- A post-exploitation tool
- **PowerSploit**
	- Metsploit for PowerShell. It acts as a framework and controller that listens to PowerShell agents that are running on victims' machines

# Pivoting
## Port Forwarding
#port_forwarding 
- Using SSH to do port forwarding using `-D` which binds the connection to a 
```sh
ssh -D
```
