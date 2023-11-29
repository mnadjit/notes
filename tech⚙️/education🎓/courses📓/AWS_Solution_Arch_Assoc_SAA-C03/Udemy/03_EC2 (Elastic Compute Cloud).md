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
#elastic_network_interface #eni
Basic type
## ENA
#elastic_network_adaptor #ena
Higher performance and lower latency
Must choose supported instance type
## EFA
#elastic_fabric_adaptor #efa
In addition to handling IP traffic, can support an access model commonly called *OS bypass* #os_bypass which allows the application (most commonly through some user-space middleware) access the network interface without having to get the operating system involved with each message.

Use cases:
- High Performance Computing (HPC) #hpc using message passing interface (MPI) #mpi
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

# Pricing Options
#ec2_pricing
- *On-Demand*: Standard rate
- *Reserved*: 1-3 year commitment
- *Spot Instances*: discount up to 90% for unused capacity. Can be terminated at any time.
- *Dedicated Instances*: Physical isolation at the host hardware level
- *Dedicated Hosts*: Physical server dedicated. Socket/Core visibility, host affinity; Workload with server-bound software licenses
- *Saving Plans*: 1-3 year commitment; Commitment to a consistent amount of usage (EC2 + Fargate + Lambda); pay by $/hour

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

# Cheat Sheets
[Amazon EC2 Cheat Sheet](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/compute/amazon-ec2/)
[Amazon VPC Cheat Sheet](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/networking-and-content-delivery/amazon-vpc/)
