---
aliases: Docker containers and ECS
tags:
  - tech
  - cloud 
  - aws 
  - docker
  - ecs
  - eks
author: Mehdi N Tehrani
creat_date: 2023-10-21
category: Cloud
subcategory: Containers
---

# Definitions
- Task
- Service
# Auto scaling
#auto_scaling
## Service auto scaling
adjusts number of tasks
### Policies
1. **Target Tracking**: based on a target value for a specific CloudWatch metric
2. **Step scaling**: in response to CloudWatch alarms
3. **Scheduled scaling**: based on date and time
## Cluster auto scaling
uses a *Capacity Provider* to scale to the number of *EC2* instances using EC2 auto scaling
A capacity provider can be associated with an *Auto Scaling Group (ASG)* #asg
ASG can scale using:
- **Managed scaling**: automatically-created scaling policy on ASG
- **Managed instance termination protection**: enables container-aware termination of instances in teh ASG when scaling happens
# 