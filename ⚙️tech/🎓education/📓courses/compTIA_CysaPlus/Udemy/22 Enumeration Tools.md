---
aliases:
  - CySA+ Enumeration Tools
tags:
  - tech
  - cybsec
  - comptia
  - cysa_plus
  - enumeration_tools
  - nmap
category: cyber_security
subcategory: analyst
---
> [!tip] CompTIA CySA+ Objectives
> Objective 1.4

# Enumeration Tools
- **Active**: establish connection
- **Semi-passive**: sparse and widely dispersed attempts to avoid begin detected
- **Passive**: no connection made. Collect data only e.g. using a packet sniffer

## Passive Tools
- Wireshark #wireshark
- Zeek or Bro #zeek #bro
	- part of Security Onion #security_onion
	- p0f #p0f

Enumeration and reconnaissance rely on:
- **OSINT** #osint : any information that is publicly avilable
- **Footprinting** #footprinting : tools that map out the layout of a network e.g. IP usage, routing topology, and DNS namespace
- **Fingerprinting** #fingerprinting : ports, operating system, file shares, services, apps, and system uptime
# Nmap Discovery Scans
#footprinting
## Nmap Security Scanner
Used for discovery and enumeration of  
- topology
- host 
- service
- OS 
## Nmap discovery
> [!note] Nmap Basic syntax
> `nmap <subnet>`

default behaviour: **ping** and send a **TCP ACK packet** to the target on ports *80* and *443*. If responsive then nmap runs port scanning against the target on 1000 most commonly used ports. This is *not* stealthy.

> [!note] Nmap Host Discovery #host_discovery
> `nmap -sn <subnet>`
> This will skip the port scanning part

> [!note] Nmap List Scan #list_scan
> `nmap -sL <subnet>`
> From a provided list of IPs, does a reverse-DNS scan; considered a passive method

> [!note] Nmap TCP SYN ping #tcp_syn_ping
> `nmap -PS <port_list>`
> uses TCP SYN instead of ICMP

> [!note] Nmap Sparse Scanning #sparse_scanning
> `nmap --scan-delay <time>`

> [!note] Nmap Scan Timing #scan_timing
> `nmap -T<0-5>`
> 0 being the slowest; to avoid detection

> [!note] Nmap TCP Idle Scan #tcp_idle_scan #idle_scan
> `nmap -sI`
> more stealthy; makes it appear as another machine (zombie) started the scan; a redirection method
> #todo : understand this one better

> [!note] Nmap Fragmentation #fragmentation
> `nmap -f`
> `nmap --mtu`
> breaks each TCP packet across multiple IP diagrams to avoid detection

> [!note] Nmap Output #output
> `nmap -oN`: to a **normal** text file
> `nmap -oX`: to an **XML** format file
> `nmap -oG`: to a **Greppable** format file

# Nmap Port Scans
#fingerprinting

# Nmap Port States

# Nmap Fingerprinting

# Using Nmap

# Hping
#hping

# Responder
#responder

# Wireless Assessment Tools

# Hashcat
#hashcat

# Testing Credential Security