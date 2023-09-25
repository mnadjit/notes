---
aliases: CySA+ Incident Response Detection, Analysis and Containment
tags:
  - tech
  - cybsec
  - comptia
  - cysa_plus
  - incident_response
  - detection
  - analysis
  - containment
category: cyber_security
subcategory: analyst
---
[!tip] CompTIA CySA+ Objectives
> Objective 4.2
> Objective 3.1
# OODA Loop
- OODA stages
	- **Observe**
	- **Orient**: What's been found and what to do next
	- **Decide**
	- **Act**
- Avoid paralysis by analysis

# Defensive Capabilities
[Lockheed Martin Article](https://www.lockheedmartin.com/content/dam/lockheed-martin/rms/documents/cyber/LM-White-Paper-Intel-Driven-Defense.pdf)

## Detect
## Destroy
Render an adversary's resources permanently useless or ineffective. At companies this is usually not applicable.
## Degrade
Reduce and adversary's capabilities or functionality
## Disrupt
Interrupt communications or frustrate or confuse their efforts
## Deny
Prevent the adversary from learning about your capabilities or accessing your information assets
## Deceive
Supply false information to distort the adversary's understanding

![[Lockheed Martin Courses of Action Matrix.png]]

# Detection and Analysis
## IOC Detection
- Technical
	- anti-malware software
	- NIDS/NIPS
	- HIDS/HIPS
	- System logs
	- Network device logs
	- SIEM data
	- Flow control devices
- Non-technical
	- Internal personnel
	- external personnel
	- Cyber-threat Intelligence

## IOC Analysis
### Classify IOCs
1. Benign
2. Suspicious
3. Malicious

### Event Correlation

# Impact Analysis
Questions to ask to triage incidents
- Damage to data integrity
- Unauthorized changes
- Theft of data or resources
- Disclosure of confidential data
- Interruption of services
- System downtime

Two approaches
1. **Impact-based**
	- The common approach
	- Based on severity - scope and cost
	- Four main categories of impact
		1. *Organizational impact*: the whole org
		2. *Localized impact*: a single department
		3. *Immediate impact*: direct costs
		4. *Total impact*: costs during and following the incident
2. **Taxonomy-based**: Based on type of incident

# Incident Classification
## Data Integrity
## System Process Criticality
incident that disrupt or threaten a mission essential business function
## Downtime
technical or non-technical
## Economic
## Data Correlation
An incident that is linked to the TTP (Tactics, Techniques, Procedures) of known adversary groups with extensive capabilities
## Reverse Engineering
malware linked to an adversary group
## Recovery Time
how long it takes to recover from an incident
## Detection Time
- an incident which was not discovered quickly
- Based on a study
	- Only 10% of incidents are discovered within an hour
	- 20% of incidents took days to discover
	- 40% of incidents took months to discover

# Containment
## 5 key steps
1. ensure safety and security of all personnel
2. Prevent an ongoing intrusion or data breach
3. identify if the intrusion is the primary or secondary attack
4. avoid alerting the attacker that attack has been discovered
5. preserve any forensic evidence of the intrusion and attack

## Categories of Containment
### Isolation
remove an affected component from its larger environment.
- **Creating an airgap** #airgap: by disabling a switch port or unplugging the cable from the network. it's the least stealthy option and will reduce opportunities to analyze the attack or malware
- **Remove user privileges**
### Segmentation
Isolate a host or group of hosts using network technologies and architecture. Also called sandboxing. #sandboxing
- VLAN
- Routing/Subnets
- Firewall ACLs
