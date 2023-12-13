---
aliases:
  - Windows Network Discovery
tags:
  - tech
  - microsoft
  - windows
  - network_discovery
author: Mehdi N Tehrani
creat_date: 2023-12-13
category: Windows
subcategory: Administration
---

# Network Discovery Not getting enabled
if once you switch on network discovery, it reverts back to disabled: make sure the following services are running:
- DNS Client
- Function Discovery Resource Publication
- SSDP Discovery
- UPnP Device Host

[reference](https://techcommunity.microsoft.com/t5/windows-server-insiders/i-can-t-turn-on-network-discovery/m-p/178750)