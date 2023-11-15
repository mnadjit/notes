---
aliases: AWS Migration and Transfer
tags:
  - tech
  - cloud
  - aws
  - migration
  - transfer
author: Mehdi N Tehrani
creat_date: 2023-11-14
category: Cloud
subcategory: AWS Migration and Transfer
---

# Migration Tools Overview

|                   | Discovery Connector                  | Discovery Agent                     |
| ----------------- | ------------------------------------ | ----------------------------------- |
| Supported servers | VMWare                               | Hyper-V, Physical                    |
| Deployment        | Per vCenter                          | Per server                          |
| Collected Data    | VM Inventory, config                 | System config                       |
|                   | and performance history such as CPU, | System performance                  |
|                   | memory, and disk usage               | Running Processes                   |
|                   |                                      | Network connections between systems |
| Supported OS      | Any OS running on VMWare vCenter     | Amazon Linux, Ubuntu, RHEL, CentOS  |
|                   | (v5.5, 6.0, 6.5)                     | SUSE, Windows Server                | 


# AWS Application Discovery Service
#application_discovery_serviec
First step
If using VMware, can use *agentless discovery* with an OVA imported into VMware
- This collects: Static config data, Hostnames, IPs, MACs, Disk Resource Allocations, VM Utilization, CPU, RAM, Disk I/O

Hyper-V and physical servers require *agent-based discovery*
- This collects: Static config data, Time series perf data, Network In/Out, Running processes

Collected data from Application Discovery Service can be stored in S3, then analyzed using *Athena* or *QuickSight*

# AWS Database Migration Service (DMS)
#dms #Database_migration_serviec
*Schema Conversion Tool (SCT)*: for heterogenous migrations 
#sct #schema_conversion_tool 
Destinations:
- Aurora
- DocumentDB
- DynamoDB
- RedShift
Database can be on-premises, on EC2 or RDS

Use cases:
- Cloud to Cloud: 
	- EC2 to EDS
	- RDS to RDS
	- RDS to Aurora
- On-premises to cloud
- Homogenous migrations:
	- Oracle to Oracle
	- MySQL to RDS MySQL
	- SQL Server to RDS for SQL Server
- Heterogenous migrations:
	- Oracle to Aurora
	- Oracle to PostgreSQL
	- SQL Server to MySQL
- Development and test
- Database Consolidation
- Continuous data replication
		- DR, or dev/test
		- Single-source multi-target
		- Multi-source single-target

# AWS Application Migration Service (MGN)
#mgn #application_migration_serviec
AWS recommends agent-based replication when possible as it supports *continuous data protection (CDP)* 
#cdp #continous_data_protection
MGN creates *Launch Templates* 
Provides automated, incremental, and scheduled migrations
Also, events can be sent to EventBridge and trigger lambdas for automation
Highly automated *life-and-shift* (rehost) solution for migration 
#lift_and_shift #rehost
uses continuous *block-level replication* and enables short cutover windows measured in *minutes* 
*SMS* uses *snapshot-level replication* and enables cutover windows measures in *hours*
MGN is preferred over SMS
MGN integrates with **Cloud Migration Factory** for orchestrating manual process

# AWS Server Migration Service (SMS)
#sms #server_migration_serviec
SMS builds AMIs (Amazon Machine Image) rather than Launch Templates
Requires *AWS SMS Connector* installed
CloudWatch events and lambdas can be used for automation

If used for application migration (app servers, db servers, web servers), both AMIs and CloudFormation templates get built. 

# AWS DataSync
#datasync
Online secure service to migrate on-premises data into AWS storage services
*Shared file system* or *Object storage* with protocols such as *SMB*, *NFS*, *HDFS*, *S3 API* 
AWS Data Sync connects to these file system or object storages and can migrate them into
- S3
- Amazon FSx
	- Windows
	- Lustre
	- OpenZFS
	- NetApp ONTAP
- Elastic File System (EFS)

Data encrypted in transit
Can automate and schedule migrations
a *Snowcone* device with DataSync agent installed on it or *AWS Outpost S3* can connect to DataSync  


# AWS Snow Family
#snow #snowball #snowmobile #snowcone #snowball_edge
**Snowball**
50 or 80 TB (petabyte scale) 
**Snowmobile**
100 PB (exabyte scale)
**Snowball Edge Compute Optimized**
- Provides block and object storage and optional GPU
- For data collection and machine learning and processing in environments with intermitted connectivity
- EC2
**Snowball Edge Storage Optimized**
- S3
- 100 TB (petabyte scale)
**SnowCone**
- small device for storage, edge computing and data transfer

Snowball client can be installed on a computer; used to identify, compress, encrypt, and transfer data
Uses 256-bit encryption, managed with KMS, and tamper-resisteant enclosures (TPM)

## Transfer Optimization
- Use latest Mac or Linux Snowball client 
- Batch small files together
- perform multiple copies - parallel
- copy from multiple workstations
- transfer directories, not files

## Use Cases
Data transfer to cloud
Content distribution: send data to customers or clients
Tactical Edge Computing
Machine Learning
Manufacturing: data collection and analysis in the factory
Remote locations with simple data

# The 7 R's of migration
#7_rs #seven_rs
From easy to hard
1. **Retire**: get rid of it
2. **Retain**: keep for now
3. **Relocate**: life-and-shift; move without modification
4. **Rehost**: AWS term for lift-and-shift; move from on-premises to another environment (in this case, cloud)
5. **Repurchase**: Use a different solution like from on-premises to a SaaS solution 
6. **Re-platform**: example: database to RDS; or server to Elastic Beanstalk 
7. **Refactor**: Re-architect to a cloud-native serverless architecture  

## Rehost
Use **MGN** (AWS application migration service), also can use *SMS* and *AWS VM import/export*
If using vCenter, can use *agentless replication*
If using VMware or Hyper-V, need *AWS Replication Agent* installed

## Re-platform
Use DMS and SCT
Migration to Elastic Beanstalk can use custom AMI or code-level migration, or both

## Refactor
move to serverless solutions
Might involve lots of development, migration effort and cost

# Cheat Sheets
[AWS Migration Services](https://digitalcloud.training/aws-migration-services/)