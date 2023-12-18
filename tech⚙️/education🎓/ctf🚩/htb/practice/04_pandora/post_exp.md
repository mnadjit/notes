
#ss #socket #netstat #ports #listen
```
ss -lnpt
netstat -ano | rg -ie 'tcp.*?listen'
```

# linpeas
```
daniel@pandora:~$ ./linpeas_linux_amd64 
Sorry, try again.


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
OS: Linux version 5.4.0-91-generic (buildd@lcy01-amd64-017) (gcc version 9.3.0 (Ubuntu 9.3.0-17ubuntu1~20.04)) #102-Ubuntu SMP Fri Nov 5 16:31:28 UTC 2021
User & Groups: uid=1001(daniel) gid=1001(daniel) groups=1001(daniel)
Hostname: pandora
Writable folder: /dev/shm
[+] /usr/bin/ping is available for network discovery (linpeas can discover hosts, learn more with -h)
[+] /usr/bin/bash is available for network discovery, port scanning and port forwarding (linpeas can discover hosts, scan ports, and forward ports. Learn more with -h)                                                                                                                                                   
[+] /usr/bin/nc is available for network discovery & port scanning (linpeas can discover hosts and scan ports, learn more with -h)                           
                                                                                                                                                             
[+] nmap is available for network discovery & port scanning, you should use it yourself                                                                      
                                                                                                                                                             

Caching directories DONE
                                                                                                                                                             
                              ╔════════════════════╗
══════════════════════════════╣ System Information ╠══════════════════════════════                                                                           
                              ╚════════════════════╝                                                                                                         
╔══════════╣ Operative system
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#kernel-exploits                                                                           
Linux version 5.4.0-91-generic (buildd@lcy01-amd64-017) (gcc version 9.3.0 (Ubuntu 9.3.0-17ubuntu1~20.04)) #102-Ubuntu SMP Fri Nov 5 16:31:28 UTC 2021       
Distributor ID: Ubuntu
Description:    Ubuntu 20.04.3 LTS
Release:        20.04
Codename:       focal

╔══════════╣ Sudo version
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#sudo-version                                                                              
Sudo version 1.8.31                                                                                                                                          


╔══════════╣ PATH
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#writable-path-abuses                                                                      
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin                                                           

╔══════════╣ Date & uptime
Fri 15 Dec 04:52:51 UTC 2023                                                                                                                                 
 04:52:51 up 14:41,  1 user,  load average: 0.58, 0.13, 0.04

╔══════════╣ Any sd*/disk* disk in /dev? (limit 20)
disk                                                                                                                                                         
sda
sda1
sda2
sda3

╔══════════╣ Unmounted file-system?
╚ Check if you can mount umounted devices                                                                                                                    
/dev/disk/by-id/dm-uuid-LVM-99uC6MxZWzeIMM3qv6kdF4jGfpSPmJlczhUMINcnSjc3rvckbEI6cLdwGIX82FbV / ext4 defaults 0 0                                             
/dev/disk/by-uuid/936758c6-52fb-4c55-9db2-f8555009c6e2 /boot ext4 defaults 0 0
/dev/mapper/ubuntu--vg-swap     none    swap    sw      0       0

╔══════════╣ Environment
╚ Any private information inside environment variables?                                                                                                      
LESSOPEN=| /usr/bin/lesspipe %s                                                                                                                              
HISTFILESIZE=0
USER=daniel
SSH_CLIENT=10.10.14.4 42694 22
XDG_SESSION_TYPE=tty
SHLVL=1
MOTD_SHOWN=pam
HOME=/home/daniel
SSH_TTY=/dev/pts/0
DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1001/bus
LOGNAME=daniel
_=./linpeas_linux_amd64
XDG_SESSION_CLASS=user
TERM=xterm-256color
XDG_SESSION_ID=55
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
XDG_RUNTIME_DIR=/run/user/1001
LANG=en_GB.UTF-8
HISTSIZE=0
LS_COLORS=rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:
SHELL=/bin/bash
LESSCLOSE=/usr/bin/lesspipe %s %s
PWD=/home/daniel
SSH_CONNECTION=10.10.14.4 42694 10.10.11.136 22
HISTFILE=/dev/null

╔══════════╣ Searching Signature verification failed in dmesg
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#dmesg-signature-verification-failed                                                       
dmesg Not Found                                                                                                                                              
                                                                                                                                                             
╔══════════╣ Executing Linux Exploit Suggester
╚ https://github.com/mzet-/linux-exploit-suggester                                                                                                           
[+] [CVE-2022-2586] nft_object UAF                                                                                                                           

   Details: https://www.openwall.com/lists/oss-security/2022/08/29/5
   Exposure: probable
   Tags: [ ubuntu=(20.04) ]{kernel:5.12.13}
   Download URL: https://www.openwall.com/lists/oss-security/2022/08/29/5/1
   Comments: kernel.unprivileged_userns_clone=1 required (to obtain CAP_NET_ADMIN)

[+] [CVE-2021-4034] PwnKit

   Details: https://www.qualys.com/2022/01/25/cve-2021-4034/pwnkit.txt
   Exposure: probable
   Tags: [ ubuntu=10|11|12|13|14|15|16|17|18|19|20|21 ],debian=7|8|9|10|11,fedora,manjaro
   Download URL: https://codeload.github.com/berdav/CVE-2021-4034/zip/main

[+] [CVE-2021-3156] sudo Baron Samedit

   Details: https://www.qualys.com/2021/01/26/cve-2021-3156/baron-samedit-heap-based-overflow-sudo.txt
   Exposure: probable
   Tags: mint=19,[ ubuntu=18|20 ], debian=10
   Download URL: https://codeload.github.com/blasty/CVE-2021-3156/zip/main

[+] [CVE-2021-3156] sudo Baron Samedit 2

   Details: https://www.qualys.com/2021/01/26/cve-2021-3156/baron-samedit-heap-based-overflow-sudo.txt
   Exposure: probable
   Tags: centos=6|7|8,[ ubuntu=14|16|17|18|19|20 ], debian=9|10
   Download URL: https://codeload.github.com/worawit/CVE-2021-3156/zip/main

[+] [CVE-2021-22555] Netfilter heap out-of-bounds write

   Details: https://google.github.io/security-research/pocs/linux/cve-2021-22555/writeup.html
   Exposure: probable
   Tags: [ ubuntu=20.04 ]{kernel:5.8.0-*}
   Download URL: https://raw.githubusercontent.com/google/security-research/master/pocs/linux/cve-2021-22555/exploit.c
   ext-url: https://raw.githubusercontent.com/bcoles/kernel-exploits/master/CVE-2021-22555/exploit.c
   Comments: ip_tables kernel module must be loaded

[+] [CVE-2022-32250] nft_object UAF (NFT_MSG_NEWSET)

   Details: https://research.nccgroup.com/2022/09/01/settlers-of-netlink-exploiting-a-limited-uaf-in-nf_tables-cve-2022-32250/
https://blog.theori.io/research/CVE-2022-32250-linux-kernel-lpe-2022/
   Exposure: less probable
   Tags: ubuntu=(22.04){kernel:5.15.0-27-generic}
   Download URL: https://raw.githubusercontent.com/theori-io/CVE-2022-32250-exploit/main/exp.c
   Comments: kernel.unprivileged_userns_clone=1 required (to obtain CAP_NET_ADMIN)

[+] [CVE-2017-5618] setuid screen v4.5.0 LPE

   Details: https://seclists.org/oss-sec/2017/q1/184
   Exposure: less probable
   Download URL: https://www.exploit-db.com/download/https://www.exploit-db.com/exploits/41154


╔══════════╣ Executing Linux Exploit Suggester 2
╚ https://github.com/jondonas/linux-exploit-suggester-2                                                                                                      
                                                                                                                                                             
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
═╣ User namespace? ................ enabled
═╣ Cgroup2 enabled? ............... enabled
═╣ Is ASLR enabled? ............... Yes
═╣ Printer? ....................... No
═╣ Is this a virtual machine? ..... Yes (vmware)                                                                                                             

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
root           1  0.0  0.2 169248 11148 ?        Ss   Dec14   0:06 /sbin/init maybe-ubiquity                                                                 
root         489  0.0  0.4  67880 16972 ?        S<s  Dec14   0:00 /lib/systemd/systemd-journald
root         515  0.0  0.1  21524  5592 ?        Ss   Dec14   0:01 /lib/systemd/systemd-udevd
systemd+     534  0.0  0.1  18408  7436 ?        Ss   Dec14   0:01 /lib/systemd/systemd-networkd
  └─(Caps) 0x0000000000003c00=cap_net_bind_service,cap_net_broadcast,cap_net_admin,cap_net_raw
root         661  0.0  0.4 214600 17940 ?        SLsl Dec14   0:05 /sbin/multipathd -d -s
systemd+     684  0.0  0.3  24028 12964 ?        Ss   Dec14   0:05 /lib/systemd/systemd-resolved
systemd+     685  0.0  0.1  90228  6080 ?        Ssl  Dec14   0:03 /lib/systemd/systemd-timesyncd
  └─(Caps) 0x0000000002000000=cap_sys_time
root         699  0.0  0.2  47540 10372 ?        Ss   Dec14   0:00 /usr/bin/VGAuthService
root         710  0.0  0.2 311496  8260 ?        Ssl  Dec14   0:50 /usr/bin/vmtoolsd
root         759  0.0  0.2 239280  9304 ?        Ssl  Dec14   0:01 /usr/lib/accountsservice/accounts-daemon[0m
root         777  0.0  0.0   6812  2976 ?        Ss   Dec14   0:00 /usr/sbin/cron -f
root         790  0.0  0.0   8352  3488 ?        S    Dec14   0:00  _ /usr/sbin/CRON -f
root         800  0.0  0.0   2608   608 ?        Ss   Dec14   0:00      _ /bin/sh -c sleep 30; /bin/bash -c '/usr/bin/host_check -u daniel -p HotelBabylon23'
root        1114  0.0  0.0   2488  1352 ?        S    Dec14   0:00          _ /usr/bin/host_check -u daniel -p HotelBabylon23
message+     785  0.0  0.1   7500  4752 ?        Ss   Dec14   0:00 /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation --syslog-only
  └─(Caps) 0x0000000020000000=cap_audit_write
root         805  0.0  0.0  81960  3556 ?        Ssl  Dec14   0:01 /usr/sbin/irqbalance --foreground
root         814  0.0  0.4  29080 18028 ?        Ss   Dec14   0:00 /usr/bin/python3 /usr/bin/networkd-dispatcher --run-startup-triggers
syslog       820  0.0  0.1 224348  5028 ?        Ssl  Dec14   0:00 /usr/sbin/rsyslogd -n -iNONE
root         827  0.0  0.1  16892  7768 ?        Ss   Dec14   0:00 /lib/systemd/systemd-logind
root         829  0.0  0.3 394912 13724 ?        Ssl  Dec14   0:00 /usr/lib/udisks2/udisksd
daemon[0m       830  0.0  0.0   3792  2232 ?        Ss   Dec14   0:00 /usr/sbin/atd -f
Debian-+     834  0.0  0.3  22756 13280 ?        Ss   Dec14   0:21 /usr/sbin/snmpd -LOw -u Debian-snmp -g Debian-snmp -I -smux mteTrigger mteTriggerConf -f -p /run/snmpd.pid
root         835  0.0  0.7 228068 31644 ?        Ss   Dec14   0:03 /usr/sbin/apache2 -k start
www-data    8399  0.0  0.3 228508 14612 ?        S    02:29   0:00  _ /usr/sbin/apache2 -k start
  └─(Caps) 0x00000000008000c4=cap_dac_read_search,cap_setgid,cap_setuid,cap_sys_nice
www-data   14931  0.0  0.3 228508 14612 ?        S    02:51   0:00  _ /usr/sbin/apache2 -k start
  └─(Caps) 0x00000000008000c4=cap_dac_read_search,cap_setgid,cap_setuid,cap_sys_nice
www-data   15090  0.0  0.3 228508 14612 ?        S    02:52   0:00  _ /usr/sbin/apache2 -k start
  └─(Caps) 0x00000000008000c4=cap_dac_read_search,cap_setgid,cap_setuid,cap_sys_nice
www-data   15492  0.0  0.3 228508 14612 ?        S    02:55   0:00  _ /usr/sbin/apache2 -k start
  └─(Caps) 0x00000000008000c4=cap_dac_read_search,cap_setgid,cap_setuid,cap_sys_nice
www-data   15876  0.0  0.3 228508 14612 ?        S    02:56   0:00  _ /usr/sbin/apache2 -k start
  └─(Caps) 0x00000000008000c4=cap_dac_read_search,cap_setgid,cap_setuid,cap_sys_nice
www-data   18515  0.0  0.3 228508 14612 ?        S    03:04   0:00  _ /usr/sbin/apache2 -k start
  └─(Caps) 0x00000000008000c4=cap_dac_read_search,cap_setgid,cap_setuid,cap_sys_nice
www-data   18897  0.0  0.3 228508 14612 ?        S    03:05   0:00  _ /usr/sbin/apache2 -k start
  └─(Caps) 0x00000000008000c4=cap_dac_read_search,cap_setgid,cap_setuid,cap_sys_nice
www-data   18901  0.0  0.3 228508 14612 ?        S    03:05   0:00  _ /usr/sbin/apache2 -k start
  └─(Caps) 0x00000000008000c4=cap_dac_read_search,cap_setgid,cap_setuid,cap_sys_nice
www-data   18916  0.0  0.3 228508 14612 ?        S    03:05   0:00  _ /usr/sbin/apache2 -k start
  └─(Caps) 0x00000000008000c4=cap_dac_read_search,cap_setgid,cap_setuid,cap_sys_nice
www-data   18929  0.0  0.3 228508 14612 ?        S    03:05   0:00  _ /usr/sbin/apache2 -k start
  └─(Caps) 0x00000000008000c4=cap_dac_read_search,cap_setgid,cap_setuid,cap_sys_nice
daniel     21533  0.0  0.1  14060  6004 ?        S    04:40   0:00      _ sshd: daniel@pts/0
daniel     21534  0.0  0.1   8404  5408 pts/0    Ss   04:40   0:00          _ -bash
daniel     21604  0.0  0.0 704376  2192 pts/0    Sl+  04:52   0:00              _ ./linpeas_linux_amd64
daniel     21608  0.0  0.0   5484   596 pts/0    S+   04:52   0:00                  _ base64 -d
daniel     21609  0.2  0.0   3468  2640 pts/0    S+   04:52   0:00                  _ /bin/sh
daniel     24821  0.0  0.0   3468  1072 pts/0    S+   04:53   0:00                      _ /bin/sh
daniel     24825  0.0  0.0   9224  3736 pts/0    R+   04:53   0:00                      |   _ ps fauxwww
daniel     24824  0.0  0.0   3468  1072 pts/0    S+   04:53   0:00                      _ /bin/sh
root         939  0.0  0.2 236420  9004 ?        Ssl  Dec14   0:00 /usr/lib/policykit-1/polkitd --no-debug
root         957  0.0  0.0   5828  1796 tty1     Ss+  Dec14   0:00 /sbin/agetty -o -p -- u --noclear tty1 linux
mysql        961  0.0  2.4 1710488 96872 ?       Ssl  Dec14   0:44 /usr/sbin/mysqld
root        6173  0.0  0.2 241188  9472 ?        Ssl  Dec14   0:00 /usr/lib/upower/upowerd
daniel     21407  0.0  0.2  18404  9436 ?        Ss   04:40   0:00 /lib/systemd/systemd --user
daniel     21410  0.0  0.0 170604  3348 ?        S    04:40   0:00  _ (sd-pam)

╔══════════╣ Binary processes permissions (non 'root root' and not belonging to current user)
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#processes                                                                                 
   0 lrwxrwxrwx 1 root   root      4 Feb  1  2021 /bin/sh -> dash                                                                                            
1.6M -rwxr-xr-x 1 root   root   1.6M Sep  7  2021 /lib/systemd/systemd
160K -rwxr-xr-x 1 root   root   159K Sep  7  2021 /lib/systemd/systemd-journald
264K -rwxr-xr-x 1 root   root   263K Sep  7  2021 /lib/systemd/systemd-logind
2.2M -rwxr-xr-x 1 root   root   2.2M Sep  7  2021 /lib/systemd/systemd-networkd
408K -rwxr-xr-x 1 root   root   407K Sep  7  2021 /lib/systemd/systemd-resolved
 56K -rwxr-xr-x 1 root   root    55K Sep  7  2021 /lib/systemd/systemd-timesyncd
732K -rwxr-xr-x 1 root   root   727K Sep  7  2021 /lib/systemd/systemd-udevd
 68K -rwxr-xr-x 1 root   root    68K Jul 21  2020 /sbin/agetty
   0 lrwxrwxrwx 1 root   root     20 Sep  7  2021 /sbin/init -> /lib/systemd/systemd
128K -rwxr-xr-x 1 root   root   127K Apr  6  2020 /sbin/multipathd
244K -rwxr-xr-x 1 root   root   244K Jun 11  2020 /usr/bin/dbus-daemon
 20K -rwxr-xr-x 1 root   root    17K Jun 17  2021 /usr/bin/host_check
   0 lrwxrwxrwx 1 root   root      9 Mar 13  2020 /usr/bin/python3 -> python3.8
140K -rwxr-xr-x 1 root   root   139K Oct 12  2021 /usr/bin/VGAuthService
 76K -rwxr-xr-x 1 root   root    75K Oct 12  2021 /usr/bin/vmtoolsd
200K -rwxr-xr-x 1 root   root   199K Nov  9  2021 /usr/lib/accountsservice/accounts-daemon[0m
120K -rwxr-xr-x 1 root   root   119K May 26  2021 /usr/lib/policykit-1/polkitd
472K -rwxr-xr-x 1 root   root   472K Sep  6  2021 /usr/lib/udisks2/udisksd
256K -rwxr-xr-x 1 root   root   255K Dec 10  2019 /usr/lib/upower/upowerd
696K -rwxr-xr-x 1 root   root   693K Oct 14  2021 /usr/sbin/apache2
 32K -rwxr-xr-x 1 root   root    31K Nov 12  2018 /usr/sbin/atd
 56K -rwxr-xr-x 1 root   root    55K Feb 13  2020 /usr/sbin/cron
 64K -rwxr-xr-x 1 root   root    63K Feb 13  2020 /usr/sbin/irqbalance
 21M -rwxr-xr-x 1 root   root    21M Nov 21  2021 /usr/sbin/mysqld
712K -rwxr-xr-x 1 root   root   711K Aug  4  2020 /usr/sbin/rsyslogd
 36K -rwxr-xr-x 1 root   root    35K Aug 17  2020 /usr/sbin/snmpd

╔══════════╣ Processes whose PPID belongs to a different user (not root)
╚ You will know if a user can somehow spawn processes as a different user                                                                                    
Proc 534 with ppid 1 is run by user systemd-network but the ppid user is root                                                                                
Proc 684 with ppid 1 is run by user systemd-resolve but the ppid user is root
Proc 685 with ppid 1 is run by user systemd-timesync but the ppid user is root
Proc 785 with ppid 1 is run by user messagebus but the ppid user is root
Proc 820 with ppid 1 is run by user syslog but the ppid user is root
Proc 830 with ppid 1 is run by user daemon but the ppid user is root
Proc 834 with ppid 1 is run by user Debian-snmp but the ppid user is root
Proc 961 with ppid 1 is run by user mysql but the ppid user is root
Proc 8399 with ppid 835 is run by user www-data but the ppid user is root
Proc 14931 with ppid 835 is run by user www-data but the ppid user is root
Proc 15090 with ppid 835 is run by user www-data but the ppid user is root
Proc 15492 with ppid 835 is run by user www-data but the ppid user is root
Proc 15876 with ppid 835 is run by user www-data but the ppid user is root
Proc 18515 with ppid 835 is run by user www-data but the ppid user is root
Proc 18897 with ppid 835 is run by user www-data but the ppid user is root
Proc 18901 with ppid 835 is run by user www-data but the ppid user is root
Proc 18916 with ppid 835 is run by user www-data but the ppid user is root
Proc 18929 with ppid 835 is run by user www-data but the ppid user is root
Proc 21407 with ppid 1 is run by user daniel but the ppid user is root
Proc 21533 with ppid 21390 is run by user daniel but the ppid user is root

╔══════════╣ Files opened by processes belonging to other users
╚ This is usually empty because of the lack of privileges to read other user processes information                                                           
COMMAND     PID   TID TASKCMD               USER   FD      TYPE             DEVICE SIZE/OFF       NODE NAME                                                  

╔══════════╣ Processes with credentials in memory (root req)
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#credentials-from-process-memory                                                           
gdm-password Not Found                                                                                                                                       
gnome-keyring-daemon Not Found                                                                                                                               
lightdm Not Found                                                                                                                                            
vsftpd Not Found                                                                                                                                             
apache2 process found (dump creds from memory as root)                                                                                                       
sshd: process found (dump creds from memory as root)

╔══════════╣ Cron jobs
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#scheduled-cron-jobs                                                                       
/usr/bin/crontab                                                                                                                                             
incrontab Not Found
-rw-r--r-- 1 root root    1042 Jun 16  2021 /etc/crontab                                                                                                     

/etc/cron.d:
total 24
drwxr-xr-x   2 root root 4096 Jun 11  2021 .
drwxr-xr-x 105 root root 4096 Jan  3  2022 ..
-rw-r--r--   1 root root  201 Feb 14  2020 e2scrub_all
-rw-r--r--   1 root root  712 Mar 27  2020 php
-rw-r--r--   1 root root  102 Feb 13  2020 .placeholder
-rw-r--r--   1 root root  191 Feb  1  2021 popularity-contest

/etc/cron.daily:
total 52
drwxr-xr-x   2 root root 4096 Jan  3  2022 .
drwxr-xr-x 105 root root 4096 Jan  3  2022 ..
-rwxr-xr-x   1 root root  539 Apr 13  2020 apache2
-rwxr-xr-x   1 root root  376 Dec  4  2019 apport
-rwxr-xr-x   1 root root 1478 Apr  9  2020 apt-compat
-rwxr-xr-x   1 root root  355 Dec 29  2017 bsdmainutils
-rwxr-xr-x   1 root root 1187 Sep  5  2019 dpkg
-rwxr-xr-x   1 root root  377 Jan 21  2019 logrotate
-rwxr-xr-x   1 root root 1123 Feb 25  2020 man-db
-rw-r--r--   1 root root  102 Feb 13  2020 .placeholder
-rwxr-xr-x   1 root root 4574 Jul 18  2019 popularity-contest
-rwxr-xr-x   1 root root  214 Dec  7  2020 update-notifier-common

/etc/cron.hourly:
total 12
drwxr-xr-x   2 root root 4096 Jun 11  2021 .
drwxr-xr-x 105 root root 4096 Jan  3  2022 ..
-rw-r--r--   1 root root  102 Feb 13  2020 .placeholder

/etc/cron.monthly:
total 12
drwxr-xr-x   2 root root 4096 Feb  1  2021 .
drwxr-xr-x 105 root root 4096 Jan  3  2022 ..
-rw-r--r--   1 root root  102 Feb 13  2020 .placeholder

/etc/cron.weekly:
total 20
drwxr-xr-x   2 root root 4096 Jan  3  2022 .
drwxr-xr-x 105 root root 4096 Jan  3  2022 ..
-rwxr-xr-x   1 root root  813 Feb 25  2020 man-db
-rw-r--r--   1 root root  102 Feb 13  2020 .placeholder
-rwxr-xr-x   1 root root  403 Aug  5  2021 update-notifier-common

SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

17 *    * * *   root    cd / && run-parts --report /etc/cron.hourly
25 6    * * *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.daily )
47 6    * * 7   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.weekly )
52 6    1 * *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.monthly )

╔══════════╣ Systemd PATH
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#systemd-path-relative-paths                                                               
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin                                                                                            

╔══════════╣ Analyzing .service files
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#services                                                                                  
/etc/systemd/system/multi-user.target.wants/atd.service could be executing some relative path                                                                
/etc/systemd/system/multi-user.target.wants/grub-common.service could be executing some relative path
/etc/systemd/system/multi-user.target.wants/mariadb.service could be executing some relative path
/etc/systemd/system/mysqld.service could be executing some relative path
/etc/systemd/system/mysql.service could be executing some relative path
/etc/systemd/system/sleep.target.wants/grub-common.service could be executing some relative path
You can't write on systemd PATH

╔══════════╣ System timers
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#timers                                                                                    
NEXT                        LEFT           LAST                        PASSED       UNIT                         ACTIVATES                                   
Fri 2023-12-15 05:09:00 UTC 15min left     Fri 2023-12-15 04:39:03 UTC 14min ago    phpsessionclean.timer        phpsessionclean.service       
Fri 2023-12-15 06:43:03 UTC 1h 49min left  Thu 2023-12-14 14:53:10 UTC 13h ago      apt-daily-upgrade.timer      apt-daily-upgrade.service     
Fri 2023-12-15 06:55:14 UTC 2h 2min left   Thu 2023-12-14 19:37:55 UTC 9h ago       apt-daily.timer              apt-daily.service             
Fri 2023-12-15 09:40:02 UTC 4h 46min left  Thu 2023-12-14 18:07:00 UTC 10h ago      fwupd-refresh.timer          fwupd-refresh.service         
Fri 2023-12-15 10:14:33 UTC 5h 21min left  Fri 2023-12-15 03:57:50 UTC 55min ago    ua-timer.timer               ua-timer.service              
Fri 2023-12-15 14:26:24 UTC 9h left        Thu 2023-12-14 14:26:24 UTC 14h ago      systemd-tmpfiles-clean.timer systemd-tmpfiles-clean.service
Fri 2023-12-15 18:19:34 UTC 13h left       Fri 2023-12-15 02:20:56 UTC 2h 32min ago motd-news.timer              motd-news.service             
Sat 2023-12-16 00:00:00 UTC 19h left       Fri 2023-12-15 00:00:04 UTC 4h 53min ago logrotate.timer              logrotate.service             
Sat 2023-12-16 00:00:00 UTC 19h left       Fri 2023-12-15 00:00:04 UTC 4h 53min ago man-db.timer                 man-db.service                
Sun 2023-12-17 03:10:19 UTC 1 day 22h left Thu 2023-12-14 14:12:12 UTC 14h ago      e2scrub_all.timer            e2scrub_all.service           
Mon 2023-12-18 00:00:00 UTC 2 days left    Thu 2023-12-14 14:11:31 UTC 14h ago      fstrim.timer                 fstrim.service                
n/a                         n/a            n/a                         n/a          ua-license-check.timer       ua-license-check.service      

╔══════════╣ Analyzing .timer files
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#timers                                                                                    
                                                                                                                                                             
╔══════════╣ Analyzing .socket files
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#sockets                                                                                   
/etc/systemd/system/sockets.target.wants/uuidd.socket is calling this writable listener: /run/uuidd/request                                                  
/usr/lib/systemd/system/dbus.socket is calling this writable listener: /var/run/dbus/system_bus_socket
/usr/lib/systemd/system/sockets.target.wants/dbus.socket is calling this writable listener: /var/run/dbus/system_bus_socket
/usr/lib/systemd/system/sockets.target.wants/systemd-journald-dev-log.socket is calling this writable listener: /run/systemd/journal/dev-log
/usr/lib/systemd/system/sockets.target.wants/systemd-journald.socket is calling this writable listener: /run/systemd/journal/stdout
/usr/lib/systemd/system/sockets.target.wants/systemd-journald.socket is calling this writable listener: /run/systemd/journal/socket
/usr/lib/systemd/system/syslog.socket is calling this writable listener: /run/systemd/journal/syslog
/usr/lib/systemd/system/systemd-journald-dev-log.socket is calling this writable listener: /run/systemd/journal/dev-log
/usr/lib/systemd/system/systemd-journald.socket is calling this writable listener: /run/systemd/journal/stdout
/usr/lib/systemd/system/systemd-journald.socket is calling this writable listener: /run/systemd/journal/socket
/usr/lib/systemd/system/uuidd.socket is calling this writable listener: /run/uuidd/request

╔══════════╣ Unix Sockets Listening
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#sockets                                                                                   
/org/kernel/linux/storage/multipathd                                                                                                                         
/run/dbus/system_bus_socket
  └─(Read Write)
/run/irqbalance//irqbalance805.sock
  └─(Read )
/run/irqbalance/irqbalance805.sock
  └─(Read )
/run/lvm/lvmpolld.socket
/run/mysqld/mysqld.sock
  └─(Read Write)
/run/systemd/journal/dev-log
  └─(Read Write)
/run/systemd/journal/io.systemd.journal
/run/systemd/journal/socket
  └─(Read Write)
/run/systemd/journal/stdout
  └─(Read Write)
/run/systemd/journal/syslog
  └─(Read Write)
/run/systemd/notify
  └─(Read Write)
/run/systemd/private
  └─(Read Write)
/run/systemd/userdb/io.systemd.DynamicUser
  └─(Read Write)
/run/udev/control
/run/user/1001/bus
  └─(Read Write)
/run/user/1001/gnupg/S.dirmngr
  └─(Read Write)
/run/user/1001/gnupg/S.gpg-agent
  └─(Read Write)
/run/user/1001/gnupg/S.gpg-agent.browser
  └─(Read Write)
/run/user/1001/gnupg/S.gpg-agent.extra
  └─(Read Write)
/run/user/1001/gnupg/S.gpg-agent.ssh
  └─(Read Write)
/run/user/1001/pk-debconf-socket
  └─(Read Write)
/run/user/1001/systemd/notify
  └─(Read Write)
/run/user/1001/systemd/private
  └─(Read Write)
/run/uuidd/request
  └─(Read Write)
/run/vmware/guestServicePipe
  └─(Read Write)
/var/agentx/master
/var/run/vmware/guestServicePipe
  └─(Read Write)

╔══════════╣ D-Bus config files
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#d-bus                                                                                     
Possible weak user policy found on /etc/dbus-1/system.d/org.freedesktop.thermald.conf (        <policy group="power">)                                       

╔══════════╣ D-Bus Service Objects list
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#d-bus                                                                                     
NAME                            PID PROCESS         USER             CONNECTION    UNIT                        SESSION DESCRIPTION                           
:1.0                            534 systemd-network systemd-network  :1.0          systemd-networkd.service    -       -
:1.1                            684 systemd-resolve systemd-resolve  :1.1          systemd-resolved.service    -       -
:1.2                            685 systemd-timesyn systemd-timesync :1.2          systemd-timesyncd.service   -       -
:1.25                          6173 upowerd         root             :1.25         upower.service              -       -
:1.28                         21407 systemd         daniel           :1.28         user@1001.service           -       -
:1.3                            827 systemd-logind  root             :1.3          systemd-logind.service      -       -
:1.34                         29022 busctl          daniel           :1.34         session-55.scope            55      -
:1.4                            829 udisksd         root             :1.4          udisks2.service             -       -
:1.5                            759 accounts-daemon[0m root             :1.5          accounts-daemon.service     -       -
:1.6                              1 systemd         root             :1.6          init.scope                  -       -
:1.7                            939 polkitd         root             :1.7          polkit.service              -       -
:1.8                            814 networkd-dispat root             :1.8          networkd-dispatcher.service -       -
com.ubuntu.LanguageSelector       - -               -                (activatable) -                           -       -
com.ubuntu.SoftwareProperties     - -               -                (activatable) -                           -       -
org.freedesktop.Accounts        759 accounts-daemon[0m root             :1.5          accounts-daemon.service     -       -
org.freedesktop.DBus              1 systemd         root             -             init.scope                  -       -
org.freedesktop.PackageKit        - -               -                (activatable) -                           -       -
org.freedesktop.PolicyKit1      939 polkitd         root             :1.7          polkit.service              -       -
org.freedesktop.UDisks2         829 udisksd         root             :1.4          udisks2.service             -       -
org.freedesktop.UPower         6173 upowerd         root             :1.25         upower.service              -       -
org.freedesktop.bolt              - -               -                (activatable) -                           -       -
org.freedesktop.fwupd             - -               -                (activatable) -                           -       -
org.freedesktop.hostname1         - -               -                (activatable) -                           -       -
org.freedesktop.locale1           - -               -                (activatable) -                           -       -
org.freedesktop.login1          827 systemd-logind  root             :1.3          systemd-logind.service      -       -
org.freedesktop.network1        534 systemd-network systemd-network  :1.0          systemd-networkd.service    -       -
org.freedesktop.resolve1        684 systemd-resolve systemd-resolve  :1.1          systemd-resolved.service    -       -
org.freedesktop.systemd1          1 systemd         root             :1.6          init.scope                  -       -
org.freedesktop.thermald          - -               -                (activatable) -                           -       -
org.freedesktop.timedate1         - -               -                (activatable) -                           -       -
org.freedesktop.timesync1       685 systemd-timesyn systemd-timesync :1.2          systemd-timesyncd.service   -       -


                              ╔═════════════════════╗
══════════════════════════════╣ Network Information ╠══════════════════════════════                                                                          
                              ╚═════════════════════╝                                                                                                        
╔══════════╣ Hostname, hosts and DNS
pandora                                                                                                                                                      
127.0.0.1 localhost.localdomain pandora.htb pandora.pandora.htb
127.0.1.1 pandora

::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters

nameserver 127.0.0.53
options edns0 trust-ad

╔══════════╣ Interfaces
# symbolic names for networks, see networks(5) for more information                                                                                          
link-local 169.254.0.0
eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.10.11.136  netmask 255.255.254.0  broadcast 10.10.11.255
        inet6 fe80::250:56ff:feb9:2f17  prefixlen 64  scopeid 0x20<link>
        inet6 dead:beef::250:56ff:feb9:2f17  prefixlen 64  scopeid 0x0<global>
        ether 00:50:56:b9:2f:17  txqueuelen 1000  (Ethernet)
        RX packets 496234  bytes 74122844 (74.1 MB)
        RX errors 0  dropped 831  overruns 0  frame 0
        TX packets 430150  bytes 293427495 (293.4 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 96039  bytes 16180335 (16.1 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 96039  bytes 16180335 (16.1 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0


╔══════════╣ Active Ports
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#open-ports                                                                                
tcp        0      0 127.0.0.1:3306          0.0.0.0:*               LISTEN      -                                                                            
tcp        0      0 127.0.0.53:53           0.0.0.0:*               LISTEN      -                   
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      -                   
tcp6       0      0 :::80                   :::*                    LISTEN      -                   
tcp6       0      0 :::22                   :::*                    LISTEN      -                   

╔══════════╣ Can I sniff with tcpdump?
No                                                                                                                                                           
                                                                                                                                                             


                               ╔═══════════════════╗
═══════════════════════════════╣ Users Information ╠═══════════════════════════════                                                                          
                               ╚═══════════════════╝                                                                                                         
╔══════════╣ My user
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#users                                                                                     
uid=1001(daniel) gid=1001(daniel) groups=1001(daniel)                                                                                                        

╔══════════╣ Do I have PGP keys?
/usr/bin/gpg                                                                                                                                                 
netpgpkeys Not Found
netpgp Not Found                                                                                                                                             
                                                                                                                                                             
╔══════════╣ Checking 'sudo -l', /etc/sudoers, and /etc/sudoers.d
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#sudo-and-suid                                                                             
                                                                                                                                                             
╔══════════╣ Checking sudo tokens
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#reusing-sudo-tokens                                                                       
ptrace protection is enabled (1)                                                                                                                             

╔══════════╣ Checking Pkexec policy
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation/interesting-groups-linux-pe#pe-method-2                                                   
                                                                                                                                                             
[Configuration]
AdminIdentities=unix-user:0
[Configuration]
AdminIdentities=unix-group:sudo;unix-group:admin

╔══════════╣ Superusers
root:x:0:0:root:/root:/bin/bash                                                                                                                              

╔══════════╣ Users with console
daniel:x:1001:1001::/home/daniel:/bin/bash                                                                                                                   
matt:x:1000:1000:matt:/home/matt:/bin/bash
root:x:0:0:root:/root:/bin/bash

╔══════════╣ All users & groups
uid=0(root) gid=0(root) groups=0(root)                                                                                                                       
uid=1000(matt) gid=1000(matt) groups=1000(matt)
uid=1001(daniel) gid=1001(daniel) groups=1001(daniel)
uid=100(systemd-network) gid=102(systemd-network) groups=102(systemd-network)
uid=101(systemd-resolve) gid=103(systemd-resolve) groups=103(systemd-resolve)
uid=102(systemd-timesync) gid=104(systemd-timesync) groups=104(systemd-timesync)
uid=103(messagebus) gid=106(messagebus) groups=106(messagebus)
uid=104(syslog) gid=110(syslog) groups=110(syslog),4(adm),5(tty)
uid=105(_apt) gid=65534(nogroup) groups=65534(nogroup)
uid=106(tss) gid=111(tss) groups=111(tss)
uid=107(uuidd) gid=112(uuidd) groups=112(uuidd)
uid=108(tcpdump) gid=113(tcpdump) groups=113(tcpdump)
uid=109(landscape) gid=115(landscape) groups=115(landscape)
uid=10(uucp) gid=10(uucp) groups=10(uucp)
uid=110(pollinate) gid=1(daemon[0m) groups=1(daemon[0m)
uid=111(usbmux) gid=46(plugdev) groups=46(plugdev)
uid=112(sshd) gid=65534(nogroup) groups=65534(nogroup)
uid=113(Debian-snmp) gid=117(Debian-snmp) groups=117(Debian-snmp)
uid=114(mysql) gid=119(mysql) groups=119(mysql)
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
uid=998(lxd) gid=100(users) groups=100(users)
uid=999(systemd-coredump) gid=999(systemd-coredump) groups=999(systemd-coredump)
uid=9(news) gid=9(news) groups=9(news)

╔══════════╣ Login now
 04:53:10 up 14:41,  1 user,  load average: 0.42, 0.12, 0.04                                                                                                 
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
daniel   pts/0    10.10.14.4       04:40   46.00s  0.23s  0.00s /bin/sh

╔══════════╣ Last logons
daniel   pts/0        Thu Dec 14 14:35:31 2023 - Thu Dec 14 15:10:58 2023  (00:35)     10.10.14.51                                                           
reboot   system boot  Thu Dec 14 14:11:26 2023   still running                         0.0.0.0
root     tty1         Mon Jan  3 08:59:53 2022 - down                      (00:08)     0.0.0.0
reboot   system boot  Mon Jan  3 08:57:28 2022 - Mon Jan  3 09:08:08 2022  (00:10)     0.0.0.0
root     tty1         Mon Jan  3 07:42:50 2022 - down                      (00:16)     0.0.0.0
reboot   system boot  Mon Jan  3 07:39:42 2022 - Mon Jan  3 07:59:19 2022  (00:19)     0.0.0.0
root     tty1         Tue Dec  7 14:57:46 2021 - down                      (00:02)     0.0.0.0
reboot   system boot  Tue Dec  7 14:57:26 2021 - Tue Dec  7 15:00:37 2021  (00:03)     0.0.0.0

wtmp begins Tue Dec  7 14:57:26 2021

╔══════════╣ Last time logon each user
Username         Port     From             Latest                                                                                                            
root             tty1                      Mon Jan  3 08:59:53 +0000 2022
daniel           pts/0    10.10.14.4       Fri Dec 15 04:40:33 +0000 2023

╔══════════╣ Do not forget to test 'su' as any other user with shell: without password and with their names as password (I don't do it in FAST mode...)
                                                                                                                                                             
╔══════════╣ Do not forget to execute 'sudo -l' without password or with valid password (if you know it)!!
                                                                                                                                                             


                             ╔══════════════════════╗
═════════════════════════════╣ Software Information ╠═════════════════════════════                                                                           
                             ╚══════════════════════╝                                                                                                        
╔══════════╣ Useful software
/usr/bin/base64                                                                                                                                              
/usr/bin/curl
/usr/bin/nc
/usr/bin/netcat
/usr/bin/nmap
/usr/bin/perl
/usr/bin/php
/usr/bin/ping
/usr/bin/python3
/usr/bin/socat
/usr/bin/sudo
/usr/bin/wget

╔══════════╣ Installed Compilers
                                                                                                                                                             
╔══════════╣ MySQL version
mysql  Ver 15.1 Distrib 10.3.32-MariaDB, for debian-linux-gnu (x86_64) using readline 5.2                                                                    


═╣ MySQL connection using default root/root ........... No
═╣ MySQL connection using root/toor ................... No                                                                                                   
═╣ MySQL connection using root/NOPASS ................. No                                                                                                   
                                                                                                                                                             
╔══════════╣ Searching mysql credentials and exec
From '/etc/mysql/mariadb.conf.d/50-server.cnf' Mysql user: user                    = mysql                                                                   
Found readable /etc/mysql/my.cnf
[mysqld]
sql_mode=NO_ENGINE_SUBSTITUTION
[client-server]
!includedir /etc/mysql/conf.d/
!includedir /etc/mysql/mariadb.conf.d/

╔══════════╣ Analyzing MariaDB Files (limit 70)
-rw-r--r-- 1 root root 911 Dec  3  2021 /etc/mysql/mariadb.cnf                                                                                               
[mysqld]
sql_mode=NO_ENGINE_SUBSTITUTION
[client-server]
!includedir /etc/mysql/conf.d/
!includedir /etc/mysql/mariadb.conf.d/

-rw------- 1 root root 261 Jun 11  2021 /etc/mysql/debian.cnf

╔══════════╣ Analyzing Apache-Nginx Files (limit 70)
Apache version: Server version: Apache/2.4.41 (Ubuntu)                                                                                                       
Server built:   2021-10-14T16:24:43
httpd Not Found
                                                                                                                                                             
Nginx version: nginx Not Found
                                                                                                                                                             
/etc/apache2/mods-available/php7.4.conf-<FilesMatch ".+\.ph(ar|p|tml)$">
/etc/apache2/mods-available/php7.4.conf:    SetHandler application/x-httpd-php
--
/etc/apache2/mods-available/php7.4.conf-<FilesMatch ".+\.phps$">
/etc/apache2/mods-available/php7.4.conf:    SetHandler application/x-httpd-php-source
--
/etc/apache2/mods-enabled/php7.4.conf-<FilesMatch ".+\.ph(ar|p|tml)$">
/etc/apache2/mods-enabled/php7.4.conf:    SetHandler application/x-httpd-php
--
/etc/apache2/mods-enabled/php7.4.conf-<FilesMatch ".+\.phps$">
/etc/apache2/mods-enabled/php7.4.conf:    SetHandler application/x-httpd-php-source
══╣ PHP exec extensions
drwxr-xr-x 2 root root 4096 Dec  3  2021 /etc/apache2/sites-enabled                                                                                          
drwxr-xr-x 2 root root 4096 Dec  3  2021 /etc/apache2/sites-enabled
lrwxrwxrwx 1 root root 35 Dec  3  2021 /etc/apache2/sites-enabled/000-default.conf -> ../sites-available/000-default.conf
<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/html
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
lrwxrwxrwx 1 root root 31 Dec  3  2021 /etc/apache2/sites-enabled/pandora.conf -> ../sites-available/pandora.conf
<VirtualHost localhost:80>
  ServerAdmin admin@panda.htb
  ServerName pandora.panda.htb
  DocumentRoot /var/www/pandora
  AssignUserID matt matt
  <Directory /var/www/pandora>
    AllowOverride All
  </Directory>
  ErrorLog /var/log/apache2/error.log
  CustomLog /var/log/apache2/access.log combined
</VirtualHost>


-rw-r--r-- 1 root root 1332 Apr 13  2020 /etc/apache2/sites-available/000-default.conf
<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/html
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
lrwxrwxrwx 1 root root 35 Dec  3  2021 /etc/apache2/sites-enabled/000-default.conf -> ../sites-available/000-default.conf
<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/html
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>

-rw-r--r-- 1 root root 72958 Jun 11  2021 /etc/php/7.4/apache2/php.ini
allow_url_fopen = On
allow_url_include = Off
odbc.allow_persistent = On
mysqli.allow_persistent = On
pgsql.allow_persistent = On
-rw-r--r-- 1 root root 72539 Oct  6  2020 /etc/php/7.4/cli/php.ini
allow_url_fopen = On
allow_url_include = Off
odbc.allow_persistent = On
mysqli.allow_persistent = On
pgsql.allow_persistent = On



╔══════════╣ Analyzing Rsync Files (limit 70)
-rw-r--r-- 1 root root 1044 Jul 14  2020 /usr/share/doc/rsync/examples/rsyncd.conf                                                                           
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
drwxr-xr-x 2 root root 4096 Jun 11  2021 /etc/ldap

drwxr-xr-x 2 root root 4096 Jan  3  2022 /usr/share/php7.4-ldap/ldap

-rw-r--r-- 1 root root 0 Jun 11  2021 /var/lib/php/modules/7.4/apache2/enabled_by_maint/ldap

-rw-r--r-- 1 root root 0 Jun 11  2021 /var/lib/php/modules/7.4/cli/enabled_by_maint/ldap

-rw-r--r-- 1 root root 0 Jan  3  2022 /var/lib/php/modules/7.4/registry/ldap


╔══════════╣ Searching ssl/ssh files
╔══════════╣ Analyzing SSH Files (limit 70)                                                                                                                  
                                                                                                                                                             

-rw-r--r-- 1 daniel daniel 444 Dec 14 14:58 /home/daniel/.ssh/known_hosts
|1|iVcfPYUPYAIyaTIThZ551bmXJNg=|4Y8DXaqo3Pj4mpnlw2ios7kA5DQ= ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBNNJGh4HcK3rlrsvCbu0kASt7NLMvAUwB51UnianAKyr9H0UBYZnOkVZhIjDea3F/CxfOQeqLpanqso/EqXcT9w=
|1|mn9on5lHU9wVZWRVMUV2oMzQuXc=|FOV9IywmvvzJ3S8FaZ90eNTK5Dw= ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBNNJGh4HcK3rlrsvCbu0kASt7NLMvAUwB51UnianAKyr9H0UBYZnOkVZhIjDea3F/CxfOQeqLpanqso/EqXcT9w=


-rw------- 1 daniel daniel 1 Dec  7  2021 /home/daniel/.ssh/authorized_keys

-rw-r--r-- 1 root root 600 Jun 11  2021 /etc/ssh/ssh_host_dsa_key.pub
-rw-r--r-- 1 root root 172 Jun 11  2021 /etc/ssh/ssh_host_ecdsa_key.pub
-rw-r--r-- 1 root root 92 Jun 11  2021 /etc/ssh/ssh_host_ed25519_key.pub
-rw-r--r-- 1 root root 564 Jun 11  2021 /etc/ssh/ssh_host_rsa_key.pub
-rw-r--r-- 1 matt matt 272 Jan  3  2020 /var/www/pandora/pandora_console/vendor/swiftmailer/swiftmailer/tests/_samples/dkim/dkim.test.pub

ChallengeResponseAuthentication no
UsePAM yes
PasswordAuthentication yes

══╣ Possible private SSH keys were found!
/var/www/pandora/pandora_console/vendor/swiftmailer/swiftmailer/tests/_samples/dkim/dkim.test.priv
/var/www/pandora/pandora_console/vendor/swiftmailer/swiftmailer/tests/_samples/smime/intermediate.key
/var/www/pandora/pandora_console/vendor/swiftmailer/swiftmailer/tests/_samples/smime/sign2.key
/var/www/pandora/pandora_console/vendor/swiftmailer/swiftmailer/tests/_samples/smime/ca.key
/var/www/pandora/pandora_console/vendor/swiftmailer/swiftmailer/tests/_samples/smime/encrypt.key
/var/www/pandora/pandora_console/vendor/swiftmailer/swiftmailer/tests/_samples/smime/encrypt2.key
/var/www/pandora/pandora_console/vendor/swiftmailer/swiftmailer/tests/_samples/smime/sign.key

══╣ Some certificates were found (out limited):
/etc/pki/fwupd/LVFS-CA.pem                                                                                                                                   
/etc/pki/fwupd-metadata/LVFS-CA.pem
/etc/pollinate/entropy.ubuntu.com.pem
/etc/ssl/certs/ACCVRAIZ1.pem
/etc/ssl/certs/AC_RAIZ_FNMT-RCM.pem
/etc/ssl/certs/Actalis_Authentication_Root_CA.pem
/etc/ssl/certs/AffirmTrust_Commercial.pem
/etc/ssl/certs/AffirmTrust_Networking.pem
/etc/ssl/certs/AffirmTrust_Premium_ECC.pem
/etc/ssl/certs/AffirmTrust_Premium.pem
/etc/ssl/certs/Amazon_Root_CA_1.pem
/etc/ssl/certs/Amazon_Root_CA_2.pem
/etc/ssl/certs/Amazon_Root_CA_3.pem
/etc/ssl/certs/Amazon_Root_CA_4.pem
/etc/ssl/certs/Atos_TrustedRoot_2011.pem
/etc/ssl/certs/Autoridad_de_Certificacion_Firmaprofesional_CIF_A62634068.pem
/etc/ssl/certs/Baltimore_CyberTrust_Root.pem
/etc/ssl/certs/Buypass_Class_2_Root_CA.pem
/etc/ssl/certs/Buypass_Class_3_Root_CA.pem
/etc/ssl/certs/ca-certificates.crt
21609PSTORAGE_CERTSBIN

══╣ Writable ssh and gpg agents
/etc/systemd/user/sockets.target.wants/gpg-agent-ssh.socket                                                                                                  
/etc/systemd/user/sockets.target.wants/gpg-agent-extra.socket
/etc/systemd/user/sockets.target.wants/gpg-agent.socket
/etc/systemd/user/sockets.target.wants/gpg-agent-browser.socket
══╣ Some home ssh config file was found
/usr/share/openssh/sshd_config                                                                                                                               
Include /etc/ssh/sshd_config.d/*.conf
ChallengeResponseAuthentication no
UsePAM yes
X11Forwarding yes
PrintMotd no
AcceptEnv LANG LC_*
Subsystem       sftp    /usr/lib/openssh/sftp-server

══╣ /etc/hosts.allow file found, trying to read the rules:
/etc/hosts.allow                                                                                                                                             


Searching inside /etc/ssh/ssh_config for interesting info
Include /etc/ssh/ssh_config.d/*.conf
Host *
    SendEnv LANG LC_*
    HashKnownHosts yes
    GSSAPIAuthentication yes

╔══════════╣ Analyzing PAM Auth Files (limit 70)
drwxr-xr-x 2 root root 4096 Dec  7  2021 /etc/pam.d                                                                                                          
-rw-r--r-- 1 root root 2133 Mar  9  2021 /etc/pam.d/sshd
account    required     pam_nologin.so
session [success=ok ignore=ignore module_unknown=ignore default=bad]        pam_selinux.so close
session    required     pam_loginuid.so
session    optional     pam_keyinit.so force revoke
session    optional     pam_motd.so  motd=/run/motd.dynamic
session    optional     pam_motd.so noupdate
session    optional     pam_mail.so standard noenv # [1]
session    required     pam_limits.so
session    required     pam_env.so # [1]
session    required     pam_env.so user_readenv=1 envfile=/etc/default/locale
session [success=ok ignore=ignore module_unknown=ignore default=bad]        pam_selinux.so open




╔══════════╣ Searching tmux sessions
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#open-shell-sessions                                                                       
tmux 3.0a                                                                                                                                                    


/tmp/tmux-1001
╔══════════╣ Analyzing Keyring Files (limit 70)
drwxr-xr-x 2 root root 4096 Jan  3  2022 /usr/share/keyrings                                                                                                 




╔══════════╣ Analyzing Backup Manager Files (limit 70)
-rw-r--r-- 1 root root 14844 Mar  4  2020 /usr/share/php/DB/storage.php                                                                                      

-rw-r--r-- 1 matt matt 2222 Jan  3  2020 /var/www/pandora/pandora_console/include/help/en/help_history_database.php
<i>Mysql Example: GRANT ALL PRIVILEGES ON pandora.* TO 'pandora'@'IP' IDENTIFIED BY 'password'</i>
-rw-r--r-- 1 matt matt 2666 Jan  3  2020 /var/www/pandora/pandora_console/include/help/es/help_history_database.php
<i>Mysql Example: GRANT ALL PRIVILEGES ON pandora.* TO 'pandora'@'IP' IDENTIFIED BY 'password'</i>
-rw-r--r-- 1 matt matt 3159 Jan  3  2020 /var/www/pandora/pandora_console/include/help/ja/help_history_database.php
<i>Mysql Example: GRANT ALL PRIVILEGES ON pandora.* TO 'pandora'@'IP' IDENTIFIED BY 'password'</i>

╔══════════╣ Searching uncommon passwd files (splunk)
passwd file: /etc/pam.d/passwd                                                                                                                               
passwd file: /etc/passwd
passwd file: /usr/share/bash-completion/completions/passwd
passwd file: /usr/share/lintian/overrides/passwd

╔══════════╣ Analyzing Github Files (limit 70)
drwxr-xr-x 2 matt matt 4096 Dec  7  2021 /var/www/pandora/pandora_console/vendor/mpdf/mpdf/.github                                                           
drwxr-xr-x 2 matt matt 4096 Dec  7  2021 /var/www/pandora/pandora_console/vendor/swiftmailer/swiftmailer/.github




╔══════════╣ Analyzing PGP-GPG Files (limit 70)
/usr/bin/gpg                                                                                                                                                 
netpgpkeys Not Found
netpgp Not Found                                                                                                                                             
                                                                                                                                                             
-rw-r--r-- 1 root root 641 Apr 23  2020 /etc/apt/trusted.gpg.d/microsoft-prod.gpg
-rw-r--r-- 1 root root 2796 Mar 29  2021 /etc/apt/trusted.gpg.d/ubuntu-keyring-2012-archive.gpg
-rw-r--r-- 1 root root 2794 Mar 29  2021 /etc/apt/trusted.gpg.d/ubuntu-keyring-2012-cdimage.gpg
-rw-r--r-- 1 root root 1733 Mar 29  2021 /etc/apt/trusted.gpg.d/ubuntu-keyring-2018-archive.gpg
-rw-r--r-- 1 root root 641 Apr 23  2020 /usr/share/doc/packages-microsoft-prod/microsoft-prod.gpg
-rw-r--r-- 1 root root 3267 Jan  6  2021 /usr/share/gnupg/distsigkey.gpg
-rw-r--r-- 1 root root 2247 Nov 10  2021 /usr/share/keyrings/ubuntu-advantage-cc-eal.gpg
-rw-r--r-- 1 root root 2274 Jul 16  2021 /usr/share/keyrings/ubuntu-advantage-cis.gpg
-rw-r--r-- 1 root root 2236 Jul 13  2021 /usr/share/keyrings/ubuntu-advantage-esm-apps.gpg
-rw-r--r-- 1 root root 2264 Jul 13  2021 /usr/share/keyrings/ubuntu-advantage-esm-infra-trusty.gpg
-rw-r--r-- 1 root root 2275 Jul 16  2021 /usr/share/keyrings/ubuntu-advantage-fips.gpg
-rw-r--r-- 1 root root 2235 Oct  5  2021 /usr/share/keyrings/ubuntu-advantage-ros.gpg
-rw-r--r-- 1 root root 7399 Sep 17  2018 /usr/share/keyrings/ubuntu-archive-keyring.gpg
-rw-r--r-- 1 root root 6713 Oct 27  2016 /usr/share/keyrings/ubuntu-archive-removed-keys.gpg
-rw-r--r-- 1 root root 4097 Feb  6  2018 /usr/share/keyrings/ubuntu-cloudimage-keyring.gpg
-rw-r--r-- 1 root root 0 Jan 17  2018 /usr/share/keyrings/ubuntu-cloudimage-removed-keys.gpg
-rw-r--r-- 1 root root 1227 May 27  2010 /usr/share/keyrings/ubuntu-master-keyring.gpg
-rw-r--r-- 1 root root 2867 Feb 13  2020 /usr/share/popularity-contest/debian-popcon.gpg


╔══════════╣ Searching docker files (limit 70)
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation/docker-breakout/docker-breakout-privilege-escalation                                      
-rw-r--r-- 1 matt matt 1263 Jan  3  2020 /var/www/pandora/pandora_console/Dockerfile                                                                         


╔══════════╣ Analyzing SNMP Files (limit 70)
-rw------- 1 root root 2960 Jun 16  2021 /etc/snmp/snmpd.conf                                                                                                
-rw------- 1 Debian-snmp Debian-snmp 1074 Dec 14 14:11 /var/lib/snmp/snmpd.conf

╔══════════╣ Analyzing Postfix Files (limit 70)
-rw-r--r-- 1 root root 813 Feb  2  2020 /usr/share/bash-completion/completions/postfix                                                                       


╔══════════╣ Analyzing FTP Files (limit 70)
                                                                                                                                                             


-rw-r--r-- 1 root root 69 Oct  6  2020 /etc/php/7.4/mods-available/ftp.ini
-rw-r--r-- 1 root root 69 Nov 25  2021 /usr/share/php7.4-common/common/ftp.ini






╔══════════╣ Analyzing DNS Files (limit 70)
-rw-r--r-- 1 root root 832 Feb  2  2020 /usr/share/bash-completion/completions/bind                                                                          
-rw-r--r-- 1 root root 832 Feb  2  2020 /usr/share/bash-completion/completions/bind




╔══════════╣ Analyzing Windows Files (limit 70)
                                                                                                                                                             





















lrwxrwxrwx 1 root root 22 Jun 11  2021 /etc/alternatives/my.cnf -> /etc/mysql/mariadb.cnf
lrwxrwxrwx 1 root root 24 Jun 11  2021 /etc/mysql/my.cnf -> /etc/alternatives/my.cnf
-rw-r--r-- 1 root root 83 Dec  7  2021 /var/lib/dpkg/alternatives/my.cnf





























╔══════════╣ Analyzing Other Interesting Files (limit 70)
-rw-r--r-- 1 root root 3771 Feb 25  2020 /etc/skel/.bashrc                                                                                                   
-rw-r--r-- 1 daniel daniel 3771 Feb 25  2020 /home/daniel/.bashrc
-rw-r--r-- 1 matt matt 3771 Feb 25  2020 /home/matt/.bashrc





-rw-r--r-- 1 root root 807 Feb 25  2020 /etc/skel/.profile
-rw-r--r-- 1 daniel daniel 807 Feb 25  2020 /home/daniel/.profile
-rw-r--r-- 1 matt matt 807 Feb 25  2020 /home/matt/.profile






                      ╔════════════════════════════════════╗
══════════════════════╣ Files with Interesting Permissions ╠══════════════════════                                                                           
                      ╚════════════════════════════════════╝                                                                                                 
╔══════════╣ SUID - Check easy privesc, exploits and write perms
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#sudo-and-suid                                                                             
strings Not Found                                                                                                                                            
-rwsr-xr-x 1 root root 163K Jan 19  2021 /usr/bin/sudo  --->  check_if_the_sudo_version_is_vulnerable                                                        
-rwsr-xr-x 1 root root 31K May 26  2021 /usr/bin/pkexec  --->  Linux4.10_to_5.1.17(CVE-2019-13272)/rhel_6(CVE-2011-1485)
-rwsr-xr-x 1 root root 84K Jul 14  2021 /usr/bin/chfn  --->  SuSE_9.3/10
-rwsr-xr-x 1 root root 44K Jul 14  2021 /usr/bin/newgrp  --->  HP-UX_10.20
-rwsr-xr-x 1 root root 87K Jul 14  2021 /usr/bin/gpasswd
-rwsr-xr-x 1 root root 39K Jul 21  2020 /usr/bin/umount  --->  BSD/Linux(08-1996)
-rwsr-x--- 1 root matt 17K Dec  3  2021 /usr/bin/pandora_backup (Unknown SUID binary!)
-rwsr-xr-x 1 root root 67K Jul 14  2021 /usr/bin/passwd  --->  Apple_Mac_OSX(03-2006)/Solaris_8/9(12-2004)/SPARC_8/9/Sun_Solaris_2.3_to_2.5.1(02-1997)
-rwsr-xr-x 1 root root 55K Jul 21  2020 /usr/bin/mount  --->  Apple_Mac_OSX(Lion)_Kernel_xnu-1699.32.7_except_xnu-1699.24.8
-rwsr-xr-x 1 root root 67K Jul 21  2020 /usr/bin/su
-rwsr-sr-x 1 daemon daemon 55K Nov 12  2018 /usr/bin/at  --->  RTru64_UNIX_4.0g(CVE-2002-1614)
-rwsr-xr-x 1 root root 39K Mar  7  2020 /usr/bin/fusermount
-rwsr-xr-x 1 root root 52K Jul 14  2021 /usr/bin/chsh
-rwsr-xr-x 1 root root 463K Jul 23  2021 /usr/lib/openssh/ssh-keysign
-rwsr-xr-- 1 root messagebus 51K Jun 11  2020 /usr/lib/dbus-1.0/dbus-daemon-launch-helper
-rwsr-xr-x 1 root root 15K Jul  8  2019 /usr/lib/eject/dmcrypt-get-device
-rwsr-xr-x 1 root root 23K May 26  2021 /usr/lib/policykit-1/polkit-agent-helper-1

╔══════════╣ SGID
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#sudo-and-suid                                                                             
-rwxr-sr-x 1 root tty 15K Mar 30  2020 /usr/bin/bsd-write                                                                                                    
-rwxr-sr-x 1 root ssh 343K Jul 23  2021 /usr/bin/ssh-agent
-rwxr-sr-x 1 root shadow 83K Jul 14  2021 /usr/bin/chage
-rwxr-sr-x 1 root crontab 43K Feb 13  2020 /usr/bin/crontab
-rwxr-sr-x 1 root shadow 31K Jul 14  2021 /usr/bin/expiry
-rwsr-sr-x 1 daemon daemon 55K Nov 12  2018 /usr/bin/at  --->  RTru64_UNIX_4.0g(CVE-2002-1614)
-rwxr-sr-x 1 root tty 35K Jul 21  2020 /usr/bin/wall
-rwxr-sr-x 1 root utmp 15K Sep 30  2019 /usr/lib/x86_64-linux-gnu/utempter/utempter
-rwxr-sr-x 1 root shadow 43K Sep 17  2021 /usr/sbin/pam_extrausers_chkpwd
-rwxr-sr-x 1 root shadow 43K Sep 17  2021 /usr/sbin/unix_chkpwd

╔══════════╣ Checking misconfigurations of ld.so
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#ld.so                                                                                     
/etc/ld.so.conf                                                                                                                                              
Content of /etc/ld.so.conf:                                                                                                                                  
include /etc/ld.so.conf.d/*.conf

/etc/ld.so.conf.d
  /etc/ld.so.conf.d/libc.conf                                                                                                                                
  - /usr/local/lib                                                                                                                                           
  /etc/ld.so.conf.d/x86_64-linux-gnu.conf
  - /usr/local/lib/x86_64-linux-gnu                                                                                                                          
  - /lib/x86_64-linux-gnu
  - /usr/lib/x86_64-linux-gnu

/etc/ld.so.preload
╔══════════╣ Capabilities                                                                                                                                    
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#capabilities                                                                              
══╣ Current shell capabilities                                                                                                                               
CapInh:  0x0000000000000000=                                                                                                                                 
CapPrm:  0x0000000000000000=
CapEff:  0x0000000000000000=
CapBnd:  0x0000003fffffffff=cap_chown,cap_dac_override,cap_dac_read_search,cap_fowner,cap_fsetid,cap_kill,cap_setgid,cap_setuid,cap_setpcap,cap_linux_immutable,cap_net_bind_service,cap_net_broadcast,cap_net_admin,cap_net_raw,cap_ipc_lock,cap_ipc_owner,cap_sys_module,cap_sys_rawio,cap_sys_chroot,cap_sys_ptrace,cap_sys_pacct,cap_sys_admin,cap_sys_boot,cap_sys_nice,cap_sys_resource,cap_sys_time,cap_sys_tty_config,cap_mknod,cap_lease,cap_audit_write,cap_audit_control,cap_setfcap,cap_mac_override,cap_mac_admin,cap_syslog,cap_wake_alarm,cap_block_suspend,cap_audit_read
CapAmb:  0x0000000000000000=

══╣ Parent process capabilities
CapInh:  0x0000000000000000=                                                                                                                                 
CapPrm:  0x0000000000000000=
CapEff:  0x0000000000000000=
CapBnd:  0x0000003fffffffff=cap_chown,cap_dac_override,cap_dac_read_search,cap_fowner,cap_fsetid,cap_kill,cap_setgid,cap_setuid,cap_setpcap,cap_linux_immutable,cap_net_bind_service,cap_net_broadcast,cap_net_admin,cap_net_raw,cap_ipc_lock,cap_ipc_owner,cap_sys_module,cap_sys_rawio,cap_sys_chroot,cap_sys_ptrace,cap_sys_pacct,cap_sys_admin,cap_sys_boot,cap_sys_nice,cap_sys_resource,cap_sys_time,cap_sys_tty_config,cap_mknod,cap_lease,cap_audit_write,cap_audit_control,cap_setfcap,cap_mac_override,cap_mac_admin,cap_syslog,cap_wake_alarm,cap_block_suspend,cap_audit_read
CapAmb:  0x0000000000000000=


Files with capabilities (limited to 50):
/usr/bin/traceroute6.iputils = cap_net_raw+ep
/usr/bin/ping = cap_net_raw+ep
/usr/bin/mtr-packet = cap_net_raw+ep
/usr/lib/x86_64-linux-gnu/gstreamer1.0/gstreamer-1.0/gst-ptp-helper = cap_net_bind_service,cap_net_admin+ep

╔══════════╣ Users with capabilities
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#capabilities                                                                              
                                                                                                                                                             
╔══════════╣ AppArmor binary profiles
-rw-r--r-- 1 root root 3222 Mar 11  2020 sbin.dhclient                                                                                                       
-rw-r--r-- 1 root root 3202 Feb 25  2020 usr.bin.man
-rw-r--r-- 1 root root  730 May  9  2021 usr.sbin.mysqld
-rw-r--r-- 1 root root 1575 Feb 11  2020 usr.sbin.rsyslogd
-rw-r--r-- 1 root root 1385 Dec  7  2019 usr.sbin.tcpdump

╔══════════╣ Files with ACLs (limited to 50)
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#acls                                                                                      
files with acls in searched folders Not Found                                                                                                                
                                                                                                                                                             
╔══════════╣ Files (scripts) in /etc/profile.d/
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#profiles-files                                                                            
total 32                                                                                                                                                     
drwxr-xr-x   2 root root 4096 Dec  7  2021 .
drwxr-xr-x 105 root root 4096 Jan  3  2022 ..
-rw-r--r--   1 root root   96 Dec  5  2019 01-locale-fix.sh
-rw-r--r--   1 root root  729 Feb  2  2020 bash_completion.sh
-rw-r--r--   1 root root 1003 Aug 13  2019 cedilla-portuguese.sh
-rw-r--r--   1 root root 1107 Nov  3  2019 gawk.csh
-rw-r--r--   1 root root  757 Nov  3  2019 gawk.sh
-rw-r--r--   1 root root 1557 Feb 17  2020 Z97-byobu.sh

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
/home/matt/user.txt
/root/
/var/www
/var/www/html
/var/www/html/assets
/var/www/html/assets/js
/var/www/html/assets/js/wow.min.js
/var/www/html/assets/js/main.js
/var/www/html/assets/js/bootstrap.bundle.min.js
/var/www/html/assets/css
/var/www/html/assets/css/ud-styles.css.map
/var/www/html/assets/css/animate.css
/var/www/html/assets/css/bootstrap.min.css
/var/www/html/assets/css/ud-styles.css
/var/www/html/assets/css/lineicons.css
/var/www/html/assets/images
/var/www/html/assets/images/404
/var/www/html/assets/images/404/shape-1.svg
/var/www/html/assets/images/404/dotted-shape.svg
/var/www/html/assets/images/404/shape-2.svg
/var/www/html/assets/images/team
/var/www/html/assets/images/team/team-04.png
/var/www/html/assets/images/team/dotted-shape.svg
/var/www/html/assets/images/team/shape-2.svg
/var/www/html/assets/images/team/team-02.png
/var/www/html/assets/images/team/team-03.png
/var/www/html/assets/images/team/team-01.png
/var/www/html/assets/images/faq
/var/www/html/assets/images/faq/shape.svg

╔══════════╣ Searching folders owned by me containing others files on it (limit 100)
                                                                                                                                                             
╔══════════╣ Readable files belonging to root and readable by me but not world readable
                                                                                                                                                             
╔══════════╣ Interesting writable files owned by me or writable by everyone (not in Home) (max 500)
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#writable-files                                                                            
/dev/mqueue                                                                                                                                                  
/dev/shm
/home/daniel
/run/lock
/run/screen
/run/user/1001
/run/user/1001/gnupg
/run/user/1001/inaccessible
/run/user/1001/systemd
/run/user/1001/systemd/units
/tmp
/tmp/.font-unix
/tmp/.ICE-unix
/tmp/.Test-unix
/tmp/tmux-1001
/tmp/.X11-unix
#)You_can_write_even_more_files_inside_last_directory

/var/crash
/var/lib/php/sessions
/var/tmp

╔══════════╣ Interesting GROUP writable files (not in Home) (max 500)
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#writable-files                                                                            
                                                                                                                                                             


                            ╔═════════════════════════╗
════════════════════════════╣ Other Interesting Files ╠════════════════════════════                                                                          
                            ╚═════════════════════════╝                                                                                                      
╔══════════╣ .sh files in path
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#script-binaries-in-path                                                                   
/usr/bin/gettext.sh                                                                                                                                          
/usr/bin/rescan-scsi-bus.sh
/usr/bin/gvmap.sh

╔══════════╣ Executable files potentially added by user (limit 70)
2021-11-23+11:50:55.3502553910 /etc/console-setup/cached_setup_terminal.sh                                                                                   
2021-11-23+11:50:55.3502553910 /etc/console-setup/cached_setup_font.sh
2021-11-23+11:50:55.3462554010 /etc/console-setup/cached_setup_keyboard.sh
2021-06-17+18:52:51.7632706700 /usr/bin/host_check

╔══════════╣ Unexpected in root
                                                                                                                                                             
╔══════════╣ Modified interesting files in the last 5mins (limit 100)
/home/daniel/.gnupg/pubring.kbx                                                                                                                              
/home/daniel/.gnupg/trustdb.gpg
/var/log/kern.log
/var/log/journal/8f30e8bf6a5741819a9c227e2c2ac617/user-1001.journal
/var/log/journal/8f30e8bf6a5741819a9c227e2c2ac617/system.journal
/var/log/auth.log
/var/log/syslog

╔══════════╣ Writable log files (logrotten) (limit 50)
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#logrotate-exploitation                                                                    
logrotate 3.14.0                                                                                                                                             

    Default mail command:       /usr/bin/mail
    Default compress command:   /bin/gzip
    Default uncompress command: /bin/gunzip
    Default compress extension: .gz
    Default state file path:    /var/lib/logrotate/status
    ACL support:                yes
    SELinux support:            yes

╔══════════╣ Files inside /home/daniel (limit 20)
total 3192                                                                                                                                                   
drwxr-xr-x 5 daniel daniel    4096 Dec 15 04:53 .
drwxr-xr-x 4 root   root      4096 Dec  7  2021 ..
lrwxrwxrwx 1 daniel daniel       9 Jun 11  2021 .bash_history -> /dev/null
-rw-r--r-- 1 daniel daniel     220 Feb 25  2020 .bash_logout
-rw-r--r-- 1 daniel daniel    3771 Feb 25  2020 .bashrc
drwx------ 2 daniel daniel    4096 Dec 14 14:35 .cache
drwx------ 3 daniel daniel    4096 Dec 15 04:53 .gnupg
-rwxr-xr-x 1 daniel daniel 3235784 Dec 14 01:23 linpeas_linux_amd64
-rw-r--r-- 1 daniel daniel     807 Feb 25  2020 .profile
drwx------ 2 daniel daniel    4096 Dec 14 14:54 .ssh

╔══════════╣ Files inside others home (limit 20)
/home/matt/.bash_logout                                                                                                                                      
/home/matt/.profile
/home/matt/user.txt
/home/matt/.bashrc
/var/www/html/assets/js/wow.min.js
/var/www/html/assets/js/main.js
/var/www/html/assets/js/bootstrap.bundle.min.js
/var/www/html/assets/css/ud-styles.css.map
/var/www/html/assets/css/animate.css
/var/www/html/assets/css/bootstrap.min.css
/var/www/html/assets/css/ud-styles.css
/var/www/html/assets/css/lineicons.css
/var/www/html/assets/images/404/shape-1.svg
/var/www/html/assets/images/404/dotted-shape.svg
/var/www/html/assets/images/404/shape-2.svg
/var/www/html/assets/images/team/team-04.png
/var/www/html/assets/images/team/dotted-shape.svg
/var/www/html/assets/images/team/shape-2.svg
/var/www/html/assets/images/team/team-02.png
/var/www/html/assets/images/team/team-03.png

╔══════════╣ Searching installed mail applications
                                                                                                                                                             
╔══════════╣ Mails (limit 50)
                                                                                                                                                             
╔══════════╣ Backup files (limited 100)
-rwxr-xr-x 1 root root 44071 Nov 21  2021 /usr/bin/wsrep_sst_mariabackup                                                                                     
-rwxr-xr-x 1 root root 1086 Nov 25  2019 /usr/src/linux-headers-5.4.0-74/tools/testing/selftests/net/tcp_fastopen_backup_key.sh
-rw-r--r-- 1 root root 0 Nov  5  2021 /usr/src/linux-headers-5.4.0-91-generic/include/config/wm831x/backup.h
-rw-r--r-- 1 root root 0 Nov  5  2021 /usr/src/linux-headers-5.4.0-91-generic/include/config/net/team/mode/activebackup.h
-rw-r--r-- 1 root root 237895 Nov  5  2021 /usr/src/linux-headers-5.4.0-91-generic/.config.old
-rwxr-xr-x 1 root root 1086 Nov 25  2019 /usr/src/linux-headers-5.4.0-91/tools/testing/selftests/net/tcp_fastopen_backup_key.sh
-rw-r--r-- 1 root root 0 May  8  2021 /usr/src/linux-headers-5.4.0-74-generic/include/config/wm831x/backup.h
-rw-r--r-- 1 root root 0 May  8  2021 /usr/src/linux-headers-5.4.0-74-generic/include/config/net/team/mode/activebackup.h
-rw-r--r-- 1 root root 237862 May  8  2021 /usr/src/linux-headers-5.4.0-74-generic/.config.old
-rw-r--r-- 1 root root 1775 Feb 25  2021 /usr/lib/python3/dist-packages/sos/report/plugins/ovirt_engine_backup.py
-rw-r--r-- 1 root root 1403 Dec  7  2021 /usr/lib/python3/dist-packages/sos/report/plugins/__pycache__/ovirt_engine_backup.cpython-38.pyc
-rw-r--r-- 1 root root 44048 Oct 12  2021 /usr/lib/x86_64-linux-gnu/open-vm-tools/plugins/vmsvc/libvmbackup.so
-rw-r--r-- 1 root root 9833 May  8  2021 /usr/lib/modules/5.4.0-74-generic/kernel/drivers/power/supply/wm831x_backup.ko
-rw-r--r-- 1 root root 9073 May  8  2021 /usr/lib/modules/5.4.0-74-generic/kernel/drivers/net/team/team_mode_activebackup.ko
-rw-r--r-- 1 root root 9833 Nov  5  2021 /usr/lib/modules/5.4.0-91-generic/kernel/drivers/power/supply/wm831x_backup.ko
-rw-r--r-- 1 root root 9073 Nov  5  2021 /usr/lib/modules/5.4.0-91-generic/kernel/drivers/net/team/team_mode_activebackup.ko
-rw-r--r-- 1 root root 348 Nov 21  2021 /usr/share/man/man1/wsrep_sst_mariabackup.1.gz
-rw-r--r-- 1 root root 2756 Feb 13  2020 /usr/share/man/man8/vgcfgbackup.8.gz
-rw-r--r-- 1 root root 7251 Mar 23  2020 /usr/share/nmap/scripts/http-config-backup.nse
-rw-r--r-- 1 root root 5484 Mar 23  2020 /usr/share/nmap/scripts/http-backup-finder.nse
-rw-r--r-- 1 root root 392817 Feb  9  2020 /usr/share/doc/manpages/Changes.old.gz
-rw-r--r-- 1 root root 7867 Jul 16  1996 /usr/share/doc/telnet/README.old.gz
-rwxr-xr-x 1 root root 226 Feb 17  2020 /usr/share/byobu/desktop/byobu.desktop.old
-rw-r--r-- 1 root root 11886 Dec  7  2021 /usr/share/info/dir.old
-rw-r--r-- 1 matt matt 4289 May 17  2019 /var/www/pandora/pandora_console/mobile/include/style/main.css.old
-rw-r--r-- 1 root root 2743 Feb  1  2021 /etc/apt/sources.list.curtin.old

╔══════════╣ Searching tables inside readable .db/.sql/.sqlite files (limit 100)
Found /var/lib/command-not-found/commands.db: SQLite 3.x database, last written using SQLite version 3031001                                                 
Found /var/lib/fwupd/pending.db: SQLite 3.x database, last written using SQLite version 3031001
Found /var/lib/PackageKit/transactions.db: SQLite 3.x database, last written using SQLite version 3031001

 -> Extracting tables from /var/lib/command-not-found/commands.db (limit 20)
 -> Extracting tables from /var/lib/fwupd/pending.db (limit 20)                                                                                              
 -> Extracting tables from /var/lib/PackageKit/transactions.db (limit 20)                                                                                    
                                                                                                                                                             
╔══════════╣ Web files?(output limit)
/var/www/:                                                                                                                                                   
total 16K
drwxr-xr-x  4 root root 4.0K Dec  7  2021 .
drwxr-xr-x 14 root root 4.0K Dec  7  2021 ..
drwxr-xr-x  3 root root 4.0K Dec  7  2021 html
drwxr-xr-x  3 matt matt 4.0K Dec  7  2021 pandora

/var/www/html:
total 48K
drwxr-xr-x 3 root root 4.0K Dec  7  2021 .

╔══════════╣ All relevant hidden files (not in /sys/ or the ones listed in the previous check) (limit 70)
-rw-r--r-- 1 root root 0 Dec 14 14:11 /run/network/.ifstate.lock                                                                                             
-rw-r--r-- 1 root root 0 Jul 28  2021 /usr/share/php/.lock
-rw-r--r-- 1 daniel daniel 220 Feb 25  2020 /home/daniel/.bash_logout
-rw-r--r-- 1 matt matt 220 Feb 25  2020 /home/matt/.bash_logout
-rw-r--r-- 1 matt matt 51 Jan  3  2020 /var/www/pandora/pandora_console/attachment/.htaccess
-rw-r--r-- 1 matt matt 196 Jun 17  2021 /var/www/pandora/pandora_console/attachment/.cron.supervisor.servers.idx
-rw-r--r-- 1 matt matt 516 Jan  3  2020 /var/www/pandora/pandora_console/vendor/swiftmailer/swiftmailer/.php_cs.dist
-rw-r--r-- 1 landscape landscape 0 Feb  1  2021 /var/lib/landscape/.cleanup.user
-rw-r--r-- 1 root root 220 Feb 25  2020 /etc/skel/.bash_logout
-rw------- 1 root root 0 Feb  1  2021 /etc/.pwd.lock

╔══════════╣ Readable files inside /tmp, /var/tmp, /private/tmp, /private/var/at/tmp, /private/var/tmp, and backup folders (limit 70)
-rw-r--r-- 1 root root 51200 Dec  7  2021 /var/backups/alternatives.tar.0                                                                                    

╔══════════╣ Searching passwords in history files
Binary file /var/www/pandora/pandora_console/images/database_history.png matches                                                                             
/var/www/pandora/pandora_console/include/help/en/help_history_database.php: * @package Include/help/en
/var/www/pandora/pandora_console/include/help/en/help_history_database.php:<i>cat pandoradb.sql | mysql -u user -p -D history_db</i>
/var/www/pandora/pandora_console/include/help/en/help_history_database.php:<i>Mysql Example: GRANT ALL PRIVILEGES ON pandora.* TO 'pandora'@'IP' IDENTIFIED BY 'password'</i>
/var/www/pandora/pandora_console/include/help/en/help_history_database.php:<li>In your <?php echo get_product_name(); ?>  console navigate to Setup->History database and enter the host, port, database name, user and password of the new database.
/var/www/pandora/pandora_console/include/help/en/help_history_database.php:   <b>Database password:</b> Password to access to history database. 
/var/www/pandora/pandora_console/include/help/es/help_history_database.php: * @package Include/help/es
/var/www/pandora/pandora_console/include/help/es/help_history_database.php:<i>cat pandoradb.sql | mysql -u user -p -D history_db</i>
/var/www/pandora/pandora_console/include/help/es/help_history_database.php:<i>Mysql Example: GRANT ALL PRIVILEGES ON pandora.* TO 'pandora'@'IP' IDENTIFIED BY 'password'</i>
/var/www/pandora/pandora_console/include/help/es/help_history_database.php:<li>En la consola de <?php echo get_product_name(); ?> vaya a Setup->History database y configure el host, port, database name, user y password de la nueva base de datos.
/var/www/pandora/pandora_console/include/help/es/help_history_database.php:   <b>Database password:</b> Password de la base de datos histórica. 
/var/www/pandora/pandora_console/include/help/ja/help_history_database.php: * @package Include/help/ja
/var/www/pandora/pandora_console/include/help/ja/help_history_database.php:<i>cat pandoradb.sql | mysql -u user -p -D history_db</i>
/var/www/pandora/pandora_console/include/help/ja/help_history_database.php:<i>Mysql Example: GRANT ALL PRIVILEGES ON pandora.* TO 'pandora'@'IP' IDENTIFIED BY 'password'</i>
/var/www/pandora/pandora_console/include/help/ja/help_history_database.php:   <b>データベースパスワード(Database password):</b> ヒストリデータベースへアクセスするパスワード。
Binary file /var/www/pandora/pandora_console/include/javascript/OpenLayers/theme/default/img/navigation_history.png matches

╔══════════╣ Searching passwords in config PHP files
/var/www/pandora/pandora_console/godmode/agentes/configure_field.php:    $is_password_type = $field['is_password_type'];                                     
/var/www/pandora/pandora_console/godmode/agentes/configure_field.php:$is_password_type = (bool) get_parameter('is_password_type', 0);
/var/www/pandora/pandora_console/godmode/users/configure_user.php:        $password_confirm = (string) get_parameter('password_confirm', '');
/var/www/pandora/pandora_console/godmode/users/configure_user.php:    $password_confirm = (string) get_parameter('password_confirm', '');
/var/www/pandora/pandora_console/godmode/users/configure_user.php:        $password_new = (string) get_parameter('password_new', '');
/var/www/pandora/pandora_console/godmode/users/configure_user.php:    $password_new = (string) get_parameter('password_new', '');
/var/www/pandora/pandora_console/godmode/users/configure_user.php:    } else if ($password_new != $password_confirm) {
/var/www/pandora/pandora_console/godmode/users/configure_user.php:            if ($password_confirm == $password_new) {
/var/www/pandora/pandora_console/include/config.inc.php:// $config["dbpass"]="pandora";
/var/www/pandora/pandora_console/include/config.inc.php:// $config["dbuser"]="pandora";
/var/www/pandora/pandora_console/include/help/en/help_history_database.php:   <b>Database password:</b> Password to access to history database. 
/var/www/pandora/pandora_console/include/help/es/help_history_database.php:   <b>Database password:</b> Password de la base de datos histórica. 
/var/www/pandora/pandora_console/include/help/ja/help_history_database.php:   <b>データベースパスワード(Database password):</b> ヒストリデータベースへアクセスするパスワード。

╔══════════╣ Searching *password* or *credential* files in home (limit 70)
/etc/pam.d/common-password                                                                                                                                   
/usr/bin/systemd-ask-password
/usr/bin/systemd-tty-ask-password-agent
/usr/lib/git-core/git-credential
/usr/lib/git-core/git-credential-cache
/usr/lib/git-core/git-credential-cache--daemon
/usr/lib/git-core/git-credential-store
  #)There are more creds/passwds files in the previous parent folder

/usr/lib/grub/i386-pc/password.mod
/usr/lib/grub/i386-pc/password_pbkdf2.mod
/usr/lib/python3/dist-packages/keyring/credentials.py
/usr/lib/python3/dist-packages/keyring/__pycache__/credentials.cpython-38.pyc
/usr/lib/python3/dist-packages/launchpadlib/credentials.py
/usr/lib/python3/dist-packages/launchpadlib/__pycache__/credentials.cpython-38.pyc
/usr/lib/python3/dist-packages/launchpadlib/tests/__pycache__/test_credential_store.cpython-38.pyc
/usr/lib/python3/dist-packages/launchpadlib/tests/test_credential_store.py
/usr/lib/python3/dist-packages/oauthlib/oauth2/rfc6749/grant_types/client_credentials.py
/usr/lib/python3/dist-packages/oauthlib/oauth2/rfc6749/grant_types/__pycache__/client_credentials.cpython-38.pyc
/usr/lib/python3/dist-packages/oauthlib/oauth2/rfc6749/grant_types/__pycache__/resource_owner_password_credentials.cpython-38.pyc
/usr/lib/python3/dist-packages/oauthlib/oauth2/rfc6749/grant_types/resource_owner_password_credentials.py
/usr/lib/python3/dist-packages/twisted/cred/credentials.py
/usr/lib/python3/dist-packages/twisted/cred/__pycache__/credentials.cpython-38.pyc
/usr/lib/systemd/systemd-reply-password
/usr/lib/systemd/system/multi-user.target.wants/systemd-ask-password-wall.path
/usr/lib/systemd/system/sysinit.target.wants/systemd-ask-password-console.path
/usr/lib/systemd/system/systemd-ask-password-console.path
/usr/lib/systemd/system/systemd-ask-password-console.service
/usr/lib/systemd/system/systemd-ask-password-plymouth.path
/usr/lib/systemd/system/systemd-ask-password-plymouth.service
  #)There are more creds/passwds files in the previous parent folder

/usr/share/doc/git/contrib/credential
/usr/share/doc/git/contrib/credential/gnome-keyring/git-credential-gnome-keyring.c
/usr/share/doc/git/contrib/credential/libsecret/git-credential-libsecret.c
/usr/share/doc/git/contrib/credential/netrc/git-credential-netrc
/usr/share/doc/git/contrib/credential/netrc/t-git-credential-netrc.sh
/usr/share/doc/git/contrib/credential/osxkeychain/git-credential-osxkeychain.c
/usr/share/doc/git/contrib/credential/wincred/git-credential-wincred.c
/usr/share/man/man1/git-credential.1.gz
/usr/share/man/man1/git-credential-cache.1.gz
/usr/share/man/man1/git-credential-cache--daemon.1.gz
/usr/share/man/man1/git-credential-store.1.gz
  #)There are more creds/passwds files in the previous parent folder

/usr/share/man/man7/gitcredentials.7.gz
/usr/share/man/man8/systemd-ask-password-console.path.8.gz
/usr/share/man/man8/systemd-ask-password-console.service.8.gz
/usr/share/man/man8/systemd-ask-password-wall.path.8.gz
/usr/share/man/man8/systemd-ask-password-wall.service.8.gz
  #)There are more creds/passwds files in the previous parent folder

/usr/share/nmap/nselib/data/passwords.lst
/usr/share/nmap/scripts/creds-summary.nse
/usr/share/nmap/scripts/http-domino-enum-passwords.nse
/usr/share/nmap/scripts/ms-sql-empty-password.nse
/usr/share/nmap/scripts/mysql-empty-password.nse
  #)There are more creds/passwds files in the previous parent folder

/usr/share/pam/common-password.md5sums
/var/cache/debconf/passwords.dat
/var/lib/cloud/instances/iid-datasource-none/sem/config_set_passwords
/var/lib/fwupd/pki/secret.key
/var/lib/pam/password
/var/www/pandora/pandora_console/godmode/groups/credential_store.php
/var/www/pandora/pandora_console/images/user_password.png
/var/www/pandora/pandora_console/include/functions_credential_store.php
/var/www/pandora/pandora_console/include/styles/credential_store.css
/var/www/pandora/pandora_console/vendor/swiftmailer/swiftmailer/tests/_samples/smime/ca.key
/var/www/pandora/pandora_console/vendor/swiftmailer/swiftmailer/tests/_samples/smime/encrypt2.key

╔══════════╣ Checking for TTY (sudo/su) passwords in audit logs
                                                                                                                                                             
╔══════════╣ Searching passwords inside logs (limit 70)
[    4.165468] systemd[1]: Started Forward Password Requests to Wall Directory Watch.                                                                        
Binary file /var/log/journal/8f30e8bf6a5741819a9c227e2c2ac617/user-1001.journal matches



                                ╔════════════════╗
════════════════════════════════╣ API Keys Regex ╠════════════════════════════════                                                                           
                                ╚════════════════╝                                                                                                           
Regexes to search for API keys aren't activated, use param '-r' 


```