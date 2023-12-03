---
aliases:
  - AWS Control Tower Deployment Guide
tags:
  - tech
  - cybsec
  - cloud
  - aws
  - control_tower
  - landing_zone
  - landing_zone_accelerator
  - lza
author: Mehdi N Tehrani
creat_date: 2023-12-02
category: Cloud
subcategory: AWS Control Tower Landing Zone
---
# Overview
**Control Tower**: Sits on top of organization and allows extra capabilities
**Landing Zone**: Control Tower creates a *landing zone* which is a well-architected multi-account baseline that's based on AWS best practices.
**Landing Zone Accelerator**: is a CloudFormation template which can be used after deployment of Control Tower initial Landing Zone to build an organization with desired OUs, *mandatory* as well as *workload* AWS accounts. Landing Zone Accelerator (LZA) comes in different flavours for each industry depending on their regulations. It applies Security Control Policies (SCP) #scp relevant to a certain security framework to the relevant OUs the AWS accounts reside in. 
**Mandatory Accounts**: *Log Archive*, *Audit* and *Network accounts* (prod and non-prod)
**Workload Accounts**: AWS accounts to be created for each application or use-case. For example, if you want to deploy a web application, it's best to have a new AWS account for production and one for non-production environments.

# References
https://docs.aws.amazon.com/solutions/latest/landing-zone-accelerator-on-aws/solution-overview.html

# Organization
Configure an Organization using the primary AWS account a.k.a. Management account

# Control Tower
Configure control tower in your **home region** using the root AWS account a.k.a. Management account
This creates two stacks:
1. AWSControlTowerBP-BASELINE-CONFIG-MASTER
2. AWSControlTowerBP-BASELINE-CLOUDTRAIL-MASTER

# AWSAccelerator-InstallerStack
## Preparation
1. set up LZA role: https://docs.aws.amazon.com/controltower/latest/userguide/enroll-manually.html
2. Create Github access token to access public repos -> add to AWS Secret Manager as plain text with the name below. This is used for 
	- name = "accelerator/github-token"
	- Ref: https://docs.aws.amazon.com/solutions/latest/landing-zone-accelerator-on-aws/prerequisites.html

3. Navigate to https://docs.aws.amazon.com/solutions/latest/landing-zone-accelerator-on-aws/step-1.-launch-the-stack.html
4. Click on "Launch Solution"
5. By default the region is set as `us-east-1`. Make sure this is updated to your home region, and then click *Next*
6. Fill in the fields for account emails. Management account is the email used to log in to AWS root AWS account. Two other unique email addresses are needed for *Audit* and *Log Archive* AWS accounts.
7. Select the LZA role created in preparation phase
8. Select create new CodeCommit repo - unless this is not the first attempt and `aws-accelerator-config` repo already exists in CodeCommit; in which case select existing repo
9. Submit the LZA CloudFormation template
	- This deploys LZA cloudformation stack "AWSAccelerator-Installer" which will install a Code Pipeline named "AWSAccelerator-Pipeline"
	Code pipeline will deploy more stacks:
```
AWSAccelerator-PipelineStack-$(account)-$(region)
AWSAccelerator-PrepareStack-$(account)-$(region)
AWSAccelerator-DependenciesStack-$(account)-$(region)
AWSAccelerator-KeyStack-$(account)-$(region)
AWSAccelerator-LoggingStack-$(account)-$(region)
AWSAccelerator-OrganizationsStack-$(account)-$(region)
AWSAccelerator-NetowrkPrepStack-$(account)-$(region)
AWSAccelerator-SecurityStack-$(account)-$(region)
AWSAccelerator-OperationsStack-$(account)-$(region)
AWSAccelerator-NetworkVpcStack-$(account)-$(region)
AWSAccelerator-NetworkVpcEndpointsStack-$(account)-$(region)
AWSAccelerator-NetworkVpcDnsStack-$(account)-$(region)
AWSAccelerator-SecurityResourcesStack-$(account)-$(region)
```

10. The pipeline *AWSAccelerator-Pipeline* will create a CodeCommit repo named `aws-accelerator-config`
This needs to be updated before the pipeline can complete all steps. So you might need to stop the pipeline once it's deployed by CloudFormation, or if it fails, try updating it using the following instructions.
If *AWSAccelerator-Pipeline* failed during the *Prepare* phase, make sure to delete the failed stack `AWSAccelerator-PrepareStack-$(account)-$(region)` before retrying to run the pipeline.
	- git clone the CodeCommit repositoray named `aws-accelerator-config` created in your AWS account
	- git clone the latest release of "landing-zone-accelerator-on-aws" repository from https://github.com/awslabs/landing-zone-accelerator-on-aws
	- merge and update them according to this article: https://github.com/awslabs/landing-zone-accelerator-on-aws/blob/release/v1.5.0/reference/sample-configurations/lza-sample-config-healthcare/README.md#deployment-overview 
		- Make sure the latest release version is being used. At the time of writing this, LZA 1.5.0 was the latest LZA release version on GitHub
		- for healthcare installation make sure to use `/reference/sample-configurations/lza-sample-config-healthcare`
		- *homeRegion* variables and email addresses should be updated
		- Rename OUs in the organization yaml file to create the desired organization structure. If you created Sandbox OU when deploying LZA CloudFormation template - as suggested by AWS, make sure to add it here.
	- Commit all changes to the local repo `aws-accelerator-config` and push the repo to AWS CodeCommit
11. To retry running the pipeline, navigate to Code pipeline and *Release Change* to trigger the pipeline from the beginning with the updated config files.


12. Audit Manager > Settings > General > Delegated Administrator - Enter you AWS "Audit" account ID and click on Delegate button 
	https://docs.aws.amazon.com/audit-manager/latest/userguide/general-settings.html
 



# Troubleshooting
## Pipeline Steps 
### Organization
- Clean up process if pipelines fails during this step:
	- [Use root account for this] Billing > Cost and usage reports > Delete report named *accelerator-cur*
	- S3 > Empty and delete bucket named *accelerator-cur-$(account)-$(region)*
	- Audit Manager > Audit Manager > Settings > General > Delegated Administrator - Enter you AWS "Audit" account ID and click on Delegate button
	- CloudFormation > Stacks > Delete stack named *AWSAccelerator-OrganizationsStack-$(account)-$(region)*
#### Errors
- Error: `DuplicateReportNameException`
- Resolution: [Use root account for this] Billing > Cost and usage reports > Delete report named *accelerator-cur*

## Git Access to Code Commit
https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-https-unixes.html

## Organization new OUs not enrolled
If the LZA deployment of *AWSAccelerator-Pipeline* fails in the Organization section, make sure under Control Tower > Organization all newly created accounts are enrolled.

# Required Role for Control Tower and LZA deployment
The following role can be used to deploy 'Control Tower Landing Zone' and 'Landing Zone Accelerator'
Role Name:
	`AWSControlTowerExecution`
Permissions:
	`AdministratorAccess` (AWS Managed Permission Set)

Trust relationships:
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "cloudformation.amazonaws.com"
            },
            "Action": "sts:AssumeRole",
            "Condition": {}
        }
    ]
}
```
