---
aliases: AWS CloudFormation Overview
tags:
  - tech
  - cybsec
  - cloud
  - aws
  - cloudformation
  - infrastructure
author: Mehdi N Tehrani
creat_date: 2023-11-10
category: Cloud
subcategory: AWS CloudFormation
---

# Delete Stacks
#stack_delete
```powershell
$profile_name = ''

if ($profile_name -ne '') {
	$stacks = $(aws --profile $profile_name cloudformation describe-stacks) | ConvertFrom-Json

	$stacks.Stacks | % { $_.StackName }

	$stacks.Stacks | % { aws --profile $profile_name cloudformation update-termination-protection --stack-name $_.StackName --no-enable-termination-protection; aws --profile $profile_name cloudformation delete-stack --stack-name $_.StackName }
}
```