## firewall-cmd
> Fedora default firewall [Fedora Docs](https://docs.fedoraproject.org/en-US/fedora/latest/system-administrators-guide/basic-system-configuration/Configuring_the_Firewall/)
- `sudo firewall-cmd --list-all`: list all firewall rules
- `sudo firewall-cmd --zone=public --list-ports`: list all ports
- `sudo firewall-cmd --zone=public --add-service=<service>`: add service
- `sudo firewall-cmd --zone=public --remove-service=<service>`: remove service
- `sudo firewall-cmd --zone=public --add-port=<port>/<protocol>`: add port
- `sudo firewall-cmd --zone=public --remove-port=<port>/<protocol>`: remove port

## iptables

## ufw
- Uncomplicated Firewall
- Ubuntu default firewall