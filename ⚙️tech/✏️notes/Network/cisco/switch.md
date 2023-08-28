> Cheat Sheet: https://www.netwrix.com/cisco_commands_cheat_sheet.html
# Check out current config
```ios
sh[ow] run[ning-config]  ;   Not sure if this works
sh version
sh interface
sh ip int[erface] b[rief]
sh vlan
sh mac address-table
sh run | begin interface
```

# General Admin Commands
```
switch> enable   ; admin mode
switch# conf t   ; configuration terminal
```

# Enable SSH Access
```
switch(config)# hostname <hostname>   ; set hostname for the device
switch(config)# ip domain-name <domain-name>

switch(config)# username <username> privilege 15 secret <password>
switch(config)# crypto key generate rsa   ; create RSA key for SSH
switch(config)# ip ssh version 2   ; device to use SSH ver 2
switch(config)# ip ssh <ip address>   ; device to listen on this IP
switch(config)# ip ssh server   ; enable SSH server
switch> show ip ssh   ; to verify SSH is set up
```
