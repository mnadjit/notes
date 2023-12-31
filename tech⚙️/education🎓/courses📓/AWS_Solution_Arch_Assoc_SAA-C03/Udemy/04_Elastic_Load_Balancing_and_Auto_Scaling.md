---
aliases:
  - AWS Elastic Load Balancing and Auto Scaling
tags:
  - tech
  - cloud
  - aws
  - load_balancing
  - auto_scaling
author: Mehdi N Tehrani
creat_date: 2023-10-01
category: Cloud
subcategory: AWS Load Balancing
---

# Scaling Concepts
Scale *up*: **Vertical** scaling - *specs*
Scale *out*: **Horizontal** scaling - *number*

# EC2 Auto Scaling
#auto_scaling #asg 
Auto-scaling groups (ASG): collection of EC2 instances
Based on *Status Changes* or *EC2 metrics*
*Launch Template*: Configuration of EC2 instances launched in the ASG
ASG is limited to a VPC
Can configure health checks:
- Status checks
- ELB health checks in addition(recommended if ELB is used)
- Grace period: how long to wait before doing health checks
## ASG health checks
Group metrics
Delivered to CloudWatch in 1-minute granularity
No charge
## Basic Monitoring
Related to EC2 instances
5-min granularity
No charge
## Detailed Monitoring
Related to EC2 instances
1-min granularity
Charged
## Cooldowns
#cooldowns
used in simple scaling to prevent auto scaling from launching or terminating before the effects of the previous activities are visible. Default 5 minutes.
## Termination Policy
which instances to terminate first
## Termination Protection
## Standby state
#ec2_state #standby #inservice
EC2 instance `InService` and `Standby` states
Used for troubleshooting
## Lifecycle hooks
custom actions in case of a certain state
# Load balancing and high availability
#load_balancing #high_availability


# Types of Elastic Load Balancer
#alb 
## Application Load Balancer
Works at level 7
Path-based routing:
- host-based
- query string
- source IP
Supported targets:
- EC2 Instances
- IP addresses
- Lambdas
- Containers
## Network Load Balancer
#nlb
Works at layer 4
Supported protocols:
- TCP
- UDP
- TLS
- TCP_UDP
Supported targets:
- IP address
- EC2 instance

NLB nodes can have elastic IPs in each subnet 

![[NLB_vs_ALB.png|800]]
## Classic Load Balancer
#clb
not recommended
works at layer 4 and 7

## Gateway Load Balances
#glb #gateway_load_balancer
Used in front of virtual appliances: 
- Next Generation Firewalls, WAFs, IDS/IPS devices, DDoS prevention systems, and deep packet inspection systems
operates at layer 3
Exchanges traffic with the virtual appliances using the *GENEVE* protocol on port `6081` #geneve_protocol

# EC2 Scaling Policies
## Dynamic Scaling
- *Target Tracking* scaling: Uses *ASG* CloudWatch metrics such as **ASGAverageCPUUtilization**. More finely tunable than simple scaling. 
- *Simple* scaling: Uses *instance* CloudWatch alarm. When it is breached, an action is taken. 
- *Step* scaling: Size of the alarm breach impacts the size of the response.
## Scheduled scaling
## Predictive scaling

# Cross-zone Load Balancing
When enabled, each load balancer *node* tries to distribute the load *evenly* across *instances in all registered availability zones*.
When disabled, each load balancer *node* only distributes the load evenly across instances in *its own* availability zone.
With ALB this is always enabled.
For NLB and GLB by default is disabled.

# Session state and Session stickiness
#session_state #session_stickiness
## Session State
Session data stored in an external service:
- DynamoDB
- ElastiCache #elasti_cache
- S3
## Sticky Sessions
Cookie is generated by an instance and client is bound to that instance for *cookie lifetime*

**Can also use both**: Some data stored in an external service, some data locally with sticky sessions enabled.

How to enable sticky sessions:
Target Group > Attributes > 
- Stickiness
	- *Load balancer generated cookie*: Cookie name is always **AWSALB** - not suitable with multiple ALB solutions
	- *Application-based cookie*: can determine different cookie name per target group
- Load balancing algorithm
	- *Round robin*
	- *Least outstanding request*
# Secure Listeners for ELB
#secure_listeners #elb
SSL/TLS termination
With NLB it can be terminated at NLB, or the encryption to terminate at NLB and another encryption between NLB and server
With ALB TLS terminates at ALB, and another encryption is established with the server if needed

## Group-level stickiness
#group_level_stickiness
similar to session stickiness but at target group level for TLS
# Cheat Sheets
[Elastic Load Balancing Cheat Sheet](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/compute/elastic-load-balancing/)
[Amazon EC2 Auto Scaling Cheat Sheet](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/compute/aws-auto-scaling/)
