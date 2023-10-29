---
aliases: AWS Security
tags:
  - tech
  - cloud 
  - aws 
  - security
author: Mehdi N Tehrani
creat_date: 2023-10-21
category: Cloud
subcategory: AWS Security
---

# AWS Directory Service
#aws_directory
## Managed Microsoft Active Directory
- Best choice if more than 5000 users and/or need a trust relationship set up
- can perform schema extensions
- can set up trust relationships with on-premises AD
	- requires Direct connect or *AD Connector*

### AD Connector
Redirects directory requests to your on-premise AD
Sizes:
- Small: up to 500 users
- Large: up to 5000 users

## Simple AD
Least expensive
less than 500 users
Kerberos-based SSO
supports joining Linux and Windows

# Identity Providers and Federation
## SAML 2.0
**LDAP**: Identity store
**ADFS**: Identity provider
For an on-premises app to access an AWS: 
- first the app needs to get a SAML assertion from ADFS. 
- This is then provided to *AWS STS* - *Security Token Service* #sts
	- API call is `sts:AssumeRoleWithSAML`
- STS  returns temporary security credentials back to the app
- the app now can access the AWS resource
## IAM Web Identity Federation
Can use any OIDC - Open ID Connect, -compatiable IdP such as social Identity providers 
- After authentication with an Idp, JWT token is sent to AWS STS 
	- API call is `sts:AssumeRoleWithWebIdentity`
- STS  returns temporary security credentials back to the app
- the app now can access the AWS resource
> [!warning] **Cognito** is recommended instead in this use case

## IAM Identity Center
SSO Provider

# Amazon Cognito
Commonly used with web app and mobile apps
## Cognito User Pool
- Contains identities or it can use OIDC compatible IdP's for authentication
- JWT is sent back to mobile/web app
- JWT is sent to **Cognito Identity Pool** which can communicate with STS and return security token to the app to access desired resource
## Cognito Identity Pool
- used for obtaining temporary credentials from STS. Effectively, swapping JWT with AWS access token which can be used to access AWS resources like DynamoDB or Lambda functions.

# KMS (Key Management Service)
#kms
> [!info] KMS is used for Encryption At Rest
- KMS keys are protected by HSMs - Hardware Security Modules
- KMS keys can encrypt data up to 4 KBs in size
- KMS keys can be used to create DEK - Data Encryption Keys to enc/dec larger amount of data.
## External Key Store (XKS)
#xks #external_key_store
A KMS key can be stored in - XKS i.e. External Key Store 
## AWS Managed KMS Keys
Created and managed by AWS used for certain services
## Customer Managed Keys
Can optionally be be automatically rotated every 365 days - symmetric keys only 
The key material changes, but the key IDc, arn, region, etc. don't

## Data Encryption Keys (DEK)
#dek
You can use KMS keys to generate, encrypt and decrypt data keys.
KMS does NOT store, manage or track data keys. It should be handled outside of KMS e.g. in the user's code
## Automatic Rotation
only supported on *symmetric* KMS keys with key material that KMS generates i.e. `Origin = AWS_KMS`

## Manual Rotation
Generate new key with new key ID - use aliases to avoid disruptions to services using the key

## KMS Key Policies
**Grant**: used for temporary delegation of use of a key, without modifying the key policies or IAM policies
> [!info] To share snapshots with another account you must specify `Decrypt` and `CreateGrant` permissions

> [!info] The `kms:ViaService` condition key can be used to limit key usage to specific AWS services

## Cryptographic Erasure 
#ce #cryptographic_erasure 
	- deleting the key so the data can never be decrypted, effectively making the data forever inaccessible to everyone
	- Use `DeleteImportedKeyMaterial` API to remove key material

> [!info] An `InvalidKeyId` exception when using *SSM Parameter Store* means the KMS key is not enabled

# CloudHSM
#hsm #hardware_security_module
- Custom Key Store for highly sensitive keys such as CA private key for your organization
- It's AWS dedicated key storage service - a dedicated hardware running in your VPC
- only available for symmetric KMS keys
- Uses *FIPS 140-2 level 3* validated HSMs. KMS uses level 2/3.
- store master key for *Oracle DB Transparent Data Encryption*
# Certificate Manager (ACM)
#acm #aws_certificate_manager
> [!info] ACM is used for Encryption In Transit
- Create, store and renew *SSL/TLS X.509* certificates
- integrates with ECS, CloudFront, Elastic BeanStalk, Nitro Enclaves, CloudFormation
- Public certs are signed by AWS public cert authority
	- but can use your own CA

# WAF (Web Application Firewall)
- *Web ACLs*
- *Rules*
- *Rule Groups*
- *IP Sets*
- *Regex Pattern Sets*
- *Rule Action*
	- Count
	- Allow
	- Block
- *Match*
	- Geographically
	- IP set match
	- Regex Pattern Set
	- Size Constraint
	- SQLi attach
	- String match
	- XSS scripting attack
# Amazon Inspector
#inspector
*Vulnerability* and *network* assessment scanner
requires an agent on EC2
## Network Assessments
- Do not require an agent
## Vulnerability Assessment
- Vulnerabilities (CVE)
- Host hardening (CIS)
- Security best practices

Requires an agent which can be installed automatically using SSM Run command

# Amazon Macie
#macie #machine_learning
Fully managed *data security and privacy service*
uses *machine learning* and *pattern matching*
Enables security compliance and preventive security
- Identify PII, PHI, regulatory docs, API keys, secret keys
- identify changes to policy and ACLs
- continuously monitor security posture of S3
- Generate security findings that you can view using the Macie console, AWS Security Hub, or Event-Bridge
- Manage multiple AWS accounts using Organization

# AWS GuardDuty
#guard_duty
*Intelligent threat detection* service which detects
- Account compromise
- S3 compromise
- Malicious reconnaissance
By monitoring events across:
- CloudTrail Management events
- CloudTrail S3 data events
- VPC Flow logs
- DNS logs

# AWS Shield
#shield #ddos
Protection against DDOS attack
- Automatic Inline Mitigation
- Two tiers:
	- Standard: no cost - integrated with CloudFront
	- Advanced: 3K UAD per month - 1 year commitment 
