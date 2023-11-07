---
aliases: AWS Serverless Services
tags:
  - tech
  - cloud 
  - aws 
  - serverless
  - lambda
author: Mehdi N Tehrani
creat_date: 2023-11-05
category: Cloud
subcategory: AWS Serverless
---
# Serverless Services and Event-Driven Architecture
#event_driven_architecture


# Lambda
#lambda
## Use Cases
- Data processing
- real-time file processing
- real-time stream processing
- serverless back-end for web, mobile, IoT and 3rd party API requests

Methods to invoke Lambda Function:
- *Synchronous*: 
	- sources like **CLI**, **SDK**, **API gateway**
	- Client-side error handling like retries, exponential backoff, etc.
- *Asynchronous*: 
	- sources like **S3**, **SNS**, **CloudWatch**
	- Lambda retries up to 3 times
- *Event-source mapping*:  
	- sources like **SQS**, **Kinesis** data stream, **DynamoDB** streams
	- Lambda does the polling (polls the source)
	- Records are processed in order (except for SQS standard)

# Application Integration Services
#application_integration #integration
![[SQS_SNS_Kinesis.png]]
## Amazon Kinesis
#kinesis
A _Kinesis data stream_ is a set of [shards](https://docs.aws.amazon.com/streams/latest/dev/key-concepts.html#shard). Each shard has a sequence of data records. Each data record has a [sequence number](https://docs.aws.amazon.com/streams/latest/dev/key-concepts.html#sequence-number) that is assigned by Kinesis Data Streams. A _data record_ is the unit of data stored in a [Kinesis data stream](https://docs.aws.amazon.com/streams/latest/dev/key-concepts.html#stream). Data records are composed of a [sequence number](https://docs.aws.amazon.com/streams/latest/dev/key-concepts.html#sequence-number), a [partition key](https://docs.aws.amazon.com/streams/latest/dev/key-concepts.html#partition-key), and a data blob, which is an immutable sequence of bytes. Kinesis Data Streams does not inspect, interpret, or change the data in the blob in any way. A data blob can be up to 1 MB.
![[Amazon_Kinesis_Architecture.png]]
## Simple Workflow Service (SWF) 
#swf #simple_workflow_service
supports external processes or specialized execution logic

# SQS
#sqs
Decoupling of applications and functions
Queue types
- Standard: order not guaranteed
- FIFO
![[SQS_Queue_Types.png]]
## FIFO queue
require *Message Group ID* and *Message Deduplication ID*
## Dead letter queue
Not a queue type but a configuration. It's actually an error queue.
## Short/Long Polling
#short_polling #long_polling
**Short Polling**: the consumer checks a subset of servers and *may* or *may not* receive any messages
**Long Polling**: waits for *WaitTimeSeconds* and eliminates empty responses
- lowers cost
- can be enabled at API or queue levelusing *WaitTimeSeconds* param which can be between 0 (short polling) to 20 seconds

# SNS
#sns
A publisher-subscriber messaging service
Push-based
**Topic** is an access point for endpoints to dynamically subscribe for identical copies of the same notification
up to 10,000 topics
up to 10,000,000 subscribers

# Step Functions
#step_functions
used to build distributed apps as a series of steps in a visual workflow
Build and run state machines to execute the steps of the app
Define steps using *JSON-based Amazon States Language*
# EventBridge
#event_bridge
Event Sources:
- AWS services
- Custom apps
- SaaS apps
*Sources* generate events, event bridge receives them, processes events using *rules* and sends them to *target*s.

# API Gateway
#api_gateway
Rate limits:
- 10,000 per second per API
- 5,000 concurrent calls per AWS account
429 response status code is returned if either threshold is exceeded

# Cheat Sheets
[Lambda](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/compute/aws-lambda/)
[API Gateway](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/networking-and-content-delivery/amazon-api-gateway/)
[SNS](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/application-integration/amazon-sns/)
[SQS](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/application-integration/amazon-sqs/)
[SWF](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/application-integration/amazon-swf/)
[Amazon MQ](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/application-integration/amazon-mq/)
[Step Functions](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/application-integration/aws-step-functions/)
[CloudWatch](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/management-tools/amazon-cloudwatch/)
