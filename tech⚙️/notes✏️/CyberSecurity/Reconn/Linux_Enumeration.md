---
aliases:
  - Linux Enumeration
tags:
  - tech
  - cybsec
  - linux
  - enumeration
author: Mehdi N Tehrani
creat_date: 2023-12-14
category: Cyber Security
subcategory: Linux Enum
---

# Linux enum script
```bash
function printheader() { 
    echo "####################################  $1  ######################################" 
}
function runcmd() { 
    echo -e "\n****************************\n $1 \n****************************\n"; bash -c "$1"; 
}

printheader 'HISTORY'
runcmd 'history'

runcmd 'date'

printheader 'USERS and GROUPS'
runcmd 'id'
#runcmd 'sudo -l'
runcmd 'who'
runcmd 'groups'

printheader 'OS'
runcmd 'uname -a'
runcmd 'cat /etc/os-release'
runcmd 'hostname'
runcmd 'ldd --version | head -n1'

printheader 'CREDENTIALS'
runcmd 'cat /etc/passwd'
runcmd 'cat /etc/shadow'

printheader 'PROCESSES'
runcmd 'ps aux'
runcmd 'crontab -l'

printheader 'NETWORK'
runcmd 'ip a'   # address
runcmd 'ip n'   # neighbour
runcmd 'ip r'   # route

runcmd 'netstat -a | grep -i listen'
```
