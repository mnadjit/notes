---
aliases: 
tags:
  - tech
  - cybsec
  - incident_response
  - preparation
category: cyber_security
subcategory: analyst
---
# Incident Response Phases
1. Preparation
2. Detection and Analysis
3. Containment
4. Eradication and Recovery
5. Post-Incident Activity

## Roles
- **CSIRT**: Cyber Security Incident Response Team
1. Incident Response Manager (Lead)
2. Security Analyst
3. Triage Analyst
4. Forensic Analyst
5. Threat Researcher
6. Cross Functional Support e.g. legal team, etc.

## Documenting Procedures
### Resources
- https://www.incidentresponse.org/playbooks/
### Call List
- Who you're going to call
- When?
- At what level?
### Incident Form
- Date, Time, Location
- Reporter and incident handler ]names
- How incident was observed/detected
- Type of incident
- Scope of incident
- Incident description and event logging

# Data Criticality And Priority Analysis
- **PII**: Personally Identifiable Information
- **SPI**: Sensitive Personal Information
	- GDPR: General Data Privacy Regulation (Europe)
- **PHI**: Personal Health Information
	- HIPPA
- **Financial Information**
	- PCI DSS: Payment Card Industry - Data Security Standard
- **Intellectual Property**
	- Copyright
	- Patent
	- Trademark
	- Trade Secret
- **Corporate Information**
	- profit, cash flow, salaries, market share, key customers, etc.
- **High Value Assets**
	- define which servers are more important
# Communication Plan
- Consider an out-of-band communication method
- Backup communication plan in case the primary one fails
- Up-to-date contact list
- NDA (Non-disclosure Agreement)
# Reporting Requirements
Reporting requirements depend on the type of the breach
-  5 type of breaches
1. Data Exfiltration
2. Insider Data Exfiltration
3. Device Theft/Loss
4. Accidental Data Breach
5. Integrity/Availability Breach

# Response Coordination
- The stakeholders involved
	- Senior Leadership
	- Regulatory Bodies
	- Legal
	- Law Enforcement
	- HR
	- PR (Public Relations)
# Training and Testing
- **TTX**: Tabletop Exercise
- **Penetration Testing**
	- rules of engagement
	- Tools
		- Metasploit
		- Cobalt Strike
		- Kali Linux
		- ParrotOS
		- Commando OS
