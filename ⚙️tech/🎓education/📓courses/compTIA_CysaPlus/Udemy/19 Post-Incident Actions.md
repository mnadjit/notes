---
aliases:
  - CySA+ Incident Response Eradication Recovery and Post-Incident Actions
tags:
  - tech
  - cybsec
  - incident_response
  - eradication
  - recovery
  - post-incident_actions
category: cyber_security
subcategory: analyst
---
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

[NIST Guidelines for Media Sanitization](https://csrc.nist.gov/pubs/sp/800/88/r1/final)

