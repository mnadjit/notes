---
aliases:
  - AWS EC2
tags:
  - tech
  - cloud
  - aws
author: Mehdi N Tehrani
creat_date: 2023-10-01
category: Cloud
subcategory: AWS EC2 (Compute)
---

# Placement Groups
## Cluster
Instances as close as possible to each other. Optimized for High performance Computing use cases.
## Partition
## Spread
Each instance in a separate rack at an AWS data centre
# Network Interfaces
## ENI
#elastic_network_interface
Basic type
## ENA
#elastic_network_adaptor
Higher performance and lower latency
Must choose supported instance type
## EFA
#elastic_fabric_adaptor
used for 
- High Performance Computing (HPC) #hpc 
- Message Parsing Interface (MPI) #message_parsing_interface
- Machine learning (ML) #machine_learning

# Elastic IP Address
#elastic_ip_address #eip
Static public IP address
EIP can be moved to a different AZ, but an ENI stays in a certain AZ and cannot be moved

# Bastion
#bastion #jumpbox #jumphost
an EC2 instance in public subnet used to access ec2 instances in private subnet
admin user can connect from Internet to bastion host, then connect via bastion host to the ec2 in private subnet
# NAT Gateway / NAT Instance
#nat_gateway #nat_instance
NAT Gateway is a managed service
NAT Instance is self-managed - it's an EC2 instance

## NAT Gateway
scalable up to 45 Gbps

# Nitro Instances
near bare-metal performance
improves security and performance

# Pricing Use Cases
## On-Demand
use for a certain period of time without interruption
## Reserved
critical business use case without interruption
## Scheduled Reserved
getting deprecated
## Spot Instances
distributed system which *can* withstand interruption - low cost
## Dedicated Instances
Security-sensitive app requires dedicated hardware; per-instance billing
## Dedicated Hosts
e.g. database with per-socket licensing