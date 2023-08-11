# REDIS Commands

>	-	*Online resource: https://redis.io/documentation*
>	-	*Free Redis Desktop Manager: https://redis-desktop-manager.software.informer.com/*
## Overview
-   Overview of the server
    -   `INFO ALL`
-   Overview of memory
    -   `INFO MEMORY`	
## Databases
There are 16 databases in a common Redis server: 0 to 15
-   Overview of all databases
    -   `INFO KEYSPACE`
-   Select database 0
    -   `SELECT 0`
-   Number of keys in current database
	-	`dbsize`

## Keys

-   Get a list of keys:
    -   `SCAN 0`
-   Get a list of keys starting from cursor position of 0, keys matching pattern * i.e. anything, no more than 100 keys:
	-   `SCAN 0 MATCH * COUNT 100`
-   Get keys matching a pattern:
    -   e.g. `KEYS <key_prefix>*`
-   Check if key exists
    -   `EXISTS <key>`
-   Get object type
	-	`type <key>`
    -	`OBJECT ENCODING <key>`
-   Get key's seconds remaining to expire
	-	`TTL <key>`
-   Get key's idle time
	-	`OBJECT IDLETIME <key>`

## Hashtables

- Get key, values or both inside a Hashtable
    -   `HGETALL <key>`
    -   `HKEYS <key>`
    -   `HVALS <key>`
    -   `HLEN <key>`
- Get all, with definition of cursor position and count
    -   `HSCAN <key> 0 COUNT 100`