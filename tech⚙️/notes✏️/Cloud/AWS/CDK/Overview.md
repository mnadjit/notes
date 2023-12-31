---
aliases: AWS CDK (Cloud Development Kit) Overview
tags:
  - tech
  - cybsec
  - cloud
  - aws
  - cdk
  - infrastructure
  - iac
author: Mehdi N Tehrani
creat_date: 2023-09-25
category: aws
subcategory: cdk
---

# References
[Guide](https://docs.aws.amazon.com/cdk/v2/guide/home.html)
[Download](https://docs.aws.amazon.com/cdk/v2/guide/getting_started.html#getting_started_install)

[AWS CDK - Developer Guide](https://docs.aws.amazon.com/cdk/v2/guide/home.html)
[AWS CDK v2 - API Reference](https://docs.aws.amazon.com/cdk/api/v2/)

# Requirements
[Node JS](https://nodejs.org/en/download) #nodejs
[npm](https://docs.npmjs.com/) #npm
	- Upgrade npm to the latest version `npm install -g npm@latest`

# Bootstrap
#bootstrap #cdk_bootstrap
[Reference](https://www.go-on-aws.com/infrastructure-as-go/cdk-go/cdk-go-start/preparation/)
This is required for cdk to know to which account and region eventually deploy the stacks
```sh
cdk bootstrap aws://$account/$region
```
This will deploy a stack called *CDKToolkit*

# S3
[Set up S3 Bucket - Guide](https://towardsthecloud.com/aws-cdk-s3-bucket)
