---
alias: Cisco Firewall Commands
tags: tech network firewall cisco
author: Mehdi N Tehrani
creat_date: 2023-08-28
---

# 
```
; allow DHCP
permit udp any eq bootpc any eq bootpc

; allow DNS
permis udp any any eq domain

; allow all else
permit ip any any
```