# nmap
```
PORT     STATE SERVICE VERSION
21/tcp   open  ftp     vsftpd 3.0.3
80/tcp   open  http    Apache httpd 2.4.18 ((Ubuntu))
2222/tcp open  ssh     OpenSSH 7.2p2 Ubuntu 4ubuntu2.8 (Ubuntu Linux; protocol 2.0)
Service Info: OSs: Unix, Linux; CPE: cpe:/o:linux:linux_kernel

Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 24.60 seconds
```


# ffuf
```
$ ffuf -u http://10.10.193.131/FUZZ -w /usr/share/wordlists/dirb/common.txt
                        [Status: 200, Size: 11321, Words: 3503, Lines: 376, Duration: 274ms]
.htpasswd               [Status: 403, Size: 297, Words: 22, Lines: 12, Duration: 3077ms]
.hta                    [Status: 403, Size: 292, Words: 22, Lines: 12, Duration: 4084ms]
.htaccess               [Status: 403, Size: 297, Words: 22, Lines: 12, Duration: 4084ms]
index.html              [Status: 200, Size: 11321, Words: 3503, Lines: 376, Duration: 275ms]
robots.txt              [Status: 200, Size: 929, Words: 176, Lines: 33, Duration: 271ms]
server-status           [Status: 403, Size: 301, Words: 22, Lines: 12, Duration: 275ms]
simple                  [Status: 301, Size: 315, Words: 20, Lines: 10, Duration: 274ms]
```

```
$ ffuf -u http://10.10.193.131/simple/FUZZ -w /usr/share/wordlists/dirb/common.txt

.htpasswd               [Status: 403, Size: 304, Words: 22, Lines: 12, Duration: 274ms]
.hta                    [Status: 403, Size: 299, Words: 22, Lines: 12, Duration: 272ms]
                        [Status: 200, Size: 19993, Words: 2945, Lines: 127, Duration: 299ms]
.htaccess               [Status: 403, Size: 304, Words: 22, Lines: 12, Duration: 3504ms]
admin                   [Status: 301, Size: 321, Words: 20, Lines: 10, Duration: 274ms]
assets                  [Status: 301, Size: 322, Words: 20, Lines: 10, Duration: 274ms]
doc                     [Status: 301, Size: 319, Words: 20, Lines: 10, Duration: 275ms]
index.php               [Status: 200, Size: 19993, Words: 2945, Lines: 127, Duration: 305ms]
lib                     [Status: 301, Size: 319, Words: 20, Lines: 10, Duration: 272ms]
modules                 [Status: 301, Size: 323, Words: 20, Lines: 10, Duration: 274ms]
tmp                     [Status: 301, Size: 319, Words: 20, Lines: 10, Duration: 273ms]
uploads                 [Status: 301, Size: 323, Words: 20, Lines: 10, Duration: 274ms]
```

```
$ ffuf -u http://10.10.193.131/simple/FUZZ -w /usr/share/wordlists/dirb/common.txt -e .php

.php                    [Status: 403, Size: 299, Words: 22, Lines: 12, Duration: 275ms]
                        [Status: 200, Size: 19993, Words: 2945, Lines: 127, Duration: 293ms]
.htaccess               [Status: 403, Size: 304, Words: 22, Lines: 12, Duration: 2622ms]
.htpasswd.php           [Status: 403, Size: 308, Words: 22, Lines: 12, Duration: 3625ms]
.hta.php                [Status: 403, Size: 303, Words: 22, Lines: 12, Duration: 3625ms]
.hta                    [Status: 403, Size: 299, Words: 22, Lines: 12, Duration: 4634ms]
.htpasswd               [Status: 403, Size: 304, Words: 22, Lines: 12, Duration: 4634ms]
.htaccess.php           [Status: 403, Size: 308, Words: 22, Lines: 12, Duration: 4644ms]
admin                   [Status: 301, Size: 321, Words: 20, Lines: 10, Duration: 275ms]
assets                  [Status: 301, Size: 322, Words: 20, Lines: 10, Duration: 309ms]
config.php              [Status: 200, Size: 0, Words: 1, Lines: 1, Duration: 273ms]
doc                     [Status: 301, Size: 319, Words: 20, Lines: 10, Duration: 272ms]
index.php               [Status: 200, Size: 19993, Words: 2945, Lines: 127, Duration: 299ms]
index.php               [Status: 200, Size: 19993, Words: 2945, Lines: 127, Duration: 297ms]
install.php             [Status: 301, Size: 0, Words: 1, Lines: 1, Duration: 724ms]
lib                     [Status: 301, Size: 319, Words: 20, Lines: 10, Duration: 276ms]
modules                 [Status: 301, Size: 323, Words: 20, Lines: 10, Duration: 273ms]
tmp                     [Status: 301, Size: 319, Words: 20, Lines: 10, Duration: 274ms]
uploads                 [Status: 301, Size: 323, Words: 20, Lines: 10, Duration: 272ms]

```


```
$ ftp ftp://anonymous@10.10.193.131                
Connected to 10.10.193.131.
220 (vsFTPd 3.0.3)
230 Login successful.
Remote system type is UNIX.
Using binary mode to transfer files.
200 Switching to Binary mode.
ftp> ls
229 Entering Extended Passive Mode (|||41511|)

#### gets stuck here
```