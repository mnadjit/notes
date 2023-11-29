---
aliases:
  - AWS DNS, Caching, and Performance Optimization
tags:
  - tech
  - cloud
  - aws
  - dns
  - caching
  - performance_optimization
author: Mehdi N Tehrani
creat_date: 2023-11-11
category: Cloud
subcategory: AWS DNS and performance
---

# DNS and Route 53
#route_53


# Route 53 Hosted Zones
Contains DNS records
For private hosted zones, associate VPC with Route 53, and enable *DNS Hostnames* and *DNS Resolution*
## Migrate to/from Route 53
- migrate from another DNS provider and import records
- migrate hosted zones to another AWS account
- migrate from Route 53 to another registrar
- Associate a hosted zone with a **VPC in another account**
	- Authorize association with VPC in the second account
	- Create an association in the second account
# Route 53 Routing Policies
![[Route53_Routing_Policies.png]]
## Simple Routing Policy
A record for one or multiple IP addresses
- *TTL*: how long before client makes another DNS query
## Weighted Routing Policy
- *Health*: ID for health checking to make sure targets are available; optional
- *Weight*: commonly between 0-255
## Latency Routing Policy
Based on region

## Failover Routing Policy
Primary
Secondary
## Geolocation Routing Policy
Multiple records for the same domain name
Based on where the DNS query is coming from 
## Multi-value Routing Policy
Acts as a load balancer
Return healthy records only
## Geoproximity Routing Policy
Uses *Traffic Flow*
Requires a policy is *Traffic Flow* to use this routing policy
Based on a geographical coordinate can route to certain endpoints
- CloudFront
- Elastic Beanstalk
- ELB
- S3
- IP addresses
## IP-based Routing Policy
CIDR collections are used to define IP addresses and CIDR blocks

# Route 53 Resolver
## Outbound Endpoint
Used when AWS resources want to access hosts in corporate's network
## Inbound Endpoint
Used when hosts in corporate's network want to access AWS resources

# CloudFront Origin and Distributions
#cloudfront
- *Origin*: the region where the data is stored. 
- *Edge Locations*: hundreds of them across the world. Users automatically get directed to the closest edge location. From this point the traffic travels via AWS Global Network.
- *Distribution*: what you create in CloudFront. 
	- Web Distribution:
		- Speeds up distribution of static and dynamic content e.g. html, css, php, etc.
		- Distributes media files using http or https
		- Add, update, delete objects and submit data from web forms
		- Use live streaming to stream and event in real time
	- Behaviors:
		- Path pattern
		- Viewer protocol policy
		- Cache policy
		- Origin request policy
Behaviour Example:
![[CloudFront_Cache_Behaviour.png]]

# CloudFront Caching and Behaviours
## Regional Edge Cache
There are **12** *Regional Edge Caches* worldwide as of 2022-23
There are **210** *Edge Location*s

*Cache MISS*: if object is not found in the cache 
*Cache HIT*: if object is found in the cache
*TTL*: default 24 hours. Can be different for various file types
Headers can be used to control the cache: `Cache-control max-age=<time_seconds>` and `Expires`

## Caching based on Request Headers
- CloudFront can be configured to forward *headers* in the *viewer request* to the *origin*
- CF can then cache multiple versions of an object based on values in one or more headers
- Controlled in a behaviour to do one of the following:
	- Forward *all headers* to origin - objects are **not** cached
	- Forward a *whitelist of headers* to origin
	- Forward only the *default headers* to origin - caching will disregard request headers

# CloudFront Signed URLs
Signed URLs provide more control over access to content
Signed URLs should be used for *individual* files and clients that do not use cookies

Signed Cookies: When don't want to change URLs or provide access to *multiple* restricted files

# OAI/OAC
#oai #origin_access_identity
OAI is a type of user - it is deprecated.  
Bucket policy only allows certain OAIs which are like user accounts in a *Distribution*
- Principal is `"AWS": "arn:aws:iam:cloudfront:user/CloudFront Origin Access Identity xxxxxxxxxxxxxx"`
Only used for S3

#oac #origin_access_control 
Similar to OAI in terms of function, and also uses bucket policy but 
- *Principal* is `"Service": "CloudFront.amazonaws.com"`
- *Condition* is `"Condition": { "StringEquals": { "AWS:SourceArn": "arn:aws:cloudfront::<account>:distribution/xxxxxxxxx" } }`

# CloudFront SSL/TLS and SNI
#server_name_indication #sni
Certificate in ACM should be issued in region *us-east-1* as CloudFront is a global service
*Viewer Protocol*: How distribution should connect with the viewer. 
- HTTP redirect to HTTPS
- HTTPS only
- HTTP and HTTPS
*Origin Protocol*

**SNI**: With SNI, multiple TLS certificates with different domain names can share a single IP address.

# Lambda@Edge
#lambda_at_edge
**NodeJS** or **Python** lambda function processing the data at certain points:
- Viewer Request: *After* CF receives request from *viewer* - before caching in CF
- Origin Request: *Before* CF forwards the request to *origin* - after caching in CF
- Origin Response: *After* CF receives response from *origin* - before caching in CF
- Viewer Response: *Before* CF forwards response to *viewer* - after caching in CF

# Global Accelerator
#global_accelerator #ga 
Can act as a load balancer at the global level across multiple regions.
When users try to access the domain, Route 53 returns a pair of *anycast* IP addresses that are associated with the configured global accelerator. The user request first get redirected to the closest edge location and from there via AWS global network to the global accelerator. Then based on the *endpoint group*s configured in the global accelerator, the traffic is sent to the closest healthy region.

*Anycast*, also known as *IP Anycast* or Anycast routing, is **an IP network addressing scheme that allows multiple servers to share the same IP address**, allowing for multiple physical destination servers to be logically identified by a single IP address.

![[Global_Accelerator.png]]

# Cheat Sheets
[Amazon Route 53 Cheat Sheet](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/networking-and-content-delivery/amazon-route-53/)
[Amazon CloudFront Cheat Sheet](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/networking-and-content-delivery/amazon-cloudfront/)
[AWS Global Accelerator Cheat Sheet](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/networking-and-content-delivery/aws-global-accelerator/)
