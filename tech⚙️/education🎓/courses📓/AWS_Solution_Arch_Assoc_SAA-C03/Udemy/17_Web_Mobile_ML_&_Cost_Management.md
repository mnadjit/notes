---
aliases: AWS Web, Mobile, Machine Learning, and Cost Management
tags:
  - tech
  - cloud
  - aws
  - web
  - mobile
  - meachine_learning
  - ml
  - cost_management
author: Mehdi N Tehrani
creat_date: 2023-11-15
category: Cloud
subcategory: AWS Misc
---

# AWS Amplify and AppSync
#amplify #appsync
**Amplify**: tools to build full-stack web and mobile apps 
**Amplify Studio**: to build web and mobile apps
- Can easily add AWS services not available within Amplify Studio using CDK #cdk 
- Connect mobile and web apps using Amplify Libraries for iOS, Anfroid, Flutter, React Native, and web (JavaScript)
**AWS Amplify Hosting**: fully managed CI/CD and hosting service

**AppSync**: fully managed service to develop *GraphQL* APIs. It also auto-scales.
Supports Lambda, DynamoDB, and Elasticsearch
Server-side data caching

# AWS Device Farm
#device_farm
App testing suite for web and mobile apps

# Machine Learning Services
#machine_learning #ml
## Rekognition
#rekognition
face, object, celebrity recognition on video and images
Can process videos in S3 and publish to an SNS topic
## Transcribe
#transcribe
Speech to text 
Uses deep learning called ASR (Automatic Speech Recognition) #asr #automatic_speech_recognition
## Transcode
#transcode
Convert video files to various formats / outputs
- WebM (VP8/VP9) input and output
- animated GIF output
- MP3, FLAC, Vorbix, and WAV audio-only output
## Elemental MediaConvert
#elemental_mediaconvert
Similar to Transcode but with more functionalities
## Translate
#translate
Neural machine translation service, can be used to localize web or app content
## Textract
#textract
Extract text from images. OCR and AI tools
Handwriting and printer. Extracts data from PDF, image, form and table and understands context
## SageMaker
#sagemaker
Prepare, build, train, and deploy high-quality machine learning models
## Comprehend
#comprehend
Natural-language Processing (NLP) service
#nlp #natural_language_processing
Uses ML to uncover information in unstructured data
## Lex
#lex
Conversational AI chatbots - voice or text
## Polly
#polly
Turns text into lifelike speech - TTS (Text to Speech) #tts #text_to_speech
## Forecast
Time-series forecasting service
## DevOps Guru
Cloud operations service for improving application *operational performance* and *availability*
Detects behaviors that deviate from normal operating patterns and can resolve issues
Elastically scale operational analytics
Uses ML to reduce alarm noise

# License Manager
#license_manager
Manage license from software vendors and track license usage by
- Virtual Cores (vCPU)
- Cores
- Sockets
- number of machines
Distribute, activate and track software licenses across accounts and throughout an organization
Enforce limites across multiple regions

# Compute Optimizer
#compute_optimizer
recommends optimal AWS resources to improve perf and reduce cost
Uses ML to analyze historical usage metrics in CloudWatch
- EC2
- EBS volumes
- Lambda functions

# Cost Management

## Budgets
#budgets

## Cost Explorer
#cost_explorer
Cost data for last 13 months and forecast spending over next 3 months
## Cost and Usage Report
publish AWS billing reports to S3
Update the report up to 3 times a day
Create, Retrieve, and delete reports using AWS *CUR API reference* #cur_api_reference
## Price List API
Query the prices of AWS services
- **Price List Service API** (Query API): query with *JSON*
- **AWS Price List API** (Bulk API): query with *HTML*
Can send alerts with SNS
## Cost Allocation Tags
Use resource tags to categorize costs based on these tags
Two types:
- AWS assigned
- User-defined 
