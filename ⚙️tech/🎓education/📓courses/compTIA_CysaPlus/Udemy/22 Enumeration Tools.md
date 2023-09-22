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
## Service Discovery
> [!note] Nmap TCP SYN #tcp_syn
> `nmap -sS`:  conducts a half-open scan by sending a SYN w/o an ACK after

> [!note] Nmap TCP Connect #tcp_connect
> `nmap -sT`: full TCP 3-way handshake; when certain network cards don't support half-open scan or requires root access on OS 

> [!note] Nmap Null scan #null_scan
> `nmap -sN`: header bit set to 0; very visible to IDS/IPS

> [!note] Nmap FIN scan #fin_scan
> `nmap -sF`: sends an unexpected *FIN* packet; not stealthy

> [!note] Nmap Xmas scan #xmas_scan
> `nmap -sX`: sends a packet with *FIN*, *PSH* and *URG* flags set to 1; not stealthy at all!  

> [!note] Nmap UDP scan #udp_scan
> `nmap -sU`: send and wait for response or timeout; a bit more stealthy

> [!note] Nmap Port Ranges #port_range
> `nmap -p <port_range>`

# Nmap Port States
- **Open**: an app on the port is accepting connections
- **Closed**: response is a *RST* packet. No app is accepting the connection
- **Filtered**: no response is received back; most likely firewall is dropping the packet
- **Unfiltered**: nmap can probe the port but cannot determine whether it's open or closed (?)
- **Open|Filtered**: nmap cannot determine if the port is open or filtered using *UDP* or *IP* scan
- **Closed|Filtered**: nmap cannot determine if the closed is open or filtered using *TCP Idle scan* 

# Nmap Fingerprinting
#fingerprinting 
> [!note] Nmap Intensive Port Scan #intensive_port_scan
> `nmap -sV <IP>`
> `nmap -A <IP>`: more intense that -SV
- extracted info
	- Protocol
	- app name and version
	- OS type and version
	- host name 
	- device type

Nmap collects info using CPE (Common Platform Enumeration) #cpe #common_platform_enumeration
**CPE**: Scheme for identifying hardware, devices, OS's, and apps developed by MITRE

## Nmap Scripting Engine (NSE)
#NSE #nmap_scripting_engine
written in Lua
Can be used for
- OS detection and platform enumeration
- Windows user account discovery
- Identify logged-on Windows user account
- Basic vulnerability detection
- Get HTTP data and identify apps
- Geolocation to traceroute probes

# Using Nmap


# Hping
#hping

# Responder
#responder

# Wireless Assessment Tools

# Hashcat
#hashcat

# Testing Credential Security