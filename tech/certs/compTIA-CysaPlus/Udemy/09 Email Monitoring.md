# Email IoC
## Spam
## Phishing
### Pretext
## Spear Phishing
## Impersonation
- **BEC**: Business Email Compromise
## Forwarding
When phishing email is formatted to appear to have come as part of a reply or forward chain
Can be detected by examining email header

## Email Spoofing

# Email Server Security
## SPF
> Sender Policy Framework
- A single DNS record per domain
- example: `TXT @ "v=spf1 mx include:_spf.securemailprovider.foo -all"`
## DKIM
> Domain Keys Identified Mail
- provides a cryptographic auth mechanism which can replace or supplement SPF.
## DMARC
> Domain-based Message Authentication, Reporting, and Conformance
- enforces that SPF and DKIM are being utilized effectively.
- DMARC policy is published as a DNS record
- ensures domain in return-path (envelope from) is aligned with SPF check or DKIM signature
- specifies a fall-back mechanism:
	- flag
	- quarantine
	- reject
- provides mechanisms for recipients to report DMARC auth failures to the sender
![[./images/email_dmarc.png]]
## Cousin Domains
SPF, DKIM, and DMARC do not solve the problem of cousin or look-alike domains. These are domain names or domain name parts that closely resemble an organization's real domain.

# Email Malicious Content Analysis
## Malicious Payload
- Exploit
- Attachment
## Embedded Links
## Email Signature Block
spear phishing might have obtained samples of a company's signature block and constructed a convincing facsimile

# Email Header Analysis
## Important headers
- Display From
- Envelope From
	- return address if email is rejected
- Received From/By
List of MTAs that passed the email until it reached the destination 
## Useful Tool
https://testconnectivity.microsoft.com

