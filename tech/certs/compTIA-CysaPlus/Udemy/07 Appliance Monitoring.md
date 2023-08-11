# Firewall Logs
## Types of data
1. Connections permitted or denied
2. Port and protocol usages
3. Bandwidth usage
4. NAT/PAT logs
## Firewals
### iptables
- Log Format: Syslog format
### WF (Windows Firewall)
- Log Format: W3C Extended Log Format

## Log Levels
0. Emergency
1. Alert
2. Critical
3. Error
4. Warning
5. Notice
6. Informational
7. Debug

## Blinding attack
adversary generates more data than a logging system can handle
## Log retention
How long should the logs be kept for
## Helpful tool for testing and practice
### PFSense Firewall

# Firewall Configuration
## ACL
1. Block incoming requests from internal or private, loopback and multicast IP address ranges
2. Block incoming protocols like ICMP, DHCP, OSPF, SMB, etc.
3. Either block all IPv6, or only allow it for authorized list of hosts and ports only
## Actions
### Drop
### Reject
Send `RST` in case of TCP, or `ICMP port/protocol unreachable` if UDP back to the requester
This has the risk of **firewalking** reconnaissance technique
## Firewalking
Find an open port on the firewall and send a packet with a TTL of 1, past the firewall to find its hosts
### Mitigation
Block outbound ICMP status messages

## Egress Filtering

## Mitigations
1. Outbound IP/Port Whitelisting
2. Only allow trusted DNS servers
3. Block bad IP address/ranges
4. Block internet for ICS/SCADA systems or any other system that doesn't need Internet
5. Blackhole: 
	- Can be used to stop a DDOS attack by sending traffic to null0 interface
	- better to be done at router level than firewall - because it uses less processing  resources
	- Good protection against dark nets: unused IP addresses in local sebnets
- Sinkhole:
	- similar to blackhole but redirects traffic to a different network for analysis
	- **Akamai** and **Coudflare** have services for sinkholing


# Proxy Logs
## Forward Proxy
### Nontransparent
only the traffic from devices that are configured to use this proxy will be directed to this
### Transparent
redirection of traffic is done at the network layer
### Log Review
- Squid proxy
	- Squid Access Table
![[squid_proxy.png]]

## Reverse Proxy
Redirects and allows for inspection of inbound traffic

# Web Application Firewall (WAF)
- provides protection against DoS and various code injections
- Works at layer 7

# IDS and IPS Configuration
- best placed inside of the network (in relation to the firewall) or closest to important servers
- IDS can collect packets from network TAPs or SNAP (port mirrors)
- Examples:
	- **Snort**: open source for Windows and some Linux machines
		- Works both as IDS or IPS
		- **oinkcode**: signatures for intrusion detection
	- **Zeek** (formerly called Bro): Unix/Linux
	- **Security Onion**: for Linux
		- used for security monitoring, incident response and threat hunting
		- Bundles Snort, Suricata, Zeek, Wireshark and NetworkMiner and,
			- log management tools: Elesticsearch, Logstash, Kibana
			- incident management tools: Sguil, Squert
## Logs
Snort Output formats:
- Unified output: machine readable
- Syslog
- CSV
- tcpdump

## Rule Formats
### Snort Rule Format
> `Action Protocol SrcIP SrcPort Direction DstIP DstPort (RuleOption; RuleOption; ...)`
### Directions
- Unidirectional: -> <-
- Bidirectional: <>

### Rule Options
- msg: Text to inform the responder what triggered the rule.
- flow: Match a new or existing TCP connection, or match regardless of TCP connection state.
- flags: Match whether flags in the packet have been set, such as TCP SYN and FIN both set.
- track: Apply a rate limiter to the rule by only triggering it if a threshold of events is passed over a particular duration.
- reference: Match an entry in an attack database, such as CAPEC or ATT&CK.
- classtype: Categorize the attack.
- sid and rev: Give the rule a unique ID and provide version information.
Example:
`alert tcp $EXTERNAL_NET any -> $HOME_NET 143 (msg:"PROTOCOL-IMAP logon brute force attempt"; flow:to_server,established,no_stream; content:"LOGON"; fast_pattern:only; detection_filter:track by_dst, count 30, seconds 30; metadata:ruleset community, service imap; reference:url,attack.mitre.org/techniques/T1110; classtype:suspicious-logon; sid:2273; rev:12;)`

## Port Security
### Physical Port Security
- Lock switches away
- Unpatch unused ports

### Mac Filtering
- only allow certain MAC addresses
- vulnerable to MAC spoofing

### Network Access Control (NAC)
- best approach of the three

# NAC Configuration
- provides means to authenticate users and evaluate device integrity before a network connection is permitted

## 802.1x 
- defines PNAC (port-based NAC)
- standard for encapsulating EAP (Extensible Authentication Protocol) communications over LAN or WLAN and provides port-based auth

## EAPOL
- EAP over LAN

## NAC Features
### Posture Assessment
assessing the endpoint for compliance with health policy, like AV or firewall, etc.
### Remediation
when endpoint doesn't meet health policies
### Pre- and Post-admission Control

## Health Policy Types
- Time-based
- Location-based
- Role-based 
	- adaptive NAC
	- re-evaluates a device's authorization when it is used to do something
- Rule-based
	- IF ... AND ... THEN ...


