---
aliases: 
tags:
  - cybsec
category: cyber_security
subcategory:
---
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

