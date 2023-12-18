# regular tcp scan
```
PORT      STATE    SERVICE  VERSION
22/tcp    open     ssh      OpenSSH 8.2p1 Ubuntu 4ubuntu0.3 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   3072 24:c2:95:a5:c3:0b:3f:f3:17:3c:68:d7:af:2b:53:38 (RSA)
|   256 b1:41:77:99:46:9a:6c:5d:d2:98:2f:c0:32:9a:ce:03 (ECDSA)
|_  256 e7:36:43:3b:a9:47:8a:19:01:58:b2:bc:89:f6:51:08 (ED25519)
80/tcp    open     http     Apache httpd 2.4.41 ((Ubuntu))
|_http-title: Play | Landing
| http-methods: 
|_  Supported Methods: OPTIONS HEAD GET POST
|_http-server-header: Apache/2.4.41 (Ubuntu)
|_http-favicon: Unknown favicon MD5: 115E49F9A03BB97DEB840A3FE185434C
2021/tcp  filtered servexec
12345/tcp filtered netbus
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel
```

# UDP scan
```
$ sudo nmap -T4 -sU 10.10.11.136 -oA nmap/udp -v
Discovered open port 161/udp on 10.10.11.136
```

