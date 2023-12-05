---
aliases: Reconnaissance
tags:
  - tech
  - cybsec
  - certification
  - oscp
  - reconnaissance
  - reconn
author: Mehdi N Tehrani
creat_date: 2023-12-02
category: Cyber Security
subcategory: Offensive Security - OSCP
---

# Passive
## Physical
Satellite images
Drone recon
building layout
- badge readers
- break areas
- security
- fencing
## Social
*Employees*: name, job title, phone number, manager, etc.
*Pictures*: badge, desk, computer, etc.
## Web/Host
### Target Validation
WHOIS, nslookup, dnsrecon
### Finding Subdomains
Google Fu, dig, nmap, Sublist3r, crt.sh
### Fingerprinting
nmap, wappalyzer, WhatWeb, BuiltWith, netcat
### Data Breaches
HaveIBeenPwned, Breach-Parse, WeLeakInfo
# Active


# Target Identification
#bugcrowd
[Bug Crowd](https://bugcrowd.com)
Collection of public Bug Bounty programs

# Email OSINT
#email_osint #hunter #phonebook_cz #voila_norbert #clearbit #email_hippo
https://hunter.io: email hunter
[Phonebook CZ](https://phonebook.cz)
[Viola Norbert](https://voilanorbert.com)
[ClearBit Connect Chrome Extention](https://chromewebstore.google.com/detail/clearbit-connect-free-ver/pmnhcgfcafcnkbengdcanjablaabjplo?pli=1): Find emails for a certain org - allows up to 1000 emails per month on free tier
[email hippo](https://tools.emailhippo.com/): Verify email address
[email checker](https://email-checker.net/): Verify email address

# Breached Credentials
## Breach-parse
#breached_credentials #breach_parse
https://github.com/hmaverickadams/breach-parse

## DeHashed
#dehashed
https://dehashed.com/
https://hashes.org: online hash cracking tool - no longer available 
- [ ] find alternatives to hashes.org

# Hunting Subdomains
#subdomain
## Sublist3r
#sublist3r #sublister
a Linux package
## crt.sh
#crt_sh #certificate_fingerprinting #cert_fingerprinting 
Certificate Fingerprinting
https://crt.sh
finds multiple levels of subdomains

## OWASP Amass
#owasp_amass #amass
https://github.com/owasp-amass/amass

## tomnomnom httpprobe
#tomnomnom_httpprobe
https://github.com/tomnomnom/httprobe
Probe a list of domains for http and https endpoints

# Web Applications
## BuiltWith
#builtwith #browser_extension
Website: https://builtwith.com/
https://builtwith.com/toolbar

## Wappalyzer
#wappalyzer #browser_extension 
[Wappalyzer Chrome Extension](https://chromewebstore.google.com/detail/wappalyzer-technology-pro/gppongmhjkpfnbhagpmjfkannfbllamg)

## whatweb
#whatweb
kali built-in cli tool

# Burp Suite
#burpsuite
Web Proxy

# Google Fu
#google_fu
https://searchengineland.com/advanced-google-search-operators-388355

`site:`
`related:`
`inurl:`
`allinurl:`
`intitle:`
`intext:`
`allintext:`
`filetype:`
`around(x)`: The `around(x)` command will account for word proximity by limiting your results to pages that feature the searched words within ‘X’ words of one another.
`daterange:`
`@`: social media e.g. `@linux` shows results for Linux in social media websites
`source:`

# Social Media
#social_media

