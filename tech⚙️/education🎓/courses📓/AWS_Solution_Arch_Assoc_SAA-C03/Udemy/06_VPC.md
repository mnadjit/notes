---
aliases: 
tags:
  - tech
  - cloud 
  - aws 
  - vpc
  - virtual_private_cloud
author: Mehdi N Tehrani
creat_date: 2023-10-01
category: Cloud
subcategory: AWS VPC
---

# AWS Global Infrastructure
## Region
Regions are interconnected via a high bandwidth fully redundant network 
## Availability Zone
composed of one or more data centers
## AWS Outposts
Hardware from AWS which you can deploy in your own datacenter which can be connected to an AWS region
## AWS Local Zone
An app can be deployed in a local zone which reduces latency by brining the app closer to other apps or end users
## AWS Wavelength Zone
Similar to *local zone* but for 5G network
## CloudFront
#cloudfront
bringing content closer to end user
### Regional Edge Cache
### Edge Location
#edge_location
# IPv4 Addressing Primer
## Dotted Decimal Notation
#dotted_decimal_notation
`192.168.0.1`
## Classless Interdomain Routing (CIDR)
#cidr #classless_interdomain_routing
`/24`
uses **Variable Length Subnet Masks (VLSM)**
#vlsm #variable_length_subnet_masks
# Amazon VPC Overview
VPC is always across a single region. It spans across all AZs in that region.
Max of 5 VPCs in a region per account.
Subnets cannot span across multiple AZs
*Public region* is where s# service resides
*Internet Gateway* is attached to a VPC for ingress or egress traffic from/to the Internet
*IPv6* is only used for *egress* Internet access
*Peering connection*: private routing between VPCs
*VPC Endpoints*: Private connection to public AWS services
*Direct Connect*: High speed high bandwidth connection from customer to AWS
*Security Group*: Instance-level firewall
*Network ACL*: Subnet-level firewall
# CIDR Blocks
Can be between `/16` to `/28`
Cannot change the size of an existing CIDR block
7 IP addresses cannot be used in each subnet
Make sure VPC CIDR blocks do not overlap across regions if you want do *VPC peering* in the future

# Security Groups and NACL
#security_group #network_acl #nacl
Security group is a *stateful* firewall at the *instance* level
NACL is a *stateless* firewall at the *subnet* level

*Security group* has an **implicit Deny** rule at the end. There is no explicit deny rule configurable.
*NACL* has an **explicit Deny** rule at the end.

In *Security group* only **allow** rules can be set.
In *NACL* both **allow** and **deny** rules can be set.
# VPC Peering
Connection between VPCs in one, or different regions or even accounts using AWS global network - not through the Internet using private IPv4 or IPv6 addresses.
I does not allow *transitive peering* i.e. peering doesn't happen via a VPC to another. For each two VPCs a VPC peering is needed

# VPC Endpoints
Connecting private AWS services to the ones in the public domain

**VPC Gateway Endpoint**:  
- 
- not billed

**VPC Interface Endpoint**: 
- Connecting to
- Uses an *Endpoint ENI* 
- billed

| Gateway Endpoints                     | Interface Endpoints                     |
| ------------------------------------- | --------------------------------------- |
| limited to *S3*, and *Dynamo DB* only | most AWS services                       |
|                                       | Uses and *Endpoint ENI*                 |
| Uses S3 public IP                     | Uses private IP from VPC to AWS service |
| Uses same S3 DNS name                 | requires endpoint-specific S3 DNS names |
| Cross-region access *not allowed*     | Cross region *allowed*                  |
| Association on VPC level              | Association on subnet level             |
| not billed                            | billed                                  |
| No access from on-premises            | Access from on-premises                 |
| Can be secures with IAM policies      |                                         |


# Client VPN
#vpn 

# Site-to-Site VPN
#vpn
*Virtual Private Gateway (VGW)* at AWS side
*Customer Gateway* at customer's end

# VPN CloudHub
#cloud_hub
An architectural pattern for site-to-site VPN
A hub & spoke model
Each customer site has a **BGP ASN** (Border Gateway Protocol - Autonomous System Number)
Each site uses a *Customer Router* to connect to the AWS VPN
Uses *IPSec* VPN

# Direct Connect (DX)
#direct_connect #dx
When a physical AWS devices exist in the same datacenter as the customer - a *DX Connect location*. This can then relay traffic between the customer site and AWS.
Customer Router is needed at customer's end, and Virtual Private Gateway (VGW) at AWS.
A private VIF (Virtual Interface) is used to send traffic between VGW and Customer Router, which connects to a single VPC.
a public VIF is needed to connect to AWS public services, otherwise with private VIF only services in your VPC will be accessible.
A *hosted VIF* can be shared with another AWS account.
Via AWS Partner Network (APN) can provide speed from 50-500 Mbps
100 Gbps in limited locations
DX connections are not encrypted. Site-to-site (S2S) VPN is needed if encryption is needed.

# Direct Connect Gateway
#direct_connect_gateway
When customer sites are at different geographical locations.
DX Gateway can connect to multiple private VIFs.
You cannot route site traffics to each other.

# Transit Gateway (TGW)
#transit_gateway #tgw
A hub to connect VPCs without having to set up a VPC peering between each two sites
**Transit VIF** used to connect DX gateway to a transit gateway

# Using IPv6 in a VPC
AWS assigns a `/56` IPv6 range to a VPC 
and assigns `/64` range to subnets: 
- `2406:da1c:f7b:ae00` to `ff` for subnets

*Egress-only Internet Gateway* for IPv6 acts like a private subnet with a NAT gateway for IPv4

# Flow Logs
#flow_logs
*VPC*, *subnet* or *interface*-level network traffic that can be stored in CloudWatch or S3

# Cheat Sheets
[Amazon VPC Cheat Sheet](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/networking-and-content-delivery/amazon-vpc/)
[AWS Direct Connect Cheat Sheet](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/networking-and-content-delivery/aws-direct-connect/)
