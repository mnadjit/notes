---
aliases:
  - Kali Linux
tags:
  - tech
  - cybsec
  - certification
  - oscp
  - kali
author: Mehdi N Tehrani
creat_date: 2023-12-02
category: Cyber Security
subcategory: Offensive Security - OSCP
---
# File System
- find where in file system a file is located: `locate file`
	- needs to be run for a newly created file to be searchable by *locate* command: `updatedb`
- get all users: `cat /etc/passwd`
- find user password hash: `cat /etc/shadow`: 
# Users and Privileges
## Users
- add new user: `sudo adduser $username`
- get all users and their default shell: `cat /etc/passwd`
- what commands current user can run: `sudo -l`
## Groups
- get all groups: `group`
- find members of a group: `cat /etc/group | grep sudo`

# Network
- `ip a`: new way of doing `ifconfig`
- Find Neighbors:
	- `arp -a`
	- `ip n`
- get routes:
	- `ip r`
	- or `route`
# Services
## Python HTTP Server
```sh
python3 -m http.server 80
```

# Packages
[Github pimpmykali](https://github.com/Dewalt-arch/pimpmykali)

# Bash Scripting
```sh
#!/bin/bash

subnet=${1:?ERROR: subnet missing; Usage: ipsweep.sh class_c_subnet e.g. './ipsweep.sh 192.168.25'}

for i in {0..255..1}
do
    ping "$subnet.$i" -c 1 | grep 'bytes from' | cut -d ' ' -f 4 | tr -d ':' &
done

```