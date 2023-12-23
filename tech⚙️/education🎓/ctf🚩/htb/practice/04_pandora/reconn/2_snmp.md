#snmp #snmpwalk

# Versions
**1**: unencrypted
**2c**: unencrypted - most commonly used as implementing version 3 is much harder
**3**: encrypted but hard to implement

# Community strings
Most commonly used `public`, `private`, or any custom string
Danger of `public`  is that anyone can guess and will try that first. Especially if there is write permission to it.
# Enable SNMP locally 
Take these two steps before trying any snmp walk:
```
# install snmp-mibs-downloader package
sudo apt install snmp-mibs-downloader

# comment out the line starting with mib
sed -i s/^mib/#mib/ /etc/snmp/snmp.conf
```

# Tools
#snmp_enum_tools #tools_for_snmp
## snmpwalk
```
snmpwalk -v2c -c public <ip>
```
## snmpbulkwalk
```
$ snmpbulkwalk -Cr1000 -c public -v2c <ip> .
              ^ concurrent
                        ^ community string
                                ^ version
                                           ^ with '.' it yeilds in more results
$ snmpbulkwalk -Cr1000 -c public -v2c <ip>
```

### Output  - interesting key prefixes
[Reference](https://help.genesys.com/pureconnect/mergedprojects/wh_tr/mergedprojects/wh_tr_snmp/desktop/hrswrun_objects.htm)
`hrSWRun...`: running processes on the snmp server
`hrSWInstalled...`: installed applications on the snmp server

## snmpcheck
GUI tool
## snmp-check
```
snmp-check 10.10.11.136 -c public  
```
## onesixtyone
#snmp_bruteforce #brute_force #community #snmp_community
```
$ onesixtyone <ip>
$ onesixtyone -i ips.txt

# Community brute force
$ onesixtyone -c usr/share/metasploit-framework/data/wordlists/snmp_default_pass.txt <ip>
```

# onesixtyone
```
$ onesixtyone 10.10.11.136                   
Scanning 1 hosts, 2 communities
10.10.11.136 [public] Linux pandora 5.4.0-91-generic #102-Ubuntu SMP Fri Nov 5 16:31:28 UTC 2021 x86_64
```
# snmp-check
```
$ snmp-check 10.10.11.136 -c public        
snmp-check v1.9 - SNMP enumerator
Copyright (c) 2005-2015 by Matteo Cantoni (www.nothink.org)

[+] Try to connect to 10.10.11.136:161 using SNMPv1 and community 'public'

[*] System information:

  Host IP address               : 10.10.11.136
  Hostname                      : pandora
  Description                   : Linux pandora 5.4.0-91-generic #102-Ubuntu SMP Fri Nov 5 16:31:28 UTC 2021 x86_64
  Contact                       : Daniel
  Location                      : Mississippi
  Uptime snmp                   : 13:30:14.07
  Uptime system                 : 13:30:05.54
  System date                   : 2023-12-15 03:41:37.0

[*] Network information:

  IP forwarding enabled         : no
  Default TTL                   : 64
  TCP segments received         : 449008
  TCP segments sent             : 484939
  TCP segments retrans          : 14957
  Input datagrams               : 520057
  Delivered datagrams           : 518841
  Output datagrams              : 508406

[*] Network interfaces:

  Interface                     : [ up ] lo
  Id                            : 1
  Mac Address                   : :::::
  Type                          : softwareLoopback
  Speed                         : 10 Mbps
  MTU                           : 65536
  In octets                     : 15805497
  Out octets                    : 15805497

  Interface                     : [ up ] VMware VMXNET3 Ethernet Controller
  Id                            : 2
  Mac Address                   : 00:50:56:b9:2f:17
  Type                          : ethernet-csmacd
  Speed                         : 4294 Mbps
  MTU                           : 1500
  In octets                     : 69776174
  Out octets                    : 292507600


[*] Network IP:

  Id                    IP Address            Netmask               Broadcast           
  2                     10.10.11.136          255.255.254.0         1                   
  1                     127.0.0.1             255.0.0.0             0                   

[*] Routing information:

  Destination           Next hop              Mask                  Metric              
  0.0.0.0               10.10.10.2            0.0.0.0               1                   
  10.10.10.0            0.0.0.0               255.255.254.0         0                   

[*] TCP connections and listening ports:

  Local address         Local port            Remote address        Remote port           State               
  0.0.0.0               22                    0.0.0.0               0                     listen              
  10.10.11.136          50792                 1.1.1.1               53                    synSent             
  127.0.0.1             3306                  0.0.0.0               0                     listen              
  127.0.0.53            53                    0.0.0.0               0                     listen              

[*] Listening UDP ports:

  Local address         Local port          
  0.0.0.0               161                 
  127.0.0.53            53                  

[*] Processes:

  Id                    Status                Name                  Path                  Parameters          
  1                     runnable              systemd               /sbin/init            maybe-ubiquity      
  2                     runnable              kthreadd                                                        
  3                     unknown               rcu_gp                                                          
  4                     unknown               rcu_par_gp                                                      
  6                     unknown               kworker/0:0H-kblockd                                            
  9                     unknown               mm_percpu_wq                                                    
  10                    runnable              ksoftirqd/0                                                     
  11                    unknown               rcu_sched                                                       
  12                    runnable              migration/0                                                     
  13                    runnable              idle_inject/0                                                   
  14                    runnable              cpuhp/0                                                         
  15                    runnable              cpuhp/1                                                         
  16                    runnable              idle_inject/1                                                   
  17                    runnable              migration/1                                                     
  18                    runnable              ksoftirqd/1                                                     
  20                    unknown               kworker/1:0H-kblockd                                            
  21                    runnable              kdevtmpfs                                                       
  22                    unknown               netns                                                           
  23                    runnable              rcu_tasks_kthre                                                 
  24                    runnable              kauditd                                                         
  25                    runnable              khungtaskd                                                      
  26                    runnable              oom_reaper                                                      
  27                    unknown               writeback                                                       
  28                    runnable              kcompactd0                                                      
  29                    runnable              ksmd                                                            
  30                    runnable              khugepaged                                                      
  77                    unknown               kintegrityd                                                     
  78                    unknown               kblockd                                                         
  79                    unknown               blkcg_punt_bio                                                  
  80                    unknown               tpm_dev_wq                                                      
  81                    unknown               ata_sff                                                         
  82                    unknown               md                                                              
  83                    unknown               edac-poller                                                     
  84                    unknown               devfreq_wq                                                      
  85                    runnable              watchdogd                                                       
  88                    runnable              kswapd0                                                         
  89                    runnable              ecryptfs-kthrea                                                 
  91                    unknown               kthrotld                                                        
  92                    runnable              irq/24-pciehp                                                   
  93                    runnable              irq/25-pciehp                                                   
  94                    runnable              irq/26-pciehp                                                   
  95                    runnable              irq/27-pciehp                                                   
  96                    runnable              irq/28-pciehp                                                   
  97                    runnable              irq/29-pciehp                                                   
  98                    runnable              irq/30-pciehp                                                   
  99                    runnable              irq/31-pciehp                                                   
  100                   runnable              irq/32-pciehp                                                   
  101                   runnable              irq/33-pciehp                                                   
  102                   runnable              irq/34-pciehp                                                   
  103                   runnable              irq/35-pciehp                                                   
  104                   runnable              irq/36-pciehp                                                   
  105                   runnable              irq/37-pciehp                                                   
  106                   runnable              irq/38-pciehp                                                   
  107                   runnable              irq/39-pciehp                                                   
  108                   runnable              irq/40-pciehp                                                   
  109                   runnable              irq/41-pciehp                                                   
  110                   runnable              irq/42-pciehp                                                   
  111                   runnable              irq/43-pciehp                                                   
  112                   runnable              irq/44-pciehp                                                   
  113                   runnable              irq/45-pciehp                                                   
  114                   runnable              irq/46-pciehp                                                   
  115                   runnable              irq/47-pciehp                                                   
  116                   runnable              irq/48-pciehp                                                   
  117                   runnable              irq/49-pciehp                                                   
  118                   runnable              irq/50-pciehp                                                   
  119                   runnable              irq/51-pciehp                                                   
  120                   runnable              irq/52-pciehp                                                   
  121                   runnable              irq/53-pciehp                                                   
  122                   runnable              irq/54-pciehp                                                   
  123                   runnable              irq/55-pciehp                                                   
  124                   unknown               acpi_thermal_pm                                                 
  125                   runnable              scsi_eh_0                                                       
  126                   unknown               scsi_tmf_0                                                      
  127                   runnable              scsi_eh_1                                                       
  128                   unknown               scsi_tmf_1                                                      
  130                   unknown               vfio-irqfd-clea                                                 
  131                   unknown               ipv6_addrconf                                                   
  141                   unknown               kstrp                                                           
  144                   unknown               kworker/u5:0                                                    
  157                   unknown               charger_manager                                                 
  202                   unknown               mpt_poll_0                                                      
  203                   unknown               mpt/0                                                           
  204                   runnable              scsi_eh_2                                                       
  205                   runnable              irq/16-vmwgfx                                                   
  206                   unknown               ttm_swap                                                        
  207                   unknown               scsi_tmf_2                                                      
  208                   runnable              scsi_eh_3                                                       
  209                   unknown               scsi_tmf_3                                                      
  217                   runnable              scsi_eh_4                                                       
  219                   unknown               scsi_tmf_4                                                      
  220                   runnable              scsi_eh_5                                                       
  224                   unknown               scsi_tmf_5                                                      
  229                   runnable              scsi_eh_6                                                       
  231                   unknown               scsi_tmf_6                                                      
  232                   runnable              scsi_eh_7                                                       
  233                   unknown               scsi_tmf_7                                                      
  235                   unknown               cryptd                                                          
  236                   runnable              scsi_eh_8                                                       
  237                   unknown               scsi_tmf_8                                                      
  238                   runnable              scsi_eh_9                                                       
  239                   unknown               scsi_tmf_9                                                      
  240                   runnable              scsi_eh_10                                                      
  241                   unknown               scsi_tmf_10                                                     
  242                   runnable              scsi_eh_11                                                      
  243                   unknown               scsi_tmf_11                                                     
  247                   runnable              scsi_eh_12                                                      
  249                   unknown               scsi_tmf_12                                                     
  250                   runnable              scsi_eh_13                                                      
  251                   unknown               scsi_tmf_13                                                     
  252                   runnable              scsi_eh_14                                                      
  263                   unknown               scsi_tmf_14                                                     
  264                   runnable              scsi_eh_15                                                      
  267                   unknown               scsi_tmf_15                                                     
  268                   runnable              scsi_eh_16                                                      
  269                   unknown               scsi_tmf_16                                                     
  271                   runnable              scsi_eh_17                                                      
  272                   unknown               scsi_tmf_17                                                     
  273                   runnable              scsi_eh_18                                                      
  274                   unknown               scsi_tmf_18                                                     
  276                   runnable              scsi_eh_19                                                      
  277                   unknown               scsi_tmf_19                                                     
  278                   runnable              scsi_eh_20                                                      
  279                   unknown               scsi_tmf_20                                                     
  280                   runnable              scsi_eh_21                                                      
  281                   unknown               scsi_tmf_21                                                     
  282                   runnable              scsi_eh_22                                                      
  283                   unknown               scsi_tmf_22                                                     
  284                   runnable              scsi_eh_23                                                      
  285                   unknown               scsi_tmf_23                                                     
  286                   runnable              scsi_eh_24                                                      
  287                   unknown               scsi_tmf_24                                                     
  288                   runnable              scsi_eh_25                                                      
  289                   unknown               scsi_tmf_25                                                     
  290                   runnable              scsi_eh_26                                                      
  291                   unknown               scsi_tmf_26                                                     
  292                   runnable              scsi_eh_27                                                      
  293                   unknown               scsi_tmf_27                                                     
  294                   runnable              scsi_eh_28                                                      
  295                   unknown               scsi_tmf_28                                                     
  296                   runnable              scsi_eh_29                                                      
  297                   unknown               scsi_tmf_29                                                     
  298                   runnable              scsi_eh_30                                                      
  299                   unknown               scsi_tmf_30                                                     
  300                   runnable              scsi_eh_31                                                      
  301                   unknown               scsi_tmf_31                                                     
  330                   runnable              scsi_eh_32                                                      
  331                   unknown               scsi_tmf_32                                                     
  332                   unknown               kworker/1:1H-kblockd                                            
  343                   unknown               kdmflush                                                        
  344                   unknown               kdmflush                                                        
  376                   unknown               raid5wq                                                         
  417                   unknown               kworker/0:1H-kblockd                                            
  431                   runnable              jbd2/dm-0-8                                                     
  432                   unknown               ext4-rsv-conver                                                 
  489                   runnable              systemd-journal       /lib/systemd/systemd-journald                      
  515                   runnable              systemd-udevd         /lib/systemd/systemd-udevd                      
  534                   runnable              systemd-network       /lib/systemd/systemd-networkd                      
  657                   unknown               kaluad                                                          
  658                   unknown               kmpath_rdacd                                                    
  659                   unknown               kmpathd                                                         
  660                   unknown               kmpath_handlerd                                                 
  661                   runnable              multipathd            /sbin/multipathd      -d -s               
  669                   runnable              jbd2/sda2-8                                                     
  670                   unknown               ext4-rsv-conver                                                 
  684                   runnable              systemd-resolve       /lib/systemd/systemd-resolved                      
  685                   runnable              systemd-timesyn       /lib/systemd/systemd-timesyncd                      
  699                   runnable              VGAuthService         /usr/bin/VGAuthService                      
  710                   runnable              vmtoolsd              /usr/bin/vmtoolsd                         
  759                   runnable              accounts-daemon       /usr/lib/accountsservice/accounts-daemon                      
  777                   runnable              cron                  /usr/sbin/cron        -f                  
  785                   runnable              dbus-daemon           /usr/bin/dbus-daemon  --system --address=systemd: --nofork --nopidfile --systemd-activation --syslog-only
  790                   runnable              cron                  /usr/sbin/CRON        -f                  
  800                   runnable              sh                    /bin/sh               -c sleep 30; /bin/bash -c '/usr/bin/host_check -u daniel -p HotelBabylon23'
  805                   runnable              irqbalance            /usr/sbin/irqbalance  --foreground        
  814                   runnable              networkd-dispat       /usr/bin/python3      /usr/bin/networkd-dispatcher --run-startup-triggers
  820                   runnable              rsyslogd              /usr/sbin/rsyslogd    -n -iNONE           
  827                   runnable              systemd-logind        /lib/systemd/systemd-logind                      
  829                   runnable              udisksd               /usr/lib/udisks2/udisksd                      
  830                   runnable              atd                   /usr/sbin/atd         -f                  
  834                   running               snmpd                 /usr/sbin/snmpd       -LOw -u Debian-snmp -g Debian-snmp -I -smux mteTrigger mteTriggerConf -f -p /run/snmpd.pid
  835                   runnable              apache2               /usr/sbin/apache2     -k start            
  843                   runnable              sshd                  sshd: /usr/sbin/sshd -D [listener] 0 of 10-100 startups                      
  939                   runnable              polkitd               /usr/lib/policykit-1/polkitd  --no-debug          
  957                   runnable              agetty                /sbin/agetty          -o -p -- \u --noclear tty1 linux
  961                   runnable              mysqld                /usr/sbin/mysqld                          
  1114                  runnable              host_check            /usr/bin/host_check   -u daniel -p HotelBabylon23
  6173                  runnable              upowerd               /usr/lib/upower/upowerd                      
  7830                  unknown               kworker/0:1-events                                              
  8399                  runnable              apache2               /usr/sbin/apache2     -k start            
  10579                 unknown               kworker/1:2-events                                              
  14931                 runnable              apache2               /usr/sbin/apache2     -k start            
  15090                 runnable              apache2               /usr/sbin/apache2     -k start            
  15492                 runnable              apache2               /usr/sbin/apache2     -k start            
  15876                 runnable              apache2               /usr/sbin/apache2     -k start            
  18262                 unknown               kworker/u4:2-events_power_efficient                                            
  18515                 runnable              apache2               /usr/sbin/apache2     -k start            
  18897                 runnable              apache2               /usr/sbin/apache2     -k start            
  18901                 runnable              apache2               /usr/sbin/apache2     -k start            
  18916                 runnable              apache2               /usr/sbin/apache2     -k start            
  18929                 runnable              apache2               /usr/sbin/apache2     -k start            
  21016                 unknown               kworker/u4:0-events_power_efficient                                            
  21130                 unknown               kworker/0:0                                                     
  21131                 unknown               kworker/1:0                                                     

[*] Storage information:

  Description                   : ["Physical memory"]
  Device id                     : [#<SNMP::Integer:0x00007f1b0a437b10 @value=1>]
  Filesystem type               : ["unknown"]
  Device unit                   : [#<SNMP::Integer:0x00007f1b0a435f68 @value=1024>]
  Memory size                   : 3.84 GB
  Memory used                   : 841.79 MB

  Description                   : ["Virtual memory"]
  Device id                     : [#<SNMP::Integer:0x00007f1b0a431030 @value=3>]
  Filesystem type               : ["unknown"]
  Device unit                   : [#<SNMP::Integer:0x00007f1b0a42f460 @value=1024>]
  Memory size                   : 4.51 GB
  Memory used                   : 841.79 MB

  Description                   : ["Memory buffers"]
  Device id                     : [#<SNMP::Integer:0x00007f1b0a42a690 @value=6>]
  Filesystem type               : ["unknown"]
  Device unit                   : [#<SNMP::Integer:0x00007f1b0a428ae8 @value=1024>]
  Memory size                   : 3.84 GB
  Memory used                   : 38.18 MB

  Description                   : ["Cached memory"]
  Device id                     : [#<SNMP::Integer:0x00007f1b0a423cf0 @value=7>]
  Filesystem type               : ["unknown"]
  Device unit                   : [#<SNMP::Integer:0x00007f1b0a422148 @value=1024>]
  Memory size                   : 465.50 MB
  Memory used                   : 465.50 MB

  Description                   : ["Shared memory"]
  Device id                     : [#<SNMP::Integer:0x00007f1b0a41d378 @value=8>]
  Filesystem type               : ["unknown"]
  Device unit                   : [#<SNMP::Integer:0x00007f1b0a41b7a8 @value=1024>]
  Memory size                   : 3.58 MB
  Memory used                   : 3.58 MB

  Description                   : ["Swap space"]
  Device id                     : [#<SNMP::Integer:0x00007f1b0a416a28 @value=10>]
  Filesystem type               : ["unknown"]
  Device unit                   : [#<SNMP::Integer:0x00007f1b0a414e80 @value=1024>]
  Memory size                   : 680.00 MB
  Memory used                   : 0 bytes

  Description                   : ["/run"]
  Device id                     : [#<SNMP::Integer:0x00007f1b0a410128 @value=35>]
  Filesystem type               : ["unknown"]
  Device unit                   : [#<SNMP::Integer:0x00007f1b0a40e558 @value=4096>]
  Memory size                   : 393.61 MB
  Memory used                   : 1.06 MB

  Description                   : ["/"]
  Device id                     : [#<SNMP::Integer:0x00007f1b0a4097d8 @value=36>]
  Filesystem type               : ["unknown"]
  Device unit                   : [#<SNMP::Integer:0x00007f1b0a407c08 @value=4096>]
  Memory size                   : 4.87 GB
  Memory used                   : 3.10 GB

  Description                   : ["/dev/shm"]
  Device id                     : [#<SNMP::Integer:0x00007f1b0a402e60 @value=38>]
  Filesystem type               : ["unknown"]
  Device unit                   : [#<SNMP::Integer:0x00007f1b0a4012b8 @value=4096>]
  Memory size                   : 1.92 GB
  Memory used                   : 0 bytes

  Description                   : ["/run/lock"]
  Device id                     : [#<SNMP::Integer:0x00007f1b0a3fc560 @value=39>]
  Filesystem type               : ["unknown"]
  Device unit                   : [#<SNMP::Integer:0x00007f1b0a3fa990 @value=4096>]
  Memory size                   : 5.00 MB
  Memory used                   : 0 bytes

  Description                   : ["/sys/fs/cgroup"]
  Device id                     : [#<SNMP::Integer:0x00007f1b0a3f5c38 @value=40>]
  Filesystem type               : ["unknown"]
  Device unit                   : [#<SNMP::Integer:0x00007f1b0a3f4090 @value=4096>]
  Memory size                   : 1.92 GB
  Memory used                   : 0 bytes

  Description                   : ["/boot"]
  Device id                     : [#<SNMP::Integer:0x00007f1b0a7368c0 @value=63>]
  Filesystem type               : ["unknown"]
  Device unit                   : [#<SNMP::Integer:0x00007f1b0a738c38 @value=4096>]
  Memory size                   : 219.97 MB
  Memory used                   : 201.03 MB


[*] Device information:

  Id                    Type                  Status                Descr               
  196608                unknown               running               AuthenticAMD: AMD EPYC 7302P 16-Core Processor
  196609                unknown               running               AuthenticAMD: AMD EPYC 7302P 16-Core Processor
  262145                unknown               running               network interface lo
  262146                unknown               running               network interface eth0
  786432                unknown               unknown               Guessing that there's a floating point co-processor

[*] Software components:

  Index                 Name                
  1                     accountsservice_0.6.55-0ubuntu12~20.04.5_amd64
  2                     adduser_3.118ubuntu2_all
  3                     alsa-topology-conf_1.2.2-1_all
  4                     alsa-ucm-conf_1.2.2-1ubuntu0.11_all
  5                     amd64-microcode_3.20191218.1ubuntu1_amd64
  6                     apache2_2.4.41-4ubuntu3.8_amd64
  7                     apache2-bin_2.4.41-4ubuntu3.8_amd64
  8                     apache2-data_2.4.41-4ubuntu3.8_all
  9                     apache2-utils_2.4.41-4ubuntu3.8_amd64
  10                    apparmor_2.13.3-7ubuntu5.1_amd64
  11                    apport_2.20.11-0ubuntu27.21_all
  12                    apport-symptoms_0.23_all
  13                    apt_2.0.6_amd64     
  14                    apt-transport-https_2.0.6_all
  15                    apt-utils_2.0.6_amd64
  16                    at_3.1.23-1ubuntu1_amd64
  17                    base-files_11ubuntu5.4_amd64
  18                    base-passwd_3.5.47_amd64
  19                    bash_5.0-6ubuntu1.1_amd64
  20                    bash-completion_1:2.10-1ubuntu1_all
  21                    bc_1.07.1-2build1_amd64
  22                    bcache-tools_1.0.8-3ubuntu0.1_amd64
  23                    bind9-dnsutils_1:9.16.1-0ubuntu2.9_amd64
  24                    bind9-host_1:9.16.1-0ubuntu2.9_amd64
  25                    bind9-libs_1:9.16.1-0ubuntu2.9_amd64
  26                    bolt_0.8-4ubuntu1_amd64
  27                    bsdmainutils_11.1.2ubuntu3_amd64
  28                    bsdutils_1:2.34-0.1ubuntu9.1_amd64
  29                    btrfs-progs_5.4.1-2_amd64
  30                    busybox-initramfs_1:1.30.1-4ubuntu6.4_amd64
  31                    busybox-static_1:1.30.1-4ubuntu6.4_amd64
  32                    byobu_5.133-0ubuntu1_all
  33                    bzip2_1.0.8-2_amd64 
  34                    ca-certificates_20210119~20.04.2_all
  35                    cloud-guest-utils_0.31-7-gd99b2d76-0ubuntu1_all
  36                    cloud-initramfs-copymods_0.45ubuntu2_all
  37                    cloud-initramfs-dyn-netconf_0.45ubuntu2_all
  38                    command-not-found_20.04.4_all
  39                    console-setup_1.194ubuntu3_all
  40                    console-setup-linux_1.194ubuntu3_all
  41                    coreutils_8.30-3ubuntu2_amd64
  42                    cpio_2.13+dfsg-2ubuntu0.3_amd64
  43                    crda_3.18-1build1_amd64
  44                    cron_3.0pl1-136ubuntu1_amd64
  45                    cryptsetup_2:2.2.2-3ubuntu2.3_amd64
  46                    cryptsetup-bin_2:2.2.2-3ubuntu2.3_amd64
  47                    cryptsetup-initramfs_2:2.2.2-3ubuntu2.3_all
  48                    cryptsetup-run_2:2.2.2-3ubuntu2.3_all
  49                    curl_7.68.0-1ubuntu2.7_amd64
  50                    dash_0.5.10.2-6_amd64
  51                    dbconfig-common_2.0.13_all
  52                    dbus_1.12.16-2ubuntu2.1_amd64
  53                    dbus-user-session_1.12.16-2ubuntu2.1_amd64
  54                    dconf-gsettings-backend_0.36.0-1_amd64
  55                    dconf-service_0.36.0-1_amd64
  56                    debconf_1.5.73_all  
  57                    debconf-i18n_1.5.73_all
  58                    debianutils_4.9.1_amd64
  59                    diffutils_1:3.7-3_amd64
  60                    dirmngr_2.2.19-3ubuntu2.1_amd64
  61                    distro-info_0.23ubuntu1_amd64
  62                    distro-info-data_0.43ubuntu1.9_all
  63                    dmeventd_2:1.02.167-1ubuntu1_amd64
  64                    dmidecode_3.2-3_amd64
  65                    dmsetup_2:1.02.167-1ubuntu1_amd64
  66                    dosfstools_4.1-2_amd64
  67                    dpkg_1.19.7ubuntu3_amd64
  68                    e2fsprogs_1.45.5-2ubuntu1_amd64
  69                    ed_1.16-1_amd64     
  70                    eject_2.1.5+deb1+cvs20081104-14_amd64
  71                    ethtool_1:5.4-1_amd64
  72                    fdisk_2.34-0.1ubuntu9.1_amd64
  73                    file_1:5.38-4_amd64 
  74                    finalrd_6~ubuntu20.04.1_all
  75                    findutils_4.7.0-1ubuntu1_amd64
  76                    fontconfig_2.13.1-2ubuntu3_amd64
  77                    fontconfig-config_2.13.1-2ubuntu3_all
  78                    fonts-dejavu-core_2.37-1_all
  79                    fonts-liberation_1:1.07.4-11_all
  80                    fonts-ubuntu-console_0.83-4ubuntu1_all
  81                    friendly-recovery_0.2.41ubuntu0.20.04.1_all
  82                    ftp_0.17-34.1_amd64 
  83                    fuse_2.9.9-3_amd64  
  84                    fwupd_1.5.11-0ubuntu1~20.04.2_amd64
  85                    fwupd-signed_1.27.1ubuntu5+1.5.11-0ubuntu1~20.04.2_amd64
  86                    galera-3_25.3.29-1_amd64
  87                    gawk_1:5.0.1+dfsg-1_amd64
  88                    gcc-10-base_10.3.0-1ubuntu1~20.04_amd64
  89                    gdisk_1.0.5-1_amd64 
  90                    geoip-database_20191224-2_all
  91                    gettext-base_0.19.8.1-10build1_amd64
  92                    gir1.2-glib-2.0_1.64.1-1~ubuntu20.04.1_amd64
  93                    gir1.2-packagekitglib-1.0_1.1.13-2ubuntu1.1_amd64
  94                    git_1:2.25.1-1ubuntu3.2_amd64
  95                    git-man_1:2.25.1-1ubuntu3.2_all
  96                    glib-networking_2.64.2-1ubuntu0.1_amd64
  97                    glib-networking-common_2.64.2-1ubuntu0.1_all
  98                    glib-networking-services_2.64.2-1ubuntu0.1_amd64
  99                    gnupg_2.2.19-3ubuntu2.1_all
  100                   gnupg-l10n_2.2.19-3ubuntu2.1_all
  101                   gnupg-utils_2.2.19-3ubuntu2.1_amd64
  102                   gpg_2.2.19-3ubuntu2.1_amd64
  103                   gpg-agent_2.2.19-3ubuntu2.1_amd64
  104                   gpg-wks-client_2.2.19-3ubuntu2.1_amd64
  105                   gpg-wks-server_2.2.19-3ubuntu2.1_amd64
  106                   gpgconf_2.2.19-3ubuntu2.1_amd64
  107                   gpgsm_2.2.19-3ubuntu2.1_amd64
  108                   gpgv_2.2.19-3ubuntu2.1_amd64
  109                   graphviz_2.42.2-3build2_amd64
  110                   grep_3.4-1_amd64    
  111                   groff-base_1.22.4-4build1_amd64
  112                   grub-common_2.04-1ubuntu26.13_amd64
  113                   grub-gfxpayload-lists_0.7_amd64
  114                   grub-pc_2.04-1ubuntu26.13_amd64
  115                   grub-pc-bin_2.04-1ubuntu26.13_amd64
  116                   grub2-common_2.04-1ubuntu26.13_amd64
  117                   gsettings-desktop-schemas_3.36.0-1ubuntu1_all
  118                   gzip_1.10-0ubuntu4_amd64
  119                   hdparm_9.58+ds-4_amd64
  120                   hostname_3.23_amd64 
  121                   htop_2.2.0-2build1_amd64
  122                   ifupdown_0.8.35ubuntu1_amd64
  123                   info_6.7.0.dfsg.2-5_amd64
  124                   init_1.57_amd64     
  125                   init-system-helpers_1.57_all
  126                   initramfs-tools_0.136ubuntu6.6_all
  127                   initramfs-tools-bin_0.136ubuntu6.6_amd64
  128                   initramfs-tools-core_0.136ubuntu6.6_all
  129                   install-info_6.7.0.dfsg.2-5_amd64
  130                   intel-microcode_3.20210608.0ubuntu0.20.04.1_amd64
  131                   iproute2_5.5.0-1ubuntu1_amd64
  132                   iptables_1.8.4-3ubuntu2_amd64
  133                   iputils-ping_3:20190709-3_amd64
  134                   iputils-tracepath_3:20190709-3_amd64
  135                   irqbalance_1.6.0-3ubuntu1_amd64
  136                   isc-dhcp-client_4.4.1-2.1ubuntu5.20.04.2_amd64
  137                   isc-dhcp-common_4.4.1-2.1ubuntu5.20.04.2_amd64
  138                   iso-codes_4.4-1_all 
  139                   iucode-tool_2.3.1-1_amd64
  140                   iw_5.4-1_amd64      
  141                   kbd_2.0.4-4ubuntu2_amd64
  142                   keyboard-configuration_1.194ubuntu3_all
  143                   klibc-utils_2.0.7-1ubuntu5_amd64
  144                   kmod_27-1ubuntu2_amd64
  145                   kpartx_0.8.3-1ubuntu2_amd64
  146                   krb5-locales_1.17-6ubuntu4.1_all
  147                   landscape-common_19.12-0ubuntu4.2_amd64
  148                   language-selector-common_0.204.2_all
  149                   less_551-1ubuntu0.1_amd64
  150                   libaccountsservice0_0.6.55-0ubuntu12~20.04.5_amd64
  151                   libacl1_2.2.53-6_amd64
  152                   libaio1_0.3.112-5_amd64
  153                   libalgorithm-c3-perl_0.10-1_all
  154                   libann0_1.1.2+doc-7build1_amd64
  155                   libapache2-mod-php7.4_7.4.3-4ubuntu2.8_amd64
  156                   libapache2-mpm-itk_2.4.7-04-1_amd64
  157                   libapparmor1_2.13.3-7ubuntu5.1_amd64
  158                   libappstream4_0.12.10-2_amd64
  159                   libapr1_1.6.5-1ubuntu1_amd64
  160                   libaprutil1_1.6.1-4ubuntu2_amd64
  161                   libaprutil1-dbd-sqlite3_1.6.1-4ubuntu2_amd64
  162                   libaprutil1-ldap_1.6.1-4ubuntu2_amd64
  163                   libapt-pkg6.0_2.0.6_amd64
  164                   libarchive13_3.4.0-2ubuntu1_amd64
  165                   libargon2-1_0~20171227-0.2_amd64
  166                   libasn1-8-heimdal_7.7.0+dfsg-1ubuntu1_amd64
  167                   libasound2_1.2.2-2.1ubuntu2.5_amd64
  168                   libasound2-data_1.2.2-2.1ubuntu2.5_all
  169                   libassuan0_2.5.3-7ubuntu2_amd64
  170                   libatasmart4_0.19-5_amd64
  171                   libatm1_1:2.5.1-4_amd64
  172                   libattr1_1:2.4.48-5_amd64
  173                   libaudit-common_1:2.8.5-2ubuntu6_all
  174                   libaudit1_1:2.8.5-2ubuntu6_amd64
  175                   libauthen-sasl-perl_2.1600-1_all
  176                   libb-hooks-endofscope-perl_0.24-1_all
  177                   libb-hooks-op-check-perl_0.22-1build2_amd64
  178                   libblas3_3.9.0-1build1_amd64
  179                   libblkid1_2.34-0.1ubuntu9.1_amd64
  180                   libblockdev-crypto2_2.23-2ubuntu3_amd64
  181                   libblockdev-fs2_2.23-2ubuntu3_amd64
  182                   libblockdev-loop2_2.23-2ubuntu3_amd64
  183                   libblockdev-part-err2_2.23-2ubuntu3_amd64
  184                   libblockdev-part2_2.23-2ubuntu3_amd64
  185                   libblockdev-swap2_2.23-2ubuntu3_amd64
  186                   libblockdev-utils2_2.23-2ubuntu3_amd64
  187                   libblockdev2_2.23-2ubuntu3_amd64
  188                   libbrotli1_1.0.7-6ubuntu0.1_amd64
  189                   libbsd0_0.10.0-1_amd64
  190                   libbz2-1.0_1.0.8-2_amd64
  191                   libc-bin_2.31-0ubuntu9.2_amd64
  192                   libc6_2.31-0ubuntu9.2_amd64
  193                   libcairo2_1.16.0-4ubuntu1_amd64
  194                   libcanberra0_0.30-7ubuntu1_amd64
  195                   libcap-ng0_0.7.9-2.1build1_amd64
  196                   libcap2_1:2.32-1_amd64
  197                   libcap2-bin_1:2.32-1_amd64
  198                   libcbor0.6_0.6.0-0ubuntu1_amd64
  199                   libcdt5_2.42.2-3build2_amd64
  200                   libcgi-fast-perl_1:2.15-1_all
  201                   libcgi-pm-perl_4.46-1_all
  202                   libcgraph6_2.42.2-3build2_amd64
  203                   libclass-c3-perl_0.34-1_all
  204                   libclass-c3-xs-perl_0.14-1build5_amd64
  205                   libclass-data-inheritable-perl_0.08-3_all
  206                   libclass-inspector-perl_1.36-1_all
  207                   libclass-method-modifiers-perl_2.13-1_all
  208                   libclass-singleton-perl_1.5-1_all
  209                   libclass-xsaccessor-perl_1.19-3build3_amd64
  210                   libcom-err2_1.45.5-2ubuntu1_amd64
  211                   libcommon-sense-perl_3.74-2build6_amd64
  212                   libconfig-inifiles-perl_3.000002-1_all
  213                   libcrypt1_1:4.4.10-10ubuntu4_amd64
  214                   libcryptsetup12_2:2.2.2-3ubuntu2.3_amd64
  215                   libcurl3-gnutls_7.68.0-1ubuntu2.7_amd64
  216                   libcurl4_7.68.0-1ubuntu2.7_amd64
  217                   libdata-dump-perl_1.23-1_all
  218                   libdata-optlist-perl_0.110-1_all
  219                   libdate-manip-perl_6.79-1_all
  220                   libdatetime-locale-perl_1:1.25-1_all
  221                   libdatetime-perl_2:1.51-1build1_amd64
  222                   libdatetime-timezone-perl_1:2.38-1+2019c_all
  223                   libdatrie1_0.2.12-3_amd64
  224                   libdb5.3_5.3.28+dfsg1-0.6ubuntu2_amd64
  225                   libdbd-mysql-perl_4.050-3_amd64
  226                   libdbi-perl_1.643-1ubuntu0.1_amd64
  227                   libdbus-1-3_1.12.16-2ubuntu2.1_amd64
  228                   libdbus-glib-1-2_0.110-5fakssync1_amd64
  229                   libdconf1_0.36.0-1_amd64
  230                   libdebconfclient0_0.251ubuntu1_amd64
  231                   libdevel-callchecker-perl_0.008-1ubuntu1_amd64
  232                   libdevel-caller-perl_2.06-2build2_amd64
  233                   libdevel-lexalias-perl_0.05-2build2_amd64
  234                   libdevel-stacktrace-perl_2.0400-1_all
  235                   libdevmapper-event1.02.1_2:1.02.167-1ubuntu1_amd64
  236                   libdevmapper1.02.1_2:1.02.167-1ubuntu1_amd64
  237                   libdns-export1109_1:9.11.16+dfsg-3~ubuntu1_amd64
  238                   libdrm-common_2.4.105-3~20.04.2_all
  239                   libdrm2_2.4.105-3~20.04.2_amd64
  240                   libdynaloader-functions-perl_0.003-1_all
  241                   libedit2_3.1-20191231-1_amd64
  242                   libefiboot1_37-2ubuntu2.2_amd64
  243                   libefivar1_37-2ubuntu2.2_amd64
  244                   libelf1_0.176-1.1build1_amd64
  245                   libencode-locale-perl_1.05-1_all
  246                   liberror-perl_0.17029-1_all
  247                   libestr0_0.1.10-2.1_amd64
  248                   libeval-closure-perl_0.14-1_all
  249                   libevdev2_1.9.0+dfsg-1ubuntu0.1_amd64
  250                   libevent-2.1-7_2.1.11-stable-1_amd64
  251                   libexception-class-perl_1.44-1_all
  252                   libexpat1_2.2.9-1build1_amd64
  253                   libext2fs2_1.45.5-2ubuntu1_amd64
  254                   libfastjson4_0.99.8-2_amd64
  255                   libfcgi-perl_0.79-1_amd64
  256                   libfdisk1_2.34-0.1ubuntu9.1_amd64
  257                   libffi7_3.3-4_amd64 
  258                   libfido2-1_1.3.1-1ubuntu2_amd64
  259                   libfile-listing-perl_6.04-1_all
  260                   libfile-sharedir-perl_1.116-2_all
  261                   libfl2_2.6.4-6.2_amd64
  262                   libfont-afm-perl_1.20-2_all
  263                   libfontconfig1_2.13.1-2ubuntu3_amd64
  264                   libfreetype6_2.10.1-2ubuntu0.1_amd64
  265                   libfribidi0_1.0.8-2_amd64
  266                   libfuse2_2.9.9-3_amd64
  267                   libfwupd2_1.5.11-0ubuntu1~20.04.2_amd64
  268                   libfwupdplugin1_1.5.11-0ubuntu1~20.04.2_amd64
  269                   libgcab-1.0-0_1.4-1_amd64
  270                   libgcc-s1_10.3.0-1ubuntu1~20.04_amd64
  271                   libgcrypt20_1.8.5-5ubuntu1.1_amd64
  272                   libgd3_2.2.5-5.2ubuntu2.1_amd64
  273                   libgdbm-compat4_1.18.1-5_amd64
  274                   libgdbm6_1.18.1-5_amd64
  275                   libgeo-ip-perl_1.51-2_amd64
  276                   libgeoip1_1.6.12-6build1_amd64
  277                   libgirepository-1.0-1_1.64.1-1~ubuntu20.04.1_amd64
  278                   libglib2.0-0_2.64.6-1~ubuntu20.04.4_amd64
  279                   libglib2.0-bin_2.64.6-1~ubuntu20.04.4_amd64
  280                   libglib2.0-data_2.64.6-1~ubuntu20.04.4_all
  281                   libgmp10_2:6.2.0+dfsg-4_amd64
  282                   libgnutls30_3.6.13-2ubuntu1.6_amd64
  283                   libgpg-error0_1.37-1_amd64
  284                   libgpgme11_1.13.1-7ubuntu2_amd64
  285                   libgpm2_1.20.7-5_amd64
  286                   libgraphite2-3_1.3.13-11build1_amd64
  287                   libgssapi-krb5-2_1.17-6ubuntu4.1_amd64
  288                   libgssapi3-heimdal_7.7.0+dfsg-1ubuntu1_amd64
  289                   libgstreamer1.0-0_1.16.2-2_amd64
  290                   libgts-0.7-5_0.7.6+darcs121130-4_amd64
  291                   libgts-bin_0.7.6+darcs121130-4_amd64
  292                   libgudev-1.0-0_1:233-1_amd64
  293                   libgusb2_0.3.4-0.1_amd64
  294                   libgvc6_2.42.2-3build2_amd64
  295                   libgvpr2_2.42.2-3build2_amd64
  296                   libharfbuzz0b_2.6.4-1ubuntu4_amd64
  297                   libhcrypto4-heimdal_7.7.0+dfsg-1ubuntu1_amd64
  298                   libheimbase1-heimdal_7.7.0+dfsg-1ubuntu1_amd64
  299                   libheimntlm0-heimdal_7.7.0+dfsg-1ubuntu1_amd64
  300                   libhogweed5_3.5.1+really3.5.1-2ubuntu0.2_amd64
  301                   libhtml-form-perl_6.07-1_all
  302                   libhtml-format-perl_2.12-1_all
  303                   libhtml-parser-perl_3.72-5_amd64
  304                   libhtml-tagset-perl_3.20-4_all
  305                   libhtml-template-perl_2.97-1_all
  306                   libhtml-tree-perl_5.07-2_all
  307                   libhttp-cookies-perl_6.08-1_all
  308                   libhttp-daemon-perl_6.06-1_all
  309                   libhttp-date-perl_6.05-1_all
  310                   libhttp-message-perl_6.22-1_all
  311                   libhttp-negotiate-perl_6.01-1_all
  312                   libhx509-5-heimdal_7.7.0+dfsg-1ubuntu1_amd64
  313                   libice6_2:1.0.10-0ubuntu1_amd64
  314                   libicu66_66.1-2ubuntu2.1_amd64
  315                   libidn2-0_2.2.0-2_amd64
  316                   libimobiledevice6_1.2.1~git20191129.9f79242-1build1_amd64
  317                   libio-html-perl_1.001-1_all
  318                   libio-interface-perl_1.09-1build5_amd64
  319                   libio-socket-inet6-perl_2.72-2_all
  320                   libio-socket-multicast-perl_1.12-2build6_amd64
  321                   libio-socket-ssl-perl_2.067-1_all
  322                   libip4tc2_1.8.4-3ubuntu2_amd64
  323                   libip6tc2_1.8.4-3ubuntu2_amd64
  324                   libisc-export1105_1:9.11.16+dfsg-3~ubuntu1_amd64
  325                   libisns0_0.97-3_amd64
  326                   libjansson4_2.12-1build1_amd64
  327                   libjbig0_2.1-3.1build1_amd64
  328                   libjcat1_0.1.3-2~ubuntu20.04.1_amd64
  329                   libjpeg-turbo8_2.0.3-0ubuntu1.20.04.1_amd64
  330                   libjpeg8_8c-2ubuntu8_amd64
  331                   libjson-c4_0.13.1+dfsg-7ubuntu0.3_amd64
  332                   libjson-glib-1.0-0_1.4.4-2ubuntu2_amd64
  333                   libjson-glib-1.0-common_1.4.4-2ubuntu2_all
  334                   libjson-perl_4.02000-2_all
  335                   libjson-xs-perl_4.020-1build1_amd64
  336                   libk5crypto3_1.17-6ubuntu4.1_amd64
  337                   libkeyutils1_1.6-6ubuntu1_amd64
  338                   libklibc_2.0.7-1ubuntu5_amd64
  339                   libkmod2_27-1ubuntu2_amd64
  340                   libkrb5-26-heimdal_7.7.0+dfsg-1ubuntu1_amd64
  341                   libkrb5-3_1.17-6ubuntu4.1_amd64
  342                   libkrb5support0_1.17-6ubuntu4.1_amd64
  343                   libksba8_1.3.5-2_amd64
  344                   liblab-gamut1_2.42.2-3build2_amd64
  345                   libldap-2.4-2_2.4.49+dfsg-2ubuntu1.8_amd64
  346                   libldap-common_2.4.49+dfsg-2ubuntu1.8_all
  347                   liblinear4_2.3.0+dfsg-3build1_amd64
  348                   liblmdb0_0.9.24-1_amd64
  349                   liblocale-gettext-perl_1.07-4_amd64
  350                   libltdl7_2.4.6-14_amd64
  351                   liblua5.2-0_5.2.4-1.1build3_amd64
  352                   liblua5.3-0_5.3.3-1.1ubuntu2_amd64
  353                   liblvm2cmd2.03_2.03.07-1ubuntu1_amd64
  354                   liblwp-mediatypes-perl_6.04-1_all
  355                   liblwp-protocol-https-perl_6.07-2ubuntu2_all
  356                   liblz4-1_1.9.2-2ubuntu0.20.04.1_amd64
  357                   liblzma5_5.2.4-1ubuntu1_amd64
  358                   liblzo2-2_2.10-2_amd64
  359                   libmagic-mgc_1:5.38-4_amd64
  360                   libmagic1_1:5.38-4_amd64
  361                   libmail-sendmail-perl_0.80-1_all
  362                   libmailtools-perl_2.21-1_all
  363                   libmaxminddb0_1.4.2-0ubuntu1.20.04.1_amd64
  364                   libmnl0_1.0.4-2_amd64
  365                   libmodule-implementation-perl_0.09-1_all
  366                   libmodule-runtime-perl_0.016-1_all
  367                   libmount1_2.34-0.1ubuntu9.1_amd64
  368                   libmpdec2_2.4.2-3_amd64
  369                   libmpfr6_4.0.2-1_amd64
  370                   libmro-compat-perl_0.13-1_all
  371                   libmspack0_0.10.1-2_amd64
  372                   libmysqlclient21_8.0.27-0ubuntu0.20.04.1_amd64
  373                   libnamespace-autoclean-perl_0.29-1_all
  374                   libnamespace-clean-perl_0.27-1_all
  375                   libncurses6_6.2-0ubuntu2_amd64
  376                   libncursesw6_6.2-0ubuntu2_amd64
  377                   libnet-http-perl_6.19-1_all
  378                   libnet-smtp-ssl-perl_1.04-1_all
  379                   libnet-ssleay-perl_1.88-2ubuntu1_amd64
  380                   libnet-telnet-perl_3.04-1_all
  381                   libnetaddr-ip-perl_4.079+dfsg-1build4_amd64
  382                   libnetfilter-conntrack3_1.0.7-2_amd64
  383                   libnettle7_3.5.1+really3.5.1-2ubuntu0.2_amd64
  384                   libnewt0.52_0.52.21-4ubuntu2_amd64
  385                   libnfnetlink0_1.0.1-3build1_amd64
  386                   libnftnl11_1.1.5-1_amd64
  387                   libnghttp2-14_1.40.0-1build1_amd64
  388                   libnl-3-200_3.4.0-1_amd64
  389                   libnl-genl-3-200_3.4.0-1_amd64
  390                   libnpth0_1.6-1_amd64
  391                   libnspr4_2:4.25-1_amd64
  392                   libnss-systemd_245.4-4ubuntu3.13_amd64
  393                   libnss3_2:3.49.1-1ubuntu1.6_amd64
  394                   libntfs-3g883_1:2017.3.23AR.3-3ubuntu1.1_amd64
  395                   libnuma1_2.0.12-1_amd64
  396                   libogg0_1.3.4-0ubuntu1_amd64
  397                   libonig5_6.9.4-1_amd64
  398                   libp11-kit0_0.23.20-1ubuntu0.1_amd64
  399                   libpackage-stash-perl_0.38-1_all
  400                   libpackage-stash-xs-perl_0.29-1build1_amd64
  401                   libpackagekit-glib2-18_1.1.13-2ubuntu1.1_amd64
  402                   libpadwalker-perl_2.3-1build2_amd64
  403                   libpam-cap_1:2.32-1_amd64
  404                   libpam-modules_1.3.1-5ubuntu4.3_amd64
  405                   libpam-modules-bin_1.3.1-5ubuntu4.3_amd64
  406                   libpam-runtime_1.3.1-5ubuntu4.3_all
  407                   libpam-systemd_245.4-4ubuntu3.13_amd64
  408                   libpam0g_1.3.1-5ubuntu4.3_amd64
  409                   libpango-1.0-0_1.44.7-2ubuntu4_amd64
  410                   libpangocairo-1.0-0_1.44.7-2ubuntu4_amd64
  411                   libpangoft2-1.0-0_1.44.7-2ubuntu4_amd64
  412                   libparams-classify-perl_0.015-1build2_amd64
  413                   libparams-util-perl_1.07-3build5_amd64
  414                   libparams-validationcompiler-perl_0.30-1_all
  415                   libparted-fs-resize0_3.3-4ubuntu0.20.04.1_amd64
  416                   libparted2_3.3-4ubuntu0.20.04.1_amd64
  417                   libpathplan4_2.42.2-3build2_amd64
  418                   libpcap0.8_1.9.1-3_amd64
  419                   libpci3_1:3.6.4-1ubuntu0.20.04.1_amd64
  420                   libpcre2-8-0_10.34-7_amd64
  421                   libpcre3_2:8.39-12build1_amd64
  422                   libperl5.30_5.30.0-9ubuntu0.2_amd64
  423                   libpipeline1_1.5.2-2build1_amd64
  424                   libpixman-1-0_0.38.4-0ubuntu1_amd64
  425                   libplist3_2.1.0-4build2_amd64
  426                   libplymouth5_0.9.4git20200323-0ubuntu6.2_amd64
  427                   libpng16-16_1.6.37-2_amd64
  428                   libpolkit-agent-1-0_0.105-26ubuntu1.1_amd64
  429                   libpolkit-gobject-1-0_0.105-26ubuntu1.1_amd64
  430                   libpopt0_1.16-14_amd64
  431                   libprocps8_2:3.3.16-1ubuntu2.3_amd64
  432                   libproxy1v5_0.4.15-10ubuntu1.2_amd64
  433                   libpsl5_0.21.0-1ubuntu1_amd64
  434                   libpython3-stdlib_3.8.2-0ubuntu2_amd64
  435                   libpython3.8_3.8.10-0ubuntu1~20.04.2_amd64
  436                   libpython3.8-minimal_3.8.10-0ubuntu1~20.04.2_amd64
  437                   libpython3.8-stdlib_3.8.10-0ubuntu1~20.04.2_amd64
  438                   libreadline5_5.2+dfsg-3build3_amd64
  439                   libreadline8_8.0-4_amd64
  440                   libreadonly-perl_2.050-2_all
  441                   libref-util-perl_0.204-1_all
  442                   libref-util-xs-perl_0.117-1build2_amd64
  443                   libroken18-heimdal_7.7.0+dfsg-1ubuntu1_amd64
  444                   librole-tiny-perl_2.001004-1_all
  445                   librtmp1_2.4+20151223.gitfa8646d.1-2build1_amd64
  446                   libsasl2-2_2.1.27+dfsg-2_amd64
  447                   libsasl2-modules_2.1.27+dfsg-2_amd64
  448                   libsasl2-modules-db_2.1.27+dfsg-2_amd64
  449                   libseccomp2_2.5.1-1ubuntu1~20.04.2_amd64
  450                   libselinux1_3.0-1build2_amd64
  451                   libsemanage-common_3.0-1build2_all
  452                   libsemanage1_3.0-1build2_amd64
  453                   libsensors-config_1:3.6.0-2ubuntu1_all
  454                   libsensors5_1:3.6.0-2ubuntu1_amd64
  455                   libsepol1_3.0-1_amd64
  456                   libsgutils2-2_1.44-1ubuntu2_amd64
  457                   libsigsegv2_2.12-2_amd64
  458                   libslang2_2.3.2-4_amd64
  459                   libsm6_2:1.2.3-1_amd64
  460                   libsmartcols1_2.34-0.1ubuntu9.1_amd64
  461                   libsmbios-c2_2.4.3-1_amd64
  462                   libsnappy1v5_1.1.8-1build1_amd64
  463                   libsnmp-base_5.8+dfsg-2ubuntu2.3_all
  464                   libsnmp-perl_5.8+dfsg-2ubuntu2.3_amd64
  465                   libsnmp35_5.8+dfsg-2ubuntu2.3_amd64
  466                   libsocket6-perl_0.29-1build1_amd64
  467                   libsodium23_1.0.18-1_amd64
  468                   libsoup2.4-1_2.70.0-1_amd64
  469                   libspecio-perl_0.45-1_all
  470                   libsqlite3-0_3.31.1-4ubuntu0.2_amd64
  471                   libss2_1.45.5-2ubuntu1_amd64
  472                   libssh-4_0.9.3-2ubuntu2.2_amd64
  473                   libssl1.1_1.1.1f-1ubuntu2.10_amd64
  474                   libstdc++6_10.3.0-1ubuntu1~20.04_amd64
  475                   libstemmer0d_0+svn585-2_amd64
  476                   libsub-exporter-perl_0.987-1_all
  477                   libsub-exporter-progressive-perl_0.001013-1_all
  478                   libsub-identify-perl_0.14-1build2_amd64
  479                   libsub-install-perl_0.928-1_all
  480                   libsub-name-perl_0.26-1_amd64
  481                   libsub-quote-perl_2.006006-1_all
  482                   libsys-hostname-long-perl_1.5-1_all
  483                   libsystemd0_245.4-4ubuntu3.13_amd64
  484                   libtasn1-6_4.16.0-2_amd64
  485                   libtdb1_1.4.3-0ubuntu0.20.04.1_amd64
  486                   libterm-readkey-perl_2.38-1build1_amd64
  487                   libtext-charwidth-perl_0.04-10_amd64
  488                   libtext-iconv-perl_1.7-7_amd64
  489                   libtext-wrapi18n-perl_0.06-9_all
  490                   libthai-data_0.1.28-3_all
  491                   libthai0_0.1.28-3_amd64
  492                   libtie-ixhash-perl_1.23-2_all
  493                   libtiff5_4.1.0+git191117-2ubuntu0.20.04.2_amd64
  494                   libtime-format-perl_1.16-1_all
  495                   libtimedate-perl_2.3200-1_all
  496                   libtinfo6_6.2-0ubuntu2_amd64
  497                   libtry-tiny-perl_0.30-1_all
  498                   libtss2-esys0_2.3.2-1_amd64
  499                   libtypes-serialiser-perl_1.0-1_all
  500                   libuchardet0_0.0.6-3build1_amd64
  501                   libudev1_245.4-4ubuntu3.13_amd64
  502                   libudisks2-0_2.8.4-1ubuntu2_amd64
  503                   libunistring2_0.9.10-2_amd64
  504                   libunwind8_1.2.1-9build1_amd64
  505                   libupower-glib3_0.99.11-1build2_amd64
  506                   liburcu6_0.11.1-2_amd64
  507                   liburi-perl_1.76-2_all
  508                   libusb-1.0-0_2:1.0.23-2build1_amd64
  509                   libusbmuxd6_2.0.1-2_amd64
  510                   libutempter0_1.1.6-4_amd64
  511                   libuuid1_2.34-0.1ubuntu9.1_amd64
  512                   libuv1_1.34.2-1ubuntu1.3_amd64
  513                   libvariable-magic-perl_0.62-1build2_amd64
  514                   libvolume-key1_0.3.12-3.1_amd64
  515                   libvorbis0a_1.3.6-2ubuntu1_amd64
  516                   libvorbisfile3_1.3.6-2ubuntu1_amd64
  517                   libwebp6_0.6.1-2ubuntu0.20.04.1_amd64
  518                   libwind0-heimdal_7.7.0+dfsg-1ubuntu1_amd64
  519                   libwrap0_7.6.q-30_amd64
  520                   libwww-perl_6.43-1_all
  521                   libwww-robotrules-perl_6.02-1_all
  522                   libx11-6_2:1.6.9-2ubuntu1.2_amd64
  523                   libx11-data_2:1.6.9-2ubuntu1.2_all
  524                   libxau6_1:1.0.9-0ubuntu1_amd64
  525                   libxaw7_2:1.0.13-1_amd64
  526                   libxcb-render0_1.14-2_amd64
  527                   libxcb-shm0_1.14-2_amd64
  528                   libxcb1_1.14-2_amd64
  529                   libxdmcp6_1:1.1.3-0ubuntu1_amd64
  530                   libxext6_2:1.3.4-0ubuntu1_amd64
  531                   libxml-libxml-perl_2.0134+dfsg-1build1_amd64
  532                   libxml-namespacesupport-perl_1.12-1_all
  533                   libxml-parser-perl_2.46-1_amd64
  534                   libxml-sax-base-perl_1.09-1_all
  535                   libxml-sax-expat-perl_0.51-1_all
  536                   libxml-sax-perl_1.02+dfsg-1_all
  537                   libxml-simple-perl_2.25-1_all
  538                   libxml-twig-perl_1:3.50-2_all
  539                   libxml-xpathengine-perl_0.14-1_all
  540                   libxml2_2.9.10+dfsg-5ubuntu0.20.04.1_amd64
  541                   libxmlb1_0.1.15-2ubuntu1~20.04.1_amd64
  542                   libxmlrpc-epi0_0.54.2-1.2_amd64
  543                   libxmlsec1_1.2.28-2_amd64
  544                   libxmlsec1-openssl_1.2.28-2_amd64
  545                   libxmu6_2:1.1.3-0ubuntu1_amd64
  546                   libxmuu1_2:1.1.3-0ubuntu1_amd64
  547                   libxpm4_1:3.5.12-1_amd64
  548                   libxrender1_1:0.9.10-1_amd64
  549                   libxslt1.1_1.1.34-4_amd64
  550                   libxstring-perl_0.002-2_amd64
  551                   libxt6_1:1.1.5-1_amd64
  552                   libxtables12_1.8.4-3ubuntu2_amd64
  553                   libyaml-0-2_0.2.2-1_amd64
  554                   libzip5_1.5.1-0ubuntu1_amd64
  555                   libzstd1_1.4.4+dfsg-3ubuntu0.1_amd64
  556                   linux-base_4.5ubuntu3.7_all
  557                   linux-firmware_1.187.23_all
  558                   linux-generic_5.4.0.91.95_amd64
  559                   linux-headers-5.4.0-74_5.4.0-74.83_all
  560                   linux-headers-5.4.0-74-generic_5.4.0-74.83_amd64
  561                   linux-headers-5.4.0-91_5.4.0-91.102_all
  562                   linux-headers-5.4.0-91-generic_5.4.0-91.102_amd64
  563                   linux-headers-generic_5.4.0.91.95_amd64
  564                   linux-image-5.4.0-74-generic_5.4.0-74.83_amd64
  565                   linux-image-5.4.0-91-generic_5.4.0-91.102_amd64
  566                   linux-image-generic_5.4.0.91.95_amd64
  567                   linux-modules-5.4.0-74-generic_5.4.0-74.83_amd64
  568                   linux-modules-5.4.0-91-generic_5.4.0-91.102_amd64
  569                   linux-modules-extra-5.4.0-74-generic_5.4.0-74.83_amd64
  570                   linux-modules-extra-5.4.0-91-generic_5.4.0-91.102_amd64
  571                   locales_2.31-0ubuntu9.2_all
  572                   login_1:4.8.1-1ubuntu5.20.04.1_amd64
  573                   logrotate_3.14.0-4ubuntu3_amd64
  574                   logsave_1.45.5-2ubuntu1_amd64
  575                   lsb-base_11.1.0ubuntu2_all
  576                   lsb-release_11.1.0ubuntu2_all
  577                   lshw_02.18.85-0.3ubuntu2.20.04.1_amd64
  578                   lsof_4.93.2+dfsg-1ubuntu0.20.04.1_amd64
  579                   ltrace_0.7.3-6.1ubuntu1_amd64
  580                   lua-lpeg_1.0.2-1_amd64
  581                   lvm2_2.03.07-1ubuntu1_amd64
  582                   lxd-agent-loader_0.4_all
  583                   lz4_1.9.2-2ubuntu0.20.04.1_amd64
  584                   man-db_2.9.1-1_amd64
  585                   manpages_5.05-1_all 
  586                   mariadb-client-10.3_1:10.3.32-0ubuntu0.20.04.1_amd64
  587                   mariadb-client-core-10.3_1:10.3.32-0ubuntu0.20.04.1_amd64
  588                   mariadb-common_1:10.3.32-0ubuntu0.20.04.1_all
  589                   mariadb-server_1:10.3.32-0ubuntu0.20.04.1_all
  590                   mariadb-server-10.3_1:10.3.32-0ubuntu0.20.04.1_amd64
  591                   mariadb-server-core-10.3_1:10.3.32-0ubuntu0.20.04.1_amd64
  592                   mawk_1.3.4.20200120-2_amd64
  593                   mdadm_4.1-5ubuntu1.2_amd64
  594                   mime-support_3.64ubuntu1_all
  595                   motd-news-config_11ubuntu5.4_all
  596                   mount_2.34-0.1ubuntu9.1_amd64
  597                   mtr-tiny_0.93-1_amd64
  598                   multipath-tools_0.8.3-1ubuntu2_amd64
  599                   mysql-common_5.8+1.0.5ubuntu2_all
  600                   nano_4.8-1ubuntu1_amd64
  601                   ncurses-base_6.2-0ubuntu2_all
  602                   ncurses-bin_6.2-0ubuntu2_amd64
  603                   ncurses-term_6.2-0ubuntu2_all
  604                   net-tools_1.60+git20180626.aebd88e-1ubuntu1_amd64
  605                   netbase_6.1_all     
  606                   netcat-openbsd_1.206-1ubuntu1_amd64
  607                   networkd-dispatcher_2.1-2~ubuntu20.04.1_all
  608                   nmap_7.80+dfsg1-2build1_amd64
  609                   nmap-common_7.80+dfsg1-2build1_all
  610                   ntfs-3g_1:2017.3.23AR.3-3ubuntu1.1_amd64
  611                   open-iscsi_2.0.874-7.1ubuntu6.2_amd64
  612                   open-vm-tools_2:11.3.0-2ubuntu0~ubuntu20.04.2_amd64
  613                   openssh-client_1:8.2p1-4ubuntu0.3_amd64
  614                   openssh-server_1:8.2p1-4ubuntu0.3_amd64
  615                   openssh-sftp-server_1:8.2p1-4ubuntu0.3_amd64
  616                   openssl_1.1.1f-1ubuntu2.10_amd64
  617                   os-prober_1.74ubuntu2_amd64
  618                   overlayroot_0.45ubuntu2_all
  619                   packagekit_1.1.13-2ubuntu1.1_amd64
  620                   packagekit-tools_1.1.13-2ubuntu1.1_amd64
  621                   packages-microsoft-prod_1.0-ubuntu20.04.1_all
  622                   parted_3.3-4ubuntu0.20.04.1_amd64
  623                   passwd_1:4.8.1-1ubuntu5.20.04.1_amd64
  624                   pastebinit_1.5.1-1_all
  625                   patch_2.7.6-6_amd64 
  626                   pci.ids_0.0~2020.03.20-1_all
  627                   pciutils_1:3.6.4-1ubuntu0.20.04.1_amd64
  628                   perl_5.30.0-9ubuntu0.2_amd64
  629                   perl-base_5.30.0-9ubuntu0.2_amd64
  630                   perl-modules-5.30_5.30.0-9ubuntu0.2_all
  631                   perl-openssl-defaults_4_amd64
  632                   php_2:7.4+75_all    
  633                   php-bcmath_2:7.4+75_all
  634                   php-cli_2:7.4+75_all
  635                   php-common_2:75_all 
  636                   php-curl_2:7.4+75_all
  637                   php-db_1.9.3-1build1_all
  638                   php-gd_2:7.4+75_all 
  639                   php-gmp_2:7.4+75_all
  640                   php-ldap_2:7.4+75_all
  641                   php-mbstring_2:7.4+75_all
  642                   php-mysql_2:7.4+75_all
  643                   php-pear_1:1.10.9+submodules+notgz-1ubuntu0.20.04.3_all
  644                   php-snmp_2:7.4+75_all
  645                   php-sqlite3_2:7.4+75_all
  646                   php-xml_2:7.4+75_all
  647                   php-xmlrpc_2:7.4+75_all
  648                   php-zip_2:7.4+75_all
  649                   php7.4_7.4.3-4ubuntu2.8_all
  650                   php7.4-bcmath_7.4.3-4ubuntu2.8_amd64
  651                   php7.4-cli_7.4.3-4ubuntu2.8_amd64
  652                   php7.4-common_7.4.3-4ubuntu2.8_amd64
  653                   php7.4-curl_7.4.3-4ubuntu2.8_amd64
  654                   php7.4-gd_7.4.3-4ubuntu2.8_amd64
  655                   php7.4-gmp_7.4.3-4ubuntu2.8_amd64
  656                   php7.4-json_7.4.3-4ubuntu2.8_amd64
  657                   php7.4-ldap_7.4.3-4ubuntu2.8_amd64
  658                   php7.4-mbstring_7.4.3-4ubuntu2.8_amd64
  659                   php7.4-mysql_7.4.3-4ubuntu2.8_amd64
  660                   php7.4-opcache_7.4.3-4ubuntu2.8_amd64
  661                   php7.4-readline_7.4.3-4ubuntu2.8_amd64
  662                   php7.4-snmp_7.4.3-4ubuntu2.8_amd64
  663                   php7.4-sqlite3_7.4.3-4ubuntu2.8_amd64
  664                   php7.4-xml_7.4.3-4ubuntu2.8_amd64
  665                   php7.4-xmlrpc_7.4.3-4ubuntu2.8_amd64
  666                   php7.4-zip_7.4.3-4ubuntu2.8_amd64
  667                   pinentry-curses_1.1.0-3build1_amd64
  668                   plymouth_0.9.4git20200323-0ubuntu6.2_amd64
  669                   plymouth-theme-ubuntu-text_0.9.4git20200323-0ubuntu6.2_amd64
  670                   policykit-1_0.105-26ubuntu1.1_amd64
  671                   pollinate_4.33-3ubuntu1.20.04.1_all
  672                   popularity-contest_1.69ubuntu1_all
  673                   powermgmt-base_1.36_all
  674                   powershell_7.1.3-1.ubuntu.20.04_amd64
  675                   procps_2:3.3.16-1ubuntu2.3_amd64
  676                   psmisc_23.3-1_amd64 
  677                   publicsuffix_20200303.0012-1_all
  678                   python-apt-common_2.0.0ubuntu0.20.04.6_all
  679                   python3_3.8.2-0ubuntu2_amd64
  680                   python3-apport_2.20.11-0ubuntu27.21_all
  681                   python3-apt_2.0.0ubuntu0.20.04.6_amd64
  682                   python3-attr_19.3.0-2_all
  683                   python3-automat_0.8.0-1ubuntu1_all
  684                   python3-blinker_1.4+dfsg1-0.3ubuntu1_all
  685                   python3-certifi_2019.11.28-1_all
  686                   python3-cffi-backend_1.14.0-1build1_amd64
  687                   python3-chardet_3.0.4-4build1_all
  688                   python3-click_7.0-3_all
  689                   python3-colorama_0.4.3-1build1_all
  690                   python3-commandnotfound_20.04.4_all
  691                   python3-configobj_5.0.6-4_all
  692                   python3-constantly_15.1.0-1build1_all
  693                   python3-cryptography_2.8-3ubuntu0.1_amd64
  694                   python3-dbus_1.2.16-1build1_amd64
  695                   python3-debconf_1.5.73_all
  696                   python3-debian_0.1.36ubuntu1_all
  697                   python3-distro_1.4.0-1_all
  698                   python3-distro-info_0.23ubuntu1_all
  699                   python3-distupgrade_1:20.04.36_all
  700                   python3-distutils_3.8.10-0ubuntu1~20.04_all
  701                   python3-entrypoints_0.3-2ubuntu1_all
  702                   python3-gdbm_3.8.10-0ubuntu1~20.04_amd64
  703                   python3-gi_3.36.0-1_amd64
  704                   python3-hamcrest_1.9.0-3_all
  705                   python3-httplib2_0.14.0-1ubuntu1_all
  706                   python3-hyperlink_19.0.0-1_all
  707                   python3-idna_2.8-1_all
  708                   python3-incremental_16.10.1-3.2_all
  709                   python3-json-pointer_2.0-0ubuntu1_all
  710                   python3-jsonpatch_1.23-3_all
  711                   python3-jsonschema_3.2.0-0ubuntu2_all
  712                   python3-jwt_1.7.1-2ubuntu2_all
  713                   python3-keyring_18.0.1-2ubuntu1_all
  714                   python3-launchpadlib_1.10.13-1_all
  715                   python3-lazr.restfulclient_0.14.2-2build1_all
  716                   python3-lazr.uri_1.0.3-4build1_all
  717                   python3-lib2to3_3.8.10-0ubuntu1~20.04_all
  718                   python3-minimal_3.8.2-0ubuntu2_amd64
  719                   python3-nacl_1.3.0-5_amd64
  720                   python3-netifaces_0.10.4-1ubuntu4_amd64
  721                   python3-newt_0.52.21-4ubuntu2_amd64
  722                   python3-oauthlib_3.1.0-1ubuntu2_all
  723                   python3-openssl_19.0.0-1build1_all
  724                   python3-pexpect_4.6.0-1build1_all
  725                   python3-pkg-resources_45.2.0-1_all
  726                   python3-problem-report_2.20.11-0ubuntu27.21_all
  727                   python3-ptyprocess_0.6.0-1ubuntu1_all
  728                   python3-pyasn1_0.4.2-3build1_all
  729                   python3-pyasn1-modules_0.2.1-0.2build1_all
  730                   python3-pymacaroons_0.13.0-3_all
  731                   python3-requests_2.22.0-2ubuntu1_all
  732                   python3-requests-unixsocket_0.2.0-2_all
  733                   python3-secretstorage_2.3.1-2ubuntu1_all
  734                   python3-serial_3.4-5.1_all
  735                   python3-service-identity_18.1.0-5build1_all
  736                   python3-setuptools_45.2.0-1_all
  737                   python3-simplejson_3.16.0-2ubuntu2_amd64
  738                   python3-six_1.14.0-2_all
  739                   python3-software-properties_0.99.9.8_all
  740                   python3-systemd_234-3build2_amd64
  741                   python3-twisted_18.9.0-11ubuntu0.20.04.1_all
  742                   python3-twisted-bin_18.9.0-11ubuntu0.20.04.1_amd64
  743                   python3-update-manager_1:20.04.10.9_all
  744                   python3-urllib3_1.25.8-2ubuntu0.1_all
  745                   python3-wadllib_1.3.3-3build1_all
  746                   python3-yaml_5.3.1-1ubuntu0.1_amd64
  747                   python3-zope.interface_4.7.1-1_amd64
  748                   python3.8_3.8.10-0ubuntu1~20.04.2_amd64
  749                   python3.8-minimal_3.8.10-0ubuntu1~20.04.2_amd64
  750                   readline-common_8.0-4_all
  751                   rsync_3.1.3-8ubuntu0.1_amd64
  752                   rsyslog_8.2001.0-1ubuntu1.1_amd64
  753                   run-one_1.17-0ubuntu1_all
  754                   sbsigntool_0.9.2-2ubuntu1_amd64
  755                   screen_4.8.0-1ubuntu0.1_amd64
  756                   secureboot-db_1.5_amd64
  757                   sed_4.7-1_amd64     
  758                   sensible-utils_0.0.12+nmu1_all
  759                   sg3-utils_1.44-1ubuntu2_amd64
  760                   sg3-utils-udev_1.44-1ubuntu2_all
  761                   shared-mime-info_1.15-1_amd64
  762                   snmp_5.8+dfsg-2ubuntu2.3_amd64
  763                   snmp-mibs-downloader_1.2_all
  764                   snmpd_5.8+dfsg-2ubuntu2.3_amd64
  765                   socat_1.7.3.3-2_amd64
  766                   software-properties-common_0.99.9.8_all
  767                   sosreport_4.1-1ubuntu0.20.04.3_amd64
  768                   sound-theme-freedesktop_0.8-2ubuntu1_all
  769                   ssh-import-id_5.10-0ubuntu1_all
  770                   ssl-cert_1.0.39_all 
  771                   strace_5.5-3ubuntu1_amd64
  772                   sudo_1.8.31-1ubuntu1.2_amd64
  773                   systemd_245.4-4ubuntu3.13_amd64
  774                   systemd-sysv_245.4-4ubuntu3.13_amd64
  775                   systemd-timesyncd_245.4-4ubuntu3.13_amd64
  776                   sysvinit-utils_2.96-2.1ubuntu1_amd64
  777                   tar_1.30+dfsg-7ubuntu0.20.04.1_amd64
  778                   tcpdump_4.9.3-4_amd64
  779                   telnet_0.17-41.2build1_amd64
  780                   thermald_1.9.1-1ubuntu0.6_amd64
  781                   thin-provisioning-tools_0.8.5-4build1_amd64
  782                   time_1.7-25.1build1_amd64
  783                   tmux_3.0a-2ubuntu0.3_amd64
  784                   tpm-udev_0.4_all    
  785                   traceroute_1:2.1.0-2_amd64
  786                   tzdata_2021e-0ubuntu0.20.04_all
  787                   ubuntu-advantage-tools_27.4.2~20.04.1_amd64
  788                   ubuntu-keyring_2020.02.11.4_all
  789                   ubuntu-release-upgrader-core_1:20.04.36_all
  790                   ubuntu-server_1.450.2_amd64
  791                   ucf_3.0038+nmu1_all 
  792                   udev_245.4-4ubuntu3.13_amd64
  793                   udisks2_2.8.4-1ubuntu2_amd64
  794                   unzip_6.0-25ubuntu1_amd64
  795                   update-manager-core_1:20.04.10.9_all
  796                   update-notifier-common_3.192.30.10_all
  797                   upower_0.99.11-1build2_amd64
  798                   usb.ids_2020.03.19-1_all
  799                   usbmuxd_1.1.1~git20191130.9af2b12-1_amd64
  800                   usbutils_1:012-2_amd64
  801                   util-linux_2.34-0.1ubuntu9.1_amd64
  802                   uuid-runtime_2.34-0.1ubuntu9.1_amd64
  803                   vim_2:8.1.2269-1ubuntu5.4_amd64
  804                   vim-common_2:8.1.2269-1ubuntu5.4_all
  805                   vim-runtime_2:8.1.2269-1ubuntu5.4_all
  806                   vim-tiny_2:8.1.2269-1ubuntu5.4_amd64
  807                   wget_1.20.3-1ubuntu2_amd64
  808                   whiptail_0.52.21-4ubuntu2_amd64
  809                   wireless-regdb_2021.08.28-0ubuntu1~20.04.1_all
  810                   x11-common_1:7.7+19ubuntu14_all
  811                   xauth_1:1.1-0ubuntu1_amd64
  812                   xdg-user-dirs_0.17-2ubuntu1_amd64
  813                   xfsprogs_5.3.0-1ubuntu2_amd64
  814                   xkb-data_2.29-2_all 
  815                   xprobe_0.3-4build1_amd64
  816                   xxd_2:8.1.2269-1ubuntu5.4_amd64
  817                   xz-utils_5.2.4-1ubuntu1_amd64
  818                   zerofree_1.1.1-1_amd64
  819                   zip_3.0-11build1_amd64
  820                   zlib1g_1:1.2.11.dfsg-2ubuntu1.2_amd64
```

# snmpcheck
GUI tool
logs:
```
$ snmpcheck 10.10.11.136
test: .1.3.6.1.4.1.2021.2.1
suff: .2.1
test: .1.3.6.1.4.1.2021.4
suff: 
test: .1.3.6.1.4.1.2021.8.1
suff: .8.1
test: .1.3.6.1.4.1.2021.9.1
suff: .9.1
test: .1.3.6.1.4.1.2021.10.1
suff: .10.1
test: .1.3.6.1.4.1.2021.101
suff: 
Timeout: No Response from 10.10.11.136
Timeout: No Response from 10.10.11.136
not a Tk object
 Tk::die_with_trace at /usr/bin/snmpcheck line 903
 main::setstatus at /usr/bin/snmpcheck line 537
 Host::check at /usr/bin/snmpcheck line 889
 main::newHost at /usr/bin/snmpcheck line 880
 main::loadAllHosts at /usr/bin/snmpcheck line 862
```
