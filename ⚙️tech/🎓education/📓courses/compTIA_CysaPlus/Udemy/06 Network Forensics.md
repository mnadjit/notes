---
alias: 
tags: 
- tech
- cybsec
- comptia
- cysa_plus
- network_forensics
category: cyber_security
subcategory: analyst
---
[!tip] CompTIA CySA+ Objective
> Objective 3.1
> Objective 4.4

# Tools
## tcpdump
> Page 57
- monitor interface eth0, packets from source 10.0.0.1 and write to file
	- `sudo tcpdump -i eth0 src 10.0.0.1 -w ./file.pcap`
- read packets from file, packets from source port 5000
	- `tcpdump -r ./file.pcap src port 5000`

## wireshark
> Page 58

## Flow Analysis
> Page 
### NetFlow
dev by Cisco
reports net traffic to a structured db
captures metadata only
### Zeek (Bro)
hybrid tool
can be used like netflow, but then switch to FPC (full packet capture) when needed
Normalises the data and can export to json format
### MRTG (Multi-Router Traffic Grapher)
Uses SNMP to capture and graph data transferred over router and switch interfaces

# IP and DNS Analysis
## Domain Generation Algorithm (DGA)
used by malware to evade blacklists by generating domain names for C2 dynamically
## Fast Flux Network
used by malware to hide the presence of X2 network by continually changing the host IP addresses in domain records using domain generation algorithms
### Clues to identify FFN
1. Odd domain names like `3423htjhk23hfu.com`
2. NXDOMAIN http user agent error: `DNS_PROBE_FINISHED_NXDOMAIN`
### Mitigation
- Use **Secure Recursive DNS Resolver**

# URL Analysis
## Methods
https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods
- `HEAD`: only get the headers and ignore the body
- `TRACE`: performs a message loop-back test along the path to the target resource.
- `OPTIONS`: describes the communication options for the target resource
- `CONNECT`: establishes a tunnel to the server identified by the target resource
- `PATCH`: applies partial modification to the target reosource

## Percent Encoding (URL Encoding)
- Unresevered Chars: `a-z A-Z 0-9 - . _ ~`
- Reserved Chars: `: / ? # [ ] @ ! $ & ' ( ) * + , ; =`
- Unsafe Chars: `\ < > { }`
