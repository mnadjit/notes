---
aliases:
  - AWS Deployment and Management
tags:
  - tech
  - cloud
  - aws
author: Mehdi N Tehrani
creat_date: 2023-11-13
category: Cloud
subcategory: AWS Deployment and Management
---

# CloudFormation
#cloudformation 
- *Stacks*
- *Stack Sets*: Across accounts or regions
- *Change Sets*: A summary of proposed changes to the currently deployed stack
- *Nested Stacks*: Resource type to be `AWS::CloudFormation::Stack` and `TemplateURL` property points to a separate CF template
# Elastic Beanstalk
#elastic_beanstalk
Automates creation and management of web applications deployed on EC2 instances
Can have multiple versions of the same application
Environment is an application version that has been deployed on AWS resources (including all resources)
Two types of environments:
1. *Web servers*: standard web app listening for HTTP requests
2. *Workers*: polls SQS queue messages - SQS messages come from web servers

# SSM Parameter Store
#parameter_store #ssm_parameter_store
**Systems Manager Parameter Store**
Can store in plain text or encrypted
Use case:
- Passwords
- DB strings
- License codes
No native rotation of key. This is the difference with *Secrets Manager*.

# AWS Config
#aws_config
Used for viewing and managing configuration of resources used for compliance
Get current or historical configuration of resources
Records results in *S3*
Can alert using *SNS* or *CloudWatch Events* or do **automatic remediation** using *System Manager Automation*
System Manager Automation requires an IAM role to be able to update your resources 

# AWS Secrets Manager
#secrets_manager
Differences with Parameter Store
- Automatic rotation for some services:
	- RDS
	- RedShift
	- DocumentDB
- for others need a lambda function to rotate keys
Use case:
- Passwords
- DB strings
- License codes
*Key/Value type*: String or Binary (encrypted) 

|                        | Secrets Manager          | SSM Parameter Store                                     |
| ---------------------- | ------------------------ | ------------------------------------------------------- |
| Automatic Key Rotation | For certain services     | No native key rotation; can use custom lambda functions |
| Key/Value Type         |                          | String, StringList, SecureString (encrypted)            |
| Hierarchical keys      | N                        | Y                                                       |
| Price                  | Charges apply per secret | Charges for advances; free for standard                 |

# AWS OpsWorks
#opsworks
configuration management service
Managed instances of *Chef *and *Puppet*
patching, updating, backup, config and compliance management

# AWS Resource Access Manager (RAM)
#resource_Access_manager #ram
Share AWS resources *within account*, *organization* or *OU*s or *across accounts*
Resources like:
- Subnets
- DBs
- Resource Groups

# RPO, RTO, and DR Strategies
#rpo #recovery_point_objective #rto #recovery_time_objective #dr_strategies

![[RPO_RTO.png]]

## RPO
Recovery Point Objective
Amount of data that can be acceptably lost
Measures in seconds, minutes, hours, 

| RPO                    | Technique                                    |
| ---------------------- | -------------------------------------------- |
| Milliseconds - seconds | Synchronous Replication                      |
| Seconds - Minutes      | Asynchronous Replication                     |
| Minutes - Hours        | Snapshots, cloud backups, Disk-to-disk (D2D) |
| Hours - Days           | Offsite, tape                                |

## RTO
The amount of time it takes to restore data after a disaster occurs

| RTO                    | Technique                                                 |
| ---------------------- | --------------------------------------------------------- |
| Milliseconds - seconds | Fault tolerant                                            |
| Seconds - Minutes      | High availability, load balancing, auto-scaling           |
| Minutes - Hours        | Cross-site recovery (cloud), automated recovery           |
| Hours - Days           | Cross-site recovery (cloud, on-premises), manual recovery |

## DR Strategies
[AWS DR Strategies](https://aws.amazon.com/blogs/architecture/disaster-recovery-dr-architecture-on-aws-part-i-strategies-for-recovery-in-the-cloud/)

### Backup and restore
Low priority workloads
Lowest cost

### Pilot Light
Data is replicated
Services idle/off

### Warm Standby
Minimum resources are running at all times
Business critical workloads
Scale up and out after the event occurs
### Multi-site active/active
Zero downtime
near zero data loss
Mission critical workloads
Highest cost of all

# Cheat Sheets
[AWS CloudFormation Cheat Sheet](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/management-tools/aws-cloudformation/)
[AWS Elastic Beanstalk Cheat Sheet](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/compute/aws-elastic-beanstalk/)
[AWS Config Cheat Sheet](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/management-tools/aws-config/)
[AWS RAM Cheat Sheet](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/management-tools/aws-resource-access-manager/)
[AWS Systems Manager Cheat Sheet](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/management-tools/aws-systems-manager/)
[AWS OpsWorks Cheat Sheet](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/management-tools/aws-opsworks/)

