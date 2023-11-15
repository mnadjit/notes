---
aliases: AWS Monitoring Loggin and Auditing
tags:
  - tech
  - cloud
  - aws
  - monitor
  - log
  - audit
author: Mehdi N Tehrani
creat_date: 2023-11-13
category: Cloud
subcategory: AWS Monitor Log Audit
---

# CloudWatch
#cloudwatch
collects performance metrics and can automatically respond
Derives actionable Insights from logs
Get operational visibility and insight
Core features:
- *Metrics*: 
	- Standard Resolution: *one-minute* granularity
	- High Resolution: *one-second* granularity
- *Alarms*
	- Types:
		- Metric
		- Composite: uses a rule expression for multiple alarms
	- States
		- OK
		- ALARM
		- INSUFFICIENT_DATA
- *Logs*
- *Events*: stream of system events describing changes to AWS resources which can trigger actions
## Standard Monitoring
Default and Free
Sends EC2 metrics *every 5 minutes*
## Detailed Monitoring
Charged
Sends EC2 metrics *every 1 minute*


# CloudWatch Logs
Collects *system*, *application* logs and *custom metrics* from services
With *Unified CloudWatch Agent* these logs can even be collected from on-premises servers #unified_cloudwatch_agent
- System level logs like *memory* and *disk usage* can be collected with Unified CloudWatch Agent
With *Subscription Filters* the logs can be sent to lambda functions or ElasticSearch service for *real-time processing*

# CloudTrail
#cloudtrail
Log of API calls to AWS 
By default management logs stored for 90 days
- *CloudTrail Trail*: S3 bucket to store logs for longer
- Trail can be within a region or across regions
- CloudWatch Events can be hooked to CouldTrail logs
- *Log File Integrity Validation*: to make sure logs have not been tampered with
- Types of events:
	- *Management*
	- *Data Events*: more info about resource operations on or in a resource
	- *Insights Events*: identify and respond to unusual activities associated with write API calls

# EventBridge
#eventbridge
Used to be called CloudWatch Events
Event Source > Event > EventBridge Event Bus > Rules > Targets


# Metric Analysis and Tracing
## AWS X-Ray
#xray #x-ray
AWS services send trace data to X-Ray which processes data and generates *service map* and searchable trace summaries.
Can be used with apps running on *EC2*, *Lambda* and *Elastic Beanstalk*
Requires installation of *X-Ray agent* and integration of app with *X-Ray SDK* 
X-Ray agent captures metadata for requests made to *MySQL* and *PostgreSQL* dbs and DynamoDB
X-Ray agent captures metadata for requests made to *SQS* and *SNS*

## Grafana
Managed Grafana
Open-source monitoring and analytics solution for databases
Integrates with AWS SSO and SAML


## Prometheus
Managed Prometheus
open-source monitoring system and time series database
Use *PromQL* query to monitor and alert on performance of *containerized workloads*
Integrates with *EKS*, *ECS* and *AWS Distro* for *OpenTelemetry* #aws_distro #distro #open_telemetry


# Cheat Sheets
[Amazon CloudWatch](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/management-tools/amazon-cloudwatch/)
[AWS CloudTrail Cheat Sheet](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/management-tools/aws-cloudtrail/)