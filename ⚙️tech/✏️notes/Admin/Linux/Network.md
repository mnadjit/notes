# Get config
## Interfaces
`ip l[ink]`
## IP Addresses
`ip a[ddress]`
`ip a sh[ow] dev[ice] $dev_name`
## Routes
`ip r[oute]`
`route [-n]`
`ifconfig`: General config
## DNS
Name Server:
`cat /etc/resolv.conf`    
Local hosts:
`cat /etc/hosts`

# Set Config
## Persistent config
1. NetworkManager: `/etc/NetworkManager/system-connections/<connection>.nmconnection`
	- Restart:
		- `sudo systemctl restart NetworkManager`
		- `sudo nmcli connection reload`
1. Netplan: Ubuntu exclusive: `/etc/netplan/01-Network-manager-all.yaml`
	- Restart: `sudo netplan apply`
1. System V: `/etc/network/interfaces`
	- Restart: `sudo service network restart`

## Session config
### Interfaces
`ip l set dev $dev up`
`ip l set dev $dev down`
### IP Addresses
`ip a add $ip_address dev $dev`
`ip a del $ip_address dev $dev`
### Routes
`ip r add default via $ip_address [dev $dev]`
`ip r add $subnet via $ip_address [dev $dev]`
`ip r del default`
`ip r del $subnet`
### DNS
#### Name Server
`vim /etc/resolv.conf`
#### Local hosts
`vim /etc/hosts`

# Internet Sharing
- nmcli:
```sh
nmcli connection add type ethernet ifname $eth_if_name ipv4.method shared con-name $conn_name
```
[Fedora Magazine](https://fedoramagazine.org/internet-connection-sharing-networkmanager/)

