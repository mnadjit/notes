---
aliases: AWS S3 
tags:
  - tech
  - cloud
  - aws
  - storage
  - simple_storage_service
  - s3
author: Mehdi N Tehrani
creat_date: 2023-11-11
category: Cloud
subcategory: AWS Storage
---

# Storage Classes
- Durability: AWS guarantees 11 9's
- Availability

![[S3_Storage_Classes.png]]
# Access Control
## Authorization Process
![[S3_Authorization_Process.png]]
## IAM policies 
Identity-based policies attached to *User*, *Group*, or *Roles*
AWS Access Policy Language
Preferred for:
- access control to services other than S3
- numerous S3 buckets each with different permissions
- organizational preference
## Bucket policies
Resource-based policies attached to an S3 bucket
AWS Access Policy Language
Preferred for:
- simple access granting mechanism for cross-account access
- IAM policies reaching size limit
- organizational preference
## ACL
Legacy access control mechanism
Not recommended
Can be attached to a bucket or directly to an object

# Versioning
# Replication
Needs a role with
- *Trust Policy* to allow *S3 service* to *assume a role*.
- *permissions* to read from source bucket and replicate to the destination 
## Cross Region Replication (CRR)
#crr #cross_region_replication
## Same Region Replication (SRR)
#srr #same_region_replication
Versioning has to be enabled
Buckets can be in two different accounts
# Lifecycle Management
## Transition object to another storage class
![[S3_Lifecycle_management.png|500]]
- **Cannot* transition from any class into *Standard* or *Reduced Redundancy*
- **Cannot* transition from *Intelligent-Tiering* class into *Standard-IA*
## Expire object

# MFA with S3
## MFA Delete
Adds MFA requirements for
- changing versioning state of a bucket. Versioning can be enabled by:
	- Bucket owner (root account)
	- AWS account that created the bucket
	- Authorized IAM users
- permanently deleting an object version. *MFA Delete* can be enabled by:
	- Bucket owners (root account)

`x-amz-mfa` header is needed in the http header for delete operations that require MFA 

## MFA-protected API access
enable MFA for AWS services - not just S3
enforced by using `MultiFactorAuthAge` key in bucket policy:
```
condition: {
	"Null": { "aws:MultiFactorAuthAge": true }
}
```

# S3 Encryption
## 1. SSE-S3
#sse_s3 #server_side_encryption
Server Side Encryption S3 (default encryption mechanism)
S3 managed keys
AES-256

## 2. SSE-KMS
#sse_kms
KMS managed keys
Can be AWS managed keys, or customer managed KMS keys
## 3. SSE-C
#sse_c
Client-provided keys 
Keys are **not** stored in KMS

## 4. Client-side encryption
Data already encrypted before stored into S3 

## Encrypt current non-encrypted objects
1. S3 Batch operations
2. `CopyObject` API operation
3. `copy-object` AWS cli command

## Enforce a certain encryption method
Use bucket policy using the following condition
```
condition: {
	"StringNotEquals": { 
		"s3:x-amz-server-side-encryption" : "aws:kms" 
	}
}
```

# S3 Event Notifications
SNS Topic Access Policy required for S3 event notifications:
```
"Statement": {
	"Sid": "S3EventNotification",
	"Effect": "Allow",
	"Principal": [ "Service": "s3.amazonaws.com" ],
	"Action": [ "SNS:publish" ],
	"Resource": "arn:aws:sns:<region>:<acccount_id>:<topic>"
	"Condition": {
		"ArnLike": { "aws:SourceArn": "arn:aws:s3:::<bucket>" },
		"StringEquals": { "aws:SourceAccount": <account_id> }
	}
}
```

# Presigned URLs
AWS CLI command to generate a presigned URL for an S3 object:
`aws s3 presign s3://<bucket>/<object>`

# Multipart upload
#multipart_upload
Recommended for objects larger than 100 MB 
Can be used for objects from 5 MB up to 5 TB
Mandatory for objects larger than 5 GB

# Transfer acceleration
#transfer_acceleration
Uses CloudFront edge locations to improve file uploads to S3
`https://<bucket>.s3-accelerate.amazonaws.com`
`https://<bucket>.s3-accelerate.dualstack.amazonaws.com`
Can be enabled at the bucket level

# S3 Select and Glacier Select
Access files inside a zip archive using SQL queries without need for unarchiving the zip file

# Server Access Logging
Collect S3 event logs into another S3

# CORS
#cors #cross_origin_resource_sharing
*Preflight request* checks if allowed to make a request to a different origin than the original resource.
CORS available settings:
1. Access-Control-Allow-Origin
2. Access-Control-Allow-Methods
3. Access-Control-Allow-Headers

Add JSON CORS rules to S3 bucket. e.g.
```
[
	{
		"AllowedHeaders": [ "*" ],
		"AllowedMethods": [ "PUT", "POST", "DELETE" ],
		"AllowedOrigins": [ <secondary-url> ]
		"ExposeHeaders": []
	}
]
```

# Cross Account Access
#cross_account_access #trust_policy #external_id #iam_policy #assume_role #cli #management_console
1. Resource-based *policies* and *IAM policies* for **programmatic-only** access
2. Resource-based *ACL* and *IAM policies* for **programmatic-only** access
3. Cross-account *IAM roles* for **programmatic** and **console** access

To configure cross account access using IAM roles:
- Create a role in target account where S3 bucket exists
- Add a *Trust Policy* to the role to allow access from the calling account. This will allow a user from the calling account to be able to assume this role. You can add an `ExternalID` which acts as a passphrase. 
- Set policy permissions to allow certain actions on S3 bucket and its objects
- From the calling account run the following command to assume the role
`aws sts assume-role --role-arn <arn> --role-session-name <session_name> --external-id <external_id>`
This will return the following key/values
	- `AccessKeyId`
	- `SecretAccessKey`
	- `SessionToken`
- Use the following key/values to configure the AWS cli:
	- `aws configure set aws_access_key_id <access-key-id> --profile <profile>` 
	- `aws configure set aws_secret_access_key <secret-access-key> --profile <profile>`
	- `aws configure set aws_session_token <session-token> --profile <profile>`
- To switch role in the management console, click on account's name, *Switch Role*, enter account number, and for Role enter `OrganizationAccountAccessRole`
- Then the calling account can access the S3 bucket in the target account
# S3 Object Lambda
#s_object_lambda
Provides an interface where certain actions can be performed before an object is returned from a GET request. 
It can be a custom lambda or AWS prebuilt functions like:
- detect and restrict access if PII is detected
- Redact PII
- Decompress files 

# Cheat Sheets
[Amazon S3 Cheat Sheet](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/storage/amazon-s3/)
