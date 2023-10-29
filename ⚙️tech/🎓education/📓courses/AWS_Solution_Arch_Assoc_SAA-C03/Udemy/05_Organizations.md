---
aliases: 
  - AWS Organizations
tags:
  - tech
  - cloud 
  - aws 
  - organization
author: Mehdi N Tehrani
creat_date: 2023-10-01
category: Cloud
subcategory: AWS Organizations
---

Used to manage multiple AWS accounts under a single 
**OrganizationAccountAccessRole** : Default role created when an account is created using Organizations in AWS
# Features
1. Consolidated billing
2. All features
	- SCP policies
	- Tag policies

Organization includes root accounts and OUs
## Organizational Units
#ou #organizational_unit
SCPs can be assigned to OU's

# Service Control Policy
#scp #service_control_policy
Can be applied to OUs
SCP defines maximum permissions 

# Control Tower
#control_tower #aws_control_tower
Sits on top of organization and allows extra capabilities
## Landing Zone
#landing_zone #aws_landing_zone
Control Tower creates a *landing zone* which is a well-architected multi-account baseline that's based on AWS best practices
### OUs
It creates following OUs and accounts:
- **Root OU** -
	- *management* account:
	- **Security OU**
		- *Audit* account
		- *Log Archive* account
	- **Sandbox OU**
		- *Dev/Test* account
	- **Production OU**
		- *Prod* account

### IAM Identity Center integration
Control Tower integrates with IAM Identity Center and identity providers can be
- SSO
#sso
- SAML 2.0 IdP
#saml_2_0
- Microsoft AD
#ms_active_directory #ms_ad #active_directory 

### SCPs
Control Tower creates *preventive* and *detective* SCPs
Preventive:
- based on SCPs that deny certain API rules
Detective:
- implemented using *AWS Config* rules and *Lambda functions* and monitor and govern compliance 

SCPs affect only IAM users and roles - NOT resource policies
SCPs do not impact the in the **management** account, but only the *root* account in the member accounts

#### Deny List Strategy
- uses *FullAWSAccess* SCP attached to every OU and account which overrides the implicit deny
	- explicitly allows all permissions to follow down from the root
- Then we need to create additional SCPs to explicitly deny permissions

#### Allow List Strategy 
- remove *FullAWSAccess* from all OUs and accounts, this will deny all API actions
- add SCPs to allow desired API actions to an account and *all OUs above it* including root

