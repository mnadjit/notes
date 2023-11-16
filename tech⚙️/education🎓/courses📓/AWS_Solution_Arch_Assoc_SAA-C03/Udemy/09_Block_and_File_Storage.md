---
aliases:
  - AWS Block and File Storage
tags:
  - tech
  - cloud
  - aws
  - file
  - block
  - storage
author: Mehdi N Tehrani
creat_date: 2023-11-06
category: Cloud
subcategory: AWS File Storage
---

# Block and File Storage
## Block Storage
OS sees a volume which can be partitioned and formatted
e.g. Amazon EBS
## File Storage
A filesystem can be shared by many users/computers e.g. a NAS
e.g. Amazon EFS
## Object Storage
Access via REST APIs
No hierarchy
Scalable and low cost
e.g. S3
# Elastic Block Storage (EBS)
#ebs
EC2 instances should be in the same availability zone to be accessible
An EBS can be accessed from a single EC2 only except with *EBS multi-attach* for *Nitro*-based EC2 instances


## Deployment and Volume Types
### SSD-backed Volumes
![[SSD-backed_Volumes.png]]
### HDD-backed Volumes
![[HDD-backed_volumes.png]]

> On EC2 termination, root EBS volumes are deleted
> data volumes (non-root EBS volumes) are retained

## Copying, Sharing and Encryption
Although snapshots are incremental, only keeping the last one is enough to restore to the latest version
From snapshot you can create a *AMI*  - *Amazon Machine Image*
#amazon_machine_image #ami

| Source         | Destination  | Encryption           | Location                                 |
| -------------- | ------------ | -------------------- | ---------------------------------------- |
| vol            | snapshot     | state retained       | same region                              |
| snapshot       | enc snapshot | can be encrypted     | can change region                        |
| unenc snapshot | enc vol      | can be encrypted     | can change AZ                            |
| unenc snapshot | AMI          | Cannot be encrypted  | can be shared with other accounts/public |
| snapshot       | snapshot     | can change enc key   | can change region                        |
| enc snapshot   | enc AMI      |                      | can be shared with other accounts        |
| enc AMI        | enc AMI      | can change enc key   | can change region                        |
| enc AMI        | EC2          | can change enc key   | can change AZ                            |
| unenc AMI      | EC2          | can change enc state | can change AZ                            |
| enc snapshot   | enc vol      | can be encrypted     | can change AZ                            |

## Snapshots and DLM
#dlm #data_lifecycle_manager
DLM automate creation, retention and deletion of backups and AMIs

# EC2 Instance Store Volumes
#instance_store_volume
- local disks physically attached to the EC2 host - very high performance
- data is lost if powered down
- used for cache, buffers, scratch data
- created from AMI templated stored on S3 - hence available across the region
- cannot be detached/re-attached to an EC2
**Block Device mapping**: specifies the volumes to attach to an EC2 when it launches
Types:
- Community
- AWS Marketplace AMIs
- My AMIs
# Using RAID with EBS 
#raid
RAID 0 and 1 are recommended on AWS, but not 5, and 6
No way to do this in AWS, but only can be done in operating system

# Elastic File System (EFS)
#efs #nfs #smb
NFS protocol is used to mount an EFS on EC2 instances 
From same or other VPCs or even on-premises using Direct Connect
only supported on Linux
For cross-region/accounts connection a VPC peering is needed and IP address should be used - *not DNS*
DNS can be used within the same region
Mount targets can be created for each AZ
Security Group can be used to limit access
IAM roles with either *identity* or *resource* policies can be used for access control
Must use *EFS mount helper* for IAM authorization and TLS


![[NFS_vs_SMB.png]]
NFS port:
- `2049`
SMB ports
- `139`: over NetBIOS
- `445`: over TCP

# FSx
#fsx
Amazon fully managed file systems
- FSx for Windows File Server
	- Supports SMB, NTFS, AD integration
	- Supports shadow copy, ACLs, user quotas
	- NTFS can be accessed from thousands of compute instances using SMB
	- High availability across AZ 
		- or multiple AZs: an active and a standby file server
- FSx for *Lustre*: for Linux
	- used for 
			- high performance computing (HPC) #hpc
			- Machine Learning #ml #machine_learning
			- Video Processing
			- Financial Modeling
			- Electronic Design Automation (EDA) #electronic_design_automation #eda
	- Can present S3 objects as files
	- provides a POSIX-compliant file system interface

FSx can be accessed from on-premises systems via VPN
# Storage Gateway
#storage_gateway
provides a virtual on-premises file server
access S3 objects

## File Gateway
#file_gateway
supports SMB and NFS
A local cache can enhance access 
Virtual gateway appliance runs on Hyper-V, VMware, KVM or EC2
Files are stored on S3 buckets
## Volume Gateway
#volume_gatewy
Supports block-based volumes only, not file-based ones
On-premises servers use iSCSI protocol to communicate with the volume gateway

#iscsi
### Cached Volume Mode
entire dataset is stored on S3
a cache of the most recently used data is stored on-premises
### Stored Volume Mode
entire dataset stored on-site and is backed up async to S3 (EBS point-in-time snapshots)
## Tape Gateway
#tape_gateway
When writing to tapes, data gets stored on S3
When tapes are ejected, data is written to S3 *Glacier* or *Glacier Deep Archive*
#S3_glacier #glacier 
Supported by *NetBackup*, *Backup Exec*, *Veeam*, etc.
Size options:
- 100 GB
- 200 GB
- 400 GB
- 800 GB
- 1.5 TB
- 2.5 TB
A tape gateway can have up to 1,500 virtual tapes with a max of 1 PB capacity
all data transferred between the gateway and AWS storage is encrypted using TLS
Data stored on S3 is encrypted server-side with Amazon S3-managed Encryption Keys (SSE-S3)
#sse_s3 #amazon_s3_managed_encryption_keys

# Cheat Sheets
[Amazon EBS Cheat Sheets](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/compute/amazon-ebs/)
[Amazon EFS Cheat Sheets](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/storage/amazon-efs/)
