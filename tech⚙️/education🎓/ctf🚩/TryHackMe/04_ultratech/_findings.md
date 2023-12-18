https://tryhackme.com/room/ultratech1

```
export IP=10.10.17.49; export MYIP=10.4.18.63
```

# nmap
```
$ nmap $IP -sV -T4 -oA nmap/init -v 

PORT     STATE SERVICE VERSION
21/tcp   open  ftp     vsftpd 3.0.3
22/tcp   open  ssh     OpenSSH 7.6p1 Ubuntu 4ubuntu0.3 (Ubuntu Linux; protocol 2.0)
8081/tcp open  http    Node.js Express framework
Service Info: OSs: Unix, Linux; CPE: cpe:/o:linux:linux_kernel
31331/tcp open  http    Apache httpd 2.4.29 ((Ubuntu))
|_http-favicon: Unknown favicon MD5: 15C1B7515662078EF4B5C724E2927A96
| http-methods: 
|_  Supported Methods: GET POST OPTIONS HEAD
|_http-title: UltraTech - The best of technology (AI, FinTech, Big Data)
|_http-server-header: Apache/2.4.29 (Ubuntu)
```

# ffuf
```
$ ffuf -u "http://$IP:8081/FUZZ" -w /usr/share/wordlists/dirb/common.txt

                        [Status: 200, Size: 20, Words: 3, Lines: 1, Duration: 281ms]
auth                    [Status: 200, Size: 39, Words: 8, Lines: 1, Duration: 276ms]
ping                    [Status: 500, Size: 1094, Words: 52, Lines: 11, Duration: 274ms]
```

```
$ ffuf -u "http://$IP:31331/FUZZ" -w /usr/share/wordlists/dirb/common.txt

.htaccess               [Status: 403, Size: 298, Words: 22, Lines: 12, Duration: 2887ms]
.htpasswd               [Status: 403, Size: 298, Words: 22, Lines: 12, Duration: 4901ms]
                        [Status: 200, Size: 6092, Words: 393, Lines: 140, Duration: 4901ms]
.hta                    [Status: 403, Size: 293, Words: 22, Lines: 12, Duration: 4907ms]
css                     [Status: 301, Size: 317, Words: 20, Lines: 10, Duration: 273ms]
favicon.ico             [Status: 200, Size: 15086, Words: 11, Lines: 7, Duration: 271ms]
images                  [Status: 301, Size: 320, Words: 20, Lines: 10, Duration: 274ms]
index.html              [Status: 200, Size: 6092, Words: 393, Lines: 140, Duration: 272ms]
javascript              [Status: 301, Size: 324, Words: 20, Lines: 10, Duration: 271ms]
js                      [Status: 301, Size: 316, Words: 20, Lines: 10, Duration: 271ms]
robots.txt              [Status: 200, Size: 53, Words: 4, Lines: 6, Duration: 272ms]
server-status           [Status: 403, Size: 302, Words: 22, Lines: 12, Duration: 274ms]
```

## login page found
`/utech_sitemap.txt` found in robots.txt
`/partners.html` found in `utech_sitemap.txt`

```
http://10.10.17.49:31331/partners.html
```

