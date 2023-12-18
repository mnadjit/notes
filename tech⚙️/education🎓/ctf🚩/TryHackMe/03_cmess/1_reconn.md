```
export IP=10.10.63.213; export MYIP=10.4.18.63
```
# nmap
```
PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 7.2p2 Ubuntu 4ubuntu2.8 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   2048 d9:b6:52:d3:93:9a:38:50:b4:23:3b:fd:21:0c:05:1f (RSA)
|   256 21:c3:6e:31:8b:85:22:8a:6d:72:86:8f:ae:64:66:2b (ECDSA)
|_  256 5b:b9:75:78:05:d7:ec:43:30:96:17:ff:c6:a8:6c:ed (ED25519)
80/tcp open  http    Apache httpd 2.4.18 ((Ubuntu))
|_http-generator: Gila CMS
|_http-server-header: Apache/2.4.18 (Ubuntu)
|_http-title: Site doesn't have a title (text/html; charset=UTF-8).
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
| http-robots.txt: 3 disallowed entries 
|_/src/ /themes/ /lib/
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel
```

# ffuf
```
$ ffuf -u "http://$IP/FUZZ" -w /usr/share/wordlists/dirb/common.txt 

                        [Status: 200, Size: 3874, Words: 522, Lines: 108, Duration: 792ms]
0                       [Status: 200, Size: 3860, Words: 522, Lines: 108, Duration: 277ms]
01                      [Status: 200, Size: 4090, Words: 431, Lines: 103, Duration: 408ms]
1                       [Status: 200, Size: 4090, Words: 431, Lines: 103, Duration: 298ms]
1x1                     [Status: 200, Size: 4090, Words: 431, Lines: 103, Duration: 293ms]
.hta                    [Status: 403, Size: 277, Words: 20, Lines: 10, Duration: 4926ms]
.htpasswd               [Status: 403, Size: 277, Words: 20, Lines: 10, Duration: 4936ms]
.htaccess               [Status: 403, Size: 277, Words: 20, Lines: 10, Duration: 4969ms]
About                   [Status: 200, Size: 3345, Words: 372, Lines: 93, Duration: 281ms]
about                   [Status: 200, Size: 3359, Words: 372, Lines: 93, Duration: 304ms]
admin                   [Status: 200, Size: 1583, Words: 377, Lines: 42, Duration: 281ms]
api                     [Status: 200, Size: 0, Words: 1, Lines: 1, Duration: 276ms]
assets                  [Status: 301, Size: 324, Words: 20, Lines: 10, Duration: 279ms]
author                  [Status: 200, Size: 3599, Words: 419, Lines: 102, Duration: 278ms]
blog                    [Status: 200, Size: 3860, Words: 522, Lines: 108, Duration: 282ms]
category                [Status: 200, Size: 3871, Words: 522, Lines: 110, Duration: 287ms]
cm                      [Status: 500, Size: 0, Words: 1, Lines: 1, Duration: 278ms]
feed                    [Status: 200, Size: 735, Words: 37, Lines: 22, Duration: 278ms]
fm                      [Status: 200, Size: 0, Words: 1, Lines: 1, Duration: 274ms]
index                   [Status: 200, Size: 3860, Words: 522, Lines: 108, Duration: 280ms]
Index                   [Status: 200, Size: 3860, Words: 522, Lines: 108, Duration: 280ms]
lib                     [Status: 301, Size: 318, Words: 20, Lines: 10, Duration: 276ms]
log                     [Status: 301, Size: 318, Words: 20, Lines: 10, Duration: 274ms]
login                   [Status: 200, Size: 1583, Words: 377, Lines: 42, Duration: 277ms]
robots.txt              [Status: 200, Size: 65, Words: 5, Lines: 5, Duration: 326ms]
search                  [Status: 200, Size: 3860, Words: 522, Lines: 108, Duration: 280ms]
Search                  [Status: 200, Size: 3860, Words: 522, Lines: 108, Duration: 279ms]
server-status           [Status: 403, Size: 277, Words: 20, Lines: 10, Duration: 273ms]
sites                   [Status: 301, Size: 322, Words: 20, Lines: 10, Duration: 274ms]
src                     [Status: 301, Size: 318, Words: 20, Lines: 10, Duration: 272ms]
tag                     [Status: 200, Size: 3883, Words: 523, Lines: 110, Duration: 278ms]
tags                    [Status: 200, Size: 3145, Words: 337, Lines: 85, Duration: 279ms]
themes                  [Status: 301, Size: 324, Words: 20, Lines: 10, Duration: 271ms]
tmp                     [Status: 301, Size: 318, Words: 20, Lines: 10, Duration: 275ms]

```