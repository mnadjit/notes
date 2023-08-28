---
alias: Cisco Firewall ACLs
tags: tech network firewall cisco acl access_control_list
author: Mehdi N Tehrani
creat_date: 2023-08-28
---

# Common ACLs
```
; allow DHCP
permit udp any eq bootpc any eq bootpc

; allow DNS
permis udp any any eq domain

; allow all to access host with ip 10.0.0.1
permit ip any host 10.0.0.1

; deny all else
deny ip any any
```