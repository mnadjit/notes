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
# Elastic Kubernetes Service (EKS)
#eks #kubertnetes
Features
- Hybrid Deployment
- Batch processing
- Machine learning: *Kubeflow*
- Web applications

EKS supports load balancing with ALB, NLB and CLB
**Pod**: a group of containers

## Auto scaling
### Vertical scaling
adjust specs of each pod
### Horizontal scaling
number of pods
### Workload Auto Scaling
1. Kubernetes *Cluster* Auto-scaler: uses AWS scaling groups 
2. *Karpenter* open source autoscaling project: works directly with EC2 fleet
#karpenter
## Load Balancing
#load_balancing
The AWS *Load Balancer Controller* manages AWS Elastic Load Balancers for Kubernetes cluster
Install AWS LB Controller using *Helm V3* or later, or by applying a Kubernetes manifest
LB Controller provisions the following resources:
- *ALB*: when you create a Kubernetes Ingress
- *NLB*: when you create a Kubernetes service of type *Load Balancer*
With AWS LB controller version 2.3.0 or later, you can create NLBs using either target type i.e. *instance* or *IP* target type

## EKS Distro
A distribution of Kubernetes with the same dependencies as Amazon EKS
Allows you to manually run Kubernetes clusters anywhere
Include binaries and containers of open-source Kubernetes, etcd, networking, and storage plugins, tested for compatibility
## ECS Anywhere / EKS Anywhere
Run ECS or EKS on customer-managed infrastructure, supported by AWS - *not Amazon Outpost*
Can also be run on VMWare

# Elastic Container Registry (ECR)
#ecr #oci #open_container_initiative
Supports *Open Container Initiative (OCI)* and *Docker Registry HTTP API V2* standards
Images stored in S3's

Features:
- *Lifecycle policies*
- *Image Scanning*: identify vulnerabilities
- *Cross-region and cross-account replication*
- *Pull through cache rules*: cache repos in remote public registries in your private ECR

Push image to ECR:
```sh
# Authenticate the docker client to ECR
aws ecr get-login-password --region $region | docker login --username AWS --password-stdin \
"($aws_account_id).dkr.ecr.($region).amazonaws.com"

# tag the image
docker tag "($image_name):($tag_name)" "($aws_account_id).dkr.ecr.($region).amazonaws.com/($image_name):($tag_name)"

# push image to ECR
docker push "($aws_account_id).dkr.ecr.($region).amazonaws.com/($image_name):($tag_name)"
```

# AWS App Runner
#app_runner
fully managed service for deploying containerized web apps and APIs
PaaS solution with all components managed
Similar to *Elastic Bean Stalk* but focused on web apps and APIs

```sh
aws apprunner create-service --service-name $my_service_name --source-configuration \
'{"ImageRepository": \
	{ "ImageIdentifier: ($aws_account_id).dkr.ecr.($region).amazonaws.com/($image_name):($tag_name)" } \
}'
```
This will give you a URL which you can access your web app or API. There's no visibility over the details.
