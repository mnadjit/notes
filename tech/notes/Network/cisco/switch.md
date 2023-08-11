> Cheat Sheet: https://www.netwrix.com/cisco_commands_cheat_sheet.html
# Check out current config
```
switch> sh[ow] running-config  ;   Not sure if this works
switch> sh version
switch> sh interface
switch> sh ip interface
switch> sh vlan
switch> sh mac address-table
switch> sh run | begin interface
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
