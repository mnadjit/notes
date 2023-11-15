---
aliases: AWS Databases and Analytics
tags:
  - tech
  - cloud
  - aws
  - database
  - db
  - analytics
author: Mehdi N Tehrani
creat_date: 2023-11-07
category: Cloud
subcategory: AWS Databases
---

# Types of Databases
## Relational/Non-Relational
### Relational
- RDS
	- SQL Server
	- Oracle
	- MySQL
	- PostgresSQL
	- Aurora
	- MariaDB
- IBM DB2
### No-SQL
- Dynamo DB
- Mongo DB
- Redis
- Neo3j
- Cassandra
- HBase
## Operational/Analytical
### Operational
OLTP #oltp: Online Transaction processing
Relational: *RDS*, *Oracle*, *IBM DB2*, *MySQL*
Non-Relational: *MongoDB*, *Cassandra*, *Neo4j*, *HBase* 
### Analytical
OLAP #olap: Online Analytics Processing
Relational: *Redshift*, *Teradata*, *HP Vertica*
Non-Relational: *Amazon EMR*, *MapReduce* 

## Amazon Databases
### DBs on EC2
Any 3rd party database with full control 
### RDS
### DynamoDB
NoSQL, in-memory performance, High I/O needs, Dynamic scaling
### RedShift
Data WareHouse
### ElastiCache
### EMR
Analytics on *Hadoop* framework

# Relational Database Service (RDS)
#rds 
## Scale up
Add more resources to EC2 instance hosting RDS
## Disaster Recovery and Horizontal Scaling (Scaling out)
- RDS Master
- RDS Standby: Creates a *Multi-AZ* disaster recovery node 
#multi_az
- RDS Read Replica

![[RDS_Disaster_Recovery.png]]

# RDS Backup and Recovery
## Automatic
DB snapshot is stored in S3 bucket.
Restore can be to any point in time during the *retention period*.
Retention period 0-35 days
## Manual
Single-AZ DB instances can experience brief suspension of I/O
For Multi-AZ **SQL Server**, suspension of primary db I/O activity
For Multi-AZ **Maria DB**, **MySQL**, **Oracle**, and **PostgreSQL** snapshot is taken from standby instance, so no suspension of I/O
Snapshots do not expire

## Maintenance Window
Default is weekly for 30 minutes

# RDS Security
#rds_security #security
RDS can be publicly available
Use separate *Security Group* for RDS db rather than the default SG
Enable SSL/TLS for encryption in transit for app connection to db
*RDS Encryption*: encryption at rest for EBS volume and any snapshots using AES-256
Encryption can be enabled at time of creation and cannot be changed after
Snapshot can be copied, encrypted, and new volume be restored from encrypted snapshot to create an encrypted db

# Amazon Aurora
#aurora
Supported Engines
- MySQL (Aurora 5 times faster than MySQL)
- PostgreSQL (Aurora 3 times faster than PostgreSQL)
Distributed, fault-tolerant, self-healing storage system that auto-scales up to 128 TB per db instance
- Replicas (up to 15 in region) can be in same or multiple AZs, but in the same region
	- Fault-tolerant by storing data across 3 AZs
	- Only *primary* node *writes* to all data storages, but primary and replicas can read from data storages
	- *Auto-scaling* can be implemented for replicas 
	- *MySQL Read Replicas*: can have cross-region cluster with read-scaling and failover target - up to 5 regions (each can have 15 Aurora replicas)
	- *Global Database*: Cross-region cluster with read-scaling. Can remove secondary and promote it. Keeps writable instance in one region. 
	- *Multi-Master*: Scales out writes across a region
	- *Serverless*: On-demand auto-scaling - does not support read replicas or public IPs (can only access through VPC or Direct Connect, **Not VPN**). Database gets instantiated when traffic flows, not before that.

![[Aurora_Replicas.png|800]]

## Aurora Fault Tolerance
![[Aurora_Fault_Tolerance.png|800]]
A single logical volume over-arches all physical volumes
Sub-10 ms replica lag
Can promote a replica to be primary
Can set priority (tiers) on replicas to control order of promotion
Can use auto-scaling to add replicas

## Aurora Global Database
Multiple regions, but writes happen in only one, and the gets replicated asynchronously to other region(s)

## Aurora Multi-Master
In a single region
All nodes can read and *write*
Only for MySQL
Can work with *Active-Active* and *Active-Passive* workloads
## Aurora Serverless
- **Router Fleet**: receive traffic from app server and control number of ACUs required
- **Aurora Capacity Unit** #acu: 2 GB of memory and relevant CPU - allocated based on traffic coming from router fleet
![[Aurora_Serverless.png|800]]
# RDS Proxy
#rds_proxy
Fully managed across multiple AZs
Increases scalability, fault-tolerance and security
Creates a pool of connection to the RDS DB
- Reduces stress on CPU and memory
- Shares infrequently used connections
- drives increased efficiency
- High availability with failover
- control authentication methods

# RDS Anti-patterns and alternatives
When not to use RDS:
- DB engine not supported: e.g. IBM DB2, or SAP HANA - use EC2
- require root access or full control, e.g. to install patches
- to store large objects: use S3
- Automated scalability: e.g. use DynamoDB
- Name/Value structure or not well-structured: e.g. use DynamoDB

# Amazon ElastiCache
#elasticache
In-memory db for caching
fully managed implementation of *REDIS* and *Memcached* 
runs on EC2


| Feature                         | Memcahced                  | Redis (non-clustered)                             | Redis (clustered)                                 |
| ------------------------------- | -------------------------- | ------------------------------------------------- | ------------------------------------------------- |
| Data persistence                | N                          | Y                                                 | Y                                                 |
| Data Types                      | Simple                     | Complex                                           | Complex                                           |
| Partitioning                    | Y                          | N                                                 | Y                                                 |
| Encryption                      | N                          | Y                                                 | Y                                                 |
| High Availability (replication) | N                          | Y                                                 | Y                                                 |
| Multi-AZ                        | No failover or replication | Auto-failover. Uses Read replicas (0-5 per shard) | Auto-failover. Uses Read replicas (0-5 per shard) |
| Scaling                         | up and out                 | up and out                                        | up and out                                        |
| Multi-threaded                  | Y                          | N                                                 | N                                                 |
| Backup and Restore              | No; and no snapshots       | Yes, automatic and manual snapshots               | Yes, automatic and manual snapshots               |

Use Cases:
- data fairly static and frequently used
- cache cheaper and faster than db query
- often for session state data; an alternative is *DynamoDB*
- Leaderboards across all users mobile apps
- Streaming data dashboards
## Scaling
### Memcached
#memcached
No shards. Data is partitioned but there are no replicas.
horizontally: add new nodes to a cluster
vertically: must create a *new cluster* manually
### Redis
#redis
#### Cluster mode disabled
#cluster_mode #shard
Only one shard (node group)
Add replica or change node type - creates a new cluster and migrates data
#### Cluster mode enabled
Multiple shards across one or multiple AZs
Each shard holds all of the data across a primary node and up to 5 replica nodes
- Online re-sharding to add or remove shards; vertical scaling to change node type 
- Offlien re-sharding to add or remove shards change node type or upgrade engine (more flexible)
# Amazon DynamoDB
#dynamo_db
*key/value* store and *document* store
**Push button Scaling**: Set the amount of scaling and without any downtime it gets set
- Read Capacity Units
- Write capacity Units
- TTL: No cost. Does not use Read/Write capacity units
Components
- **Tables**
- **Items**
- **Attributes**
	- *Partition key*: required for each table
	- *Sort key*
		- Together they form the *composite key*
	- Other attributes depending on the table use cases
- High **availability**: 4 9's; and 5 9's for global tables
- **Transaction** options: *strongly* consistent or *eventually* consistent reads, support for ACID transactions
- Backup: point-in-time recovery down to the second in last 35 days; on-demand backup an restore

## Streams
Captures a time-ordered sequence of item-level modifications in a DynamoDB table and durably stores the info for 24 hours. Often used with Lambda and *Kinesis Client Library* (KCL). #kcl #kinesis_client_library
Configurable using the following:
- *KEYS_ONLY*
- *NEW_IMAGE*: the entire item after it was modified
- *OLD_IMAGE*: the entire item before it was modified
- *NEW_AND_OLD_IMAGES*: both
## DynamoDB Accelerator (DAX)
#dax
Fully managed In-memory cache for DynamoDB that reduces latency from milliseconds down to microseconds
Can enhance both read and write calls
no need to modify application logic to use DAX
**DAX** needs port **8001** to be open. *DynamoDB* needs port *8000* to be open.
DAX needs an IAM role to access DynamoDB
EC2 instance accessing DynamoDB via DAX needs an IAM policy to allow it access to both DAX and DynamoDB

## Global Tables
#global_tables
Fully managed multi-region multi-master (multi-active) solution
Replicating a DynamoDB table across multiple regions asynchronously. 
Relies on DynamoDB Streams. Default configuration is *OLD_AND_NEW_IMAGES*
Multi-active means you can *write* to them all as well as read
Failover needs to be set in application logic

# RedShift
#red_shift
Fast fully-managed SQL  *Data Warehouse* solution
Used for *OLAP* use cases
Deployed on *EC2*
Always keeps *three copies* of your data
provides *continuous* and *incremental* backups
Analytics tools can connect to RedShift using JDBC or ODBC connections
*RedShift Spectrum*: Allows SQL queries directly in a data lake in S3
*Exabyte* scale query capability

Business Intelligence services like *Amazon QuickSight* can access RedShift

# Elastic Map Reduce (EMR)
#emr
*Hadoop* is a framework for big data.
EMR is the managed implementation of Hadoop
Managed cluster platform that simplifies running big data frameworks including *Apache Hadoop* and *Apache Spark*
Can be used for data migration; transformation and moving large amounts of data; ETL functions
EMR runs within an AZ
Data store options:
- S3 / S3 Glacier
- RedShift
- DynamoDB
- RDS
- HDFS (Hadoop File System)
Optionally can use EBS volumes.
Cluster instances are used which can be scaled up and out
Root access to cluster instances is available

# Amazon Kinesis
#kinesis
A family of services
First *data streams* get ingested into **Amazon Kinesis Data Streams**
- Data can be analyzed in **Data Streams** 
- or be forwarded to **Amazon Kinesis Data Analytics**
	- Uses *Apache Flink* for data processing
	- then a lambda can process the data further and store in DynamoDB
- or be sent to **Amazon Kinesis Data Firehose**
	- Can be a destination to receive the stream data and store in S3, or RedShift
	- Data in S3 then can be queries using **Amazon Athena**

## Kinesis Data Streams
#kinesis_data_streams
data producers send data to Data Streams where is stored *in shards* for 24 hours (by default) and can be kept up to a year
Consumers then can consume the data in real-time - with ~200ms latency
> Number of shards need to be set based on the amount of data

### Kinesis Client Library (KCL)
#kcl #kinesis_client_library
helps you consume and process data from a Kinesis data stream
KCL enumerates shards and instantiates a *record processor* for each shard in manages
Runs on EC2
- Each *shard* is processed by one *KCL worker*
- Each *worker* has one *record processor*
- Each **worker** can process any number of **shards**
A partition key can be specified with `PutRecord` to group data by shard

## Kinesis Data Firehose
#kinesis_data_firehose #firehose
Producers send data to Data Firehose. It then *captures*, *transforms* and *loads* streaming data into a destination.
Supported destinations:
- RedShift, OpenSearch, S3, Splunk, Datadog, Honeycomb, Coralogix, LogicMonitor, Logz.io, MongoDB, New Relic, Sumo Logic, HTTP endpoints
There are *no shards*.
Completely automated; scalability is elastic
Near real-time delivery **~60 seconds* latency

## Kinesis Data Analytics
Provides real-time SQL processing for streaming data
Analytics for data from *Data Streams* and *Firehose*
Destination can be *Data Streams*, *Firehose* or *Lambda*

# Amazon Athena
#athena 
Run SQL queries against S3 and other data sources e.g. CloudWatch Logs, CloudWatch Metrics, Amazon DocumentDB, etc.
Can query data in following formats: *CSV*, *TSV*, *JSON*, *Apache Parquet*, and *ORC* formats
A *Lambda* function is needed to map the data so Athena can run SQL queries against the data
## Optimizing for performance
- *Partition* the data
- *Bucket* the data
- Use *compression*: either Apache parquet or Apache ORC
- optimize *file sizes*
- optimize *columnar data store generation*: Parquet and ORC are popular columnar data stores
- optimize *ORDER BY* and *GROUP BY*
- Use *approximate functions*
- Only include *required columns* 

# AWS Glue
#aws_glue
Fully managed ETL (Extract, Transform, Load)
#etl 
Used as a metadata catalog which prepares data for analytics
Can also use *Apache Hive*
Can help build tables in Athena
Runs ETL jobs on a fully managed scaled-out *Apache Spark* environment
Discovers data and stores the associated metadata in the catalog
Works with *data lakes* e.g. S3, *data warehouses* e.g. RedShift and *data stores* e.g. RDS, EC2 dbs
Can use *crawler* to populate Glue catalog with tables
- can crawl multiple data stores in one run
- when done, creates or updates one or more tables in catalog

# OpenSearch
#open_search #elastic_search
Successor to Amazon ElasticSearch; Based on opensource ElasticSearch solution
Fully managed distributed search service to *search*, *visualize* and *analyze* text and unstructured data
Petabyte scale
Scalable across AZs (*up to 3*) using replicas
Supports SQL syntax
Uses EC2 instances
Encryption *at rest* and *in transit*
A cluster is also known as **OpenSearch Service Domain**
Storage types: *UltraWarm* or *Cold*
Data can come from *Kinesis Firehose*, *Logstash*, or *Elasticsearch / Opensearch API* or multiple ones
Can use *Kibana* for search, visualize and analyze
It can be deployed inside a VPC
	- VPN or proxy would be needed for access
	- cannot use IP based access policies
	- Cannot switch from/to VPC to public
	- Cannot use a VPC with dedicated tenancy
	- Once deployed in a VPC can change security groups and subnets, but cannot be moved to another VPC
## ELK Stack
A popular combination of tools
Components:
- Elasticsearch
- Logstash
- Kibana
Use Cases:
- Visualizing Infrastructure and monitoring logs
- Troubleshooting
- Security analytics
## Access Control
- *Resource-based*
- *Identity-based*
- *IP-based* policies: cannot be used if deployed inside a VPC
- *Fine-grained*: 
	- role-based
	- security at index, document, and field level
	- OpenSearch dashboard multi-tenancy
	- HTTP basic authentication for *OpenSearch* and *OpenSearch Dashboards*

Authentication options:
- Federation using SAML
- Amazon Cognito and social IdPs

## Best practices
- Use 3 AZs
- provision instances in multiples of 3 for equal distribution across AZs
	- if 2 AZs available, use multiples of 2 for instances
- Use 3 dedicated master nodes
- Configure one replica for each index
- Apply restrictive access policies to the domain, or use fine-grained access policies
- Create domain inside a VPC
- For sensitive data enable *node-to-node encryption* and *encryption at rest*

# Other Database Services
## DocumentDB
MongoDB compatibility
stores *JSON* objects
Fully managed, storage automatically scales up to *64 TB*
**Throughput**: *millions of request per second* with up to *15* low-latency *replicas*
**Availability**: 4 9's
Stores *6* copies of data across *3* AZs
AWS Database Migration Service (DMS) #dms can be used to migrate from MongoDB

## Keyspaces
#keyspaces #apache_cassandra #cassandra
Apache Cassandra
Cassandra Query Language (CQL) #cql
Serverless and fully managed
Scales automatically in response to traffic
**Throughput**: *Thousands of requests per second*
**Latency**: single-digit milliseconds
**Availability**: 4 9's within a region

## Amazon Neptune
#neptune
Graph database for identity, knowledge, fraud graph etc.
Deploy high-performance graph apps using popular open-source APIs:
- Gremlin
- openCypher
- SPARQL
**Availability**: > 4 9's 
Storage is fault-tolerant and self-healing
DB volumes grow in *increments of 10 GB* up to max of *64 TB*  
Can create up to 15 replicas

## Quantum Ledger Database (QLDB)
#qldb #quantum_ledger_database
immutable
cryptographically verifiable transaction log (SHA-256)
serverless with automatic scalability
# Other Analytics Services
## Amazon Timestream
#timestream
Time series database service for used for IoT and operational applications
Faster and cheaper than relational dbs
moves older data to a cost-optimized storage
serverless with automatic scalability

## AWS Data Exchange
Data marketplace with over 3,000 products from 250+ providers
Supports Data Files, Data Tables and Data APIs
Consume directly into data lakes, apps, analytics, and machine learning models
Automatically export to S3
Query data tables with Data Exchange for RedShift
Use AWS-native authentication and governance, AWS SDKs, consistent API documentation
Benefits:
- Extensive Data Set selection
- Streamlines data procurement and governance
- Better Data Technology
- Ease of use for Data Analytics and Machine Learning

## AWS Data Pipeline
#data_pipeline
ETL service
data source can be on-premises
Result can be loaded into S3, DynamoDB and EMR

## AWS Lake Formation
Setup secure data lakes in days
Saved to S3 data lake
Then can be cleaned and classify data using ML algorithms
Security can be applied to column, row or cell
Data sets can then be used by *RedShift*, *Athena*, *EMR*, *Apache Spark*, and *Amazon QuickSight*
Lake Formation builds on capabilities available in *AWS Glue* 

### Data Warehouse vs Data Lake
| Characteristics   | Data Warehouse                                        | Data Lake                                                            |
| ----------------- | ----------------------------------------------------- | -------------------------------------------------------------------- |
| Data              | Structured                                            | Structured and non-structured                                        |
| Schema            | Schema on write (design prior to implementation)      | Schema on read                                                       |
| Price/Performance | Fastest query results using higher cost storage       | Query results getting faster using low-cost storage                  |
| Data Quality      | Highly curated data serve as central version of truth | Any data that may or may not be curated                              |
| Users             | Business Analysts                                     | Data scientists, data developers, business analysts                  |
| Analytics         | Batch reporting, BI and visualization                 | Machine learning, predictive analytics, data discovery and profiling |
|                   |                                                       |                                                                      |

## Managed Streaming for Apache Kafka (MSK)
#msk #managed_streaming_for_apache_kafka #kafka
Kafka is the open-source equivalent to Amazon *Kinesis*
Used for ingesting and processing stream of data in real-time
Fully managed
Provisions, configures, and maintains Kafka clusters and **ZooKeeper** nodes #zoo_keeper_nodes 
Security levels:
- VPC isolation
- IAM for API authorization
- Encryption at rest and in transit
- TLS-based certificate authentication
- SASL/SCRAM authentication secured by AWS Secrets Manager 
#sasl #scram


# Cheat Sheets
[Amazon RDS Cheat Sheet](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/database/amazon-rds/)
[Amazon Aurora Cheat Sheet](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/database/amazon-aurora/)
[Amazon DynamoDB Cheat Sheet](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/database/amazon-dynamodb/)
[Amazon ElastiCache Cheat Sheet](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/database/amazon-elasticache/)
[Amazon RedShift Cheat Sheet](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/database/amazon-redshift/)
[Amazon EMR Cheat Sheet](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/analytics/amazon-emr/)
[Amazon Kinesis Cheat Sheet](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/analytics/amazon-kinesis/)
[Amazon Athena Cheat Sheet](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/analytics/amazon-athena/)
[AWS Glue Cheat Sheet](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/analytics/aws-glue/)
