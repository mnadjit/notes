ICS: Industrial Control System
SCADA: Supervisory Control and Data Acquisition

# Privacy
- PIA: privacy impact assessment 
- PTA: privacy threshold assessment 
- PII: personally identifiable information 
- PHI: protected health information

# Regulations, Standards, and Legislation
- General Data Protection Regulation (GDPR): europe
- National, territory, or state laws
- Payment Card Industry Data Security Standard (PCI DSS)
 
# Frameworks and Security Guides
- Center for Internet Security (CIS)
- National Institute of Standards and Technology (NIST) Risk Management Framework (RMF)/Cybersecurity Framework (CSF) 
- NIST SP 800-171: secure information processing on non-federal systems
- International Organization for Standardization (ISO)/IEC 27001/27002/27701/31000 
- SSAE SOC 2 Type I/II Service Organization Control (SOC) 2: to ensure client data is protected
- Cloud Security Alliance

# Security Policies and Standards
AUP: acceptable use policy

# SAML
- often used in conjunction with SOAP
- IdP: Identity Provider
- RP: Relaying Party
- SP: Service Provider (same entity as RP)
- user agent: usually a browser in SP. user agent requests service from SP, which then gets forwarded to IdP

# Threat Intelligent Sources
- OSINT
- Closed/proprietary
- Vulnerability databases 
- Public/private information sharing centers 
- Dark web 
- Indicators of compromise (IoCs)
- Automated Indicator Sharing (AIS) 
- Predictive analysis 
- Threat maps
- File/code repositories

# Data Security Roles
- Data Owner: higher management defines who data should be protected
- Data Custodian: IT admin
- Data Privacy Officer: aka chief privacy officer (CPO), is responsible for developing policies that address employee personal data and customer personal data.

# Binary file hexedit
- JPG files: FF D8 FF E0
- JPG files with Exif (exchangeable image file) metadata: FF D8 FF E1
- Bitmaps: 42 4D
- TIFF (Tagged Image File Format) files: 49 49 2A
- Office documents: 00 CF 11 E0 A1 B1 1A E1

# Attacks
- Smurf: involves the hacker sending ping (ICMP) messages to a number of systems, but also spoofing the source IP address of the packets so that they appear to come from the intended victim. All of the systems would then send their ICMP replies to the victim system, overburdening it with traffic and causing it to crash.
- Xmas Tree: a packet is sent to each port with the PSH, URG, and FIN flags set in the packet.
- Arp poisoning: ARP poisoning involves the hacker altering the ARP cache on a system, or group of systems, so that all systems have the wrong MAC address stored in the ARP cache for a specific IP address—maybe the address of the default gateway

# Disaster Recovery
- Succession Planning: make sure there are staff to cover when key people are unavailable
- MTTR: Mean Time To Repair - the average time for a system or device to recover from a failure.
- MTBF: Mean Time Between Failures - the amount of time between failures of a system.
- MTTF: Mean Time To Failre - the amount of time a device is expected to last in production before it fails.
- RTO: Recovery Time Objective - the amount of time allowable before a business function must be restored to a functional state after a failure.
- RPO: Recovery Point Objective - to represent how much of a system is expected to be recovered.
MTTR + MTTF = MTBF

# Cloud Computing
- MSP/MSSP: Managed Service Provider / Manager Security Service Provider
- Fog (Edge) Computing: processing on edge devices e.g. routers or switches to save on bandwidth
- CSP: Cloud Service Provider

# Authentication
## Kerberos vs RADUIS:
- both use XML
- both enable single sign on functionality
- Only Kerberos uses tickets to identify authenticated users

# Access Control
- DAC - Discresionary: is a model that decides who gets access to a resource based on a discretionary access control list (DACL). A DACL is a listing of users and groups.
- Role-based - RBAC: the system grants special privileges to different roles. A role is a container object that has predefined privileges in the system. When you place users into the role, the user receives the privileges or access control permissions assigned to the role. e.g. MS SQL Server, Exchange server.
- Rule-base - also RBAC!!! involves configuring rules on a system or device that allow or disallow different actions to occur. For example, a router uses RBAC to determine what traffic can enter or leave the network by checking rules in an ACL configured on the router
- GBAC - Group-based: is when the security of the environment is based on the groups the user is a member of. For example, you could have application code that checks to see if a user is in the Finance group before allowing that user to call the Deposit method
- ABAC - attribute-based: is an access control model that involves assigning attributes, or properties, to users and resources and then using those attributes in rules to define which users get access to which resources. For example, you could configure a rule specifying that if the user has a Department attribute of Accounting and a City attribute of Boston, they can access the file. This is different from RBAC or GBAC in the sense that those models only check whether the user is in the role or group.
- MAC: each individual (known as a subject) is assigned a clearance level such as restricted, secret, or top secret. The data and other assets in the organization are assigned classification labels that represent the sensitivity of the information. Examples of classification labels are public, confidential, secret, top secret, and unclassified, to name a few.
- Others: 
	- Conditional access: 
	- Privileged access management: 
	- File system permissions: 
	
	
Regulatory Organizations:
- HIPPA: Health
- FISMA: Goverment agencies
- COPPA: Children
- FERPA: Education
- SOX: public accounting firms
- GLBA: Financial 


To Check:
- Crossover Error Rate
- Changing hidden form values on a website
- Insecure Object Reference in a program

- Heuristic Analysis

- Cloud Rapid Elasticity
- Community Cloud: A community cloud is a collaborative effort in which infrastructure is shared between several organizations from a specific community with common concerns (security, compliance, jurisdiction, etc.), whether managed internally or by a third party and hosted internally or externally.

- OAuth2 + OpenID Connect (OIDC)
- Shared Authentication Protocols: OIDC, Facebook Connect, OAuth.

- Machine Learning: in CompTIA ML is supervised ML, deep learning is unsupervised ML!

- Data Destruction:
	- Cryptographic Erase: CE is a feature of self-encrypting drives (SED) and is often used with solid-state devices. Cryptographic erase can be used with hard drives, as well.
	- Zero Fill: not to be used for SSDs
	- Secure Erase: a special utility provided with some solid-state drives that can perform the sanitization of flash-based devices. Overwrite is like zero-fill but can utilize a random pattern of ones and zeroes on the storage device.

- Hping: sends custom ICMP, UDP, or TCP packets and then displays any replies, also allows you to map out firewall rule sets. It is also great for learning more about TCP/IP and experimenting with IP protocols. Hping does not support IPv6,
- Nping: supports IPv6
- Ptunnel: is an application that allows you to reliably tunnel TCP connections to a remote host using ICMP echo request and reply packets, commonly known as ping requests and replies. Ptunnel is used as a covert channel, not to elicit a response from a host using TCP.

- ALE: Annual Loss Expectancy
- SLE: Single Loss Expectancy
- AV: amount lost in single occurence
- EF: Exposure Factor
- ARO: Annual Rate of Occurence
	- SLE = AV x RF
	- ALE = SLE x ARO
	
- Vulnerability Scanning: 

- Site blacklisted because of spam outbound: First check email headers of a sample spam email

- PIV: 
- SecureID token: is an example of a key fob that is produced by RSA. A key fob generates a random number code synchronized to a code on the server. The code changes every 60 seconds or so.
- Kensington Lock: hole in laptops to chain them up

# Forensics
- Chain of Custody: is the chronological documentation or paper trail that records the sequence of custody, control, transfer, analysis, and disposition of physical or electronic evidence. The chain of custody must be maintained from when you arrived at the laptop until you turn it over to law enforcement officials. As first responders, our job is to collect the evidence and maintain the chain of custody.


# Post Exam Notes:
- CompTIA Security+
- SIP proto: Session Initiation protocol (VoIP)
- CASB: Cloud Access Security Broker
- ISO 31000: Risk management guidelines
- DNS tunneling: abuse dns to make a tunnel for command & control
- dnsenum: a multithreaded perl script to enumerate DNS information of a domain and to discover non-contiguous ip block
- Captive Portal: WiFi at hotel, airports, etc.
- SSL stripping: downgrade to less secure
