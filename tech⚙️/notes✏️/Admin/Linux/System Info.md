# System Information

## Hardware Overview
> `sudo lshw -short` <br>
> `sudo dmidecode`
- more details (Desktop Management Interface)

## CPU
> `sudo lshw -businfo | grep cpu`
- shortest CPU description
> `lscpu`
- CPU overview
> `cat /proc/cpuinfo`
- Details for each core
> `sudo dmidecode -t processor`
- CPU details

## PCI-Attached Devices 


### GPU
#graphics 
- Check video drivers in use
	- `lspci -vnnk | egrep -A 10 -i 'vga|3d'`
- Check active GPU driver
	- `glxinfo | egrep -i 'opengl.vendor|opengl.rendere'`
- List available and default GPU
	- `switcherooctl list`

## Storage
> `sudo lshw -businfo | grep disk`
- Disk size and model
> `lsblk -pf`
- Get info about all block devices (-p: paths; -f: filesystems label and UUID)
> `df -Th`
- Get the size of partitions (-h: human readable; T: type of filesystem)
> `sudo fdisk -l`
- list partitions with more details

> `sudo dnf install ncdu` <br>
> `ncdu $path_to_directory`
- NCDU app for displaying disk usage

## USB
- `lsusb`: simple short list of USB devices
- `lsusb -t`: in a tree format
- `lsusb -tv`: in a tree format with vendor and product IDs

## Network
- `ip addr`: list of network interfaces with their IP addresses
- `ip link`: list of network interfaces
- `ip link show`: show details of network interfaces
- `ip link set dev <interface> up`: bring up interface
- `ip link set dev <interface> down`: bring down interface

## Memory
- `free`: show memory usage in bytes
- `free -mh`: show memory usage in MegaBytes and in human readable format
- `cat /proc/meminfo`: show memory usage 

## Bluetooth
BluetoothCtl:
- `bluetoothctl`: A tool in the BlueZ package
  - `power on`
  - `agent on`
  - `default-agent`
  - `scan on`
  - `trust <deviceuuid>`
  - `pair <deviceuuid>`
  - `connect <deviceuuid>`
HCI tool:
- `hcitool dev`
- `hci -i <dev> scan`
- _To be added_

## Host
- `hostname`: show or set the system’s host name
- `domainname` :  show or set the system’s NIS/YP domain name
- `dnsdomainname`: show or set the system’s DNS domain name
- `nisdomainname`: show or set system’s NIS/YP domain name
- `ypdomainname`: show or set system’s NIS/YP domain name
	The **Network Information Service**, or NIS (originally called Yellow Pages or YP), is a client–server directory service protocol for distributing system configuration data such as user and host names between computers on a computer network. A NIS domain is a collection of systems that are logically grouped together. A group of hosts that share the same set of NIS maps belong to the same domain. The hosts are usually grouped together in the domain for a common reason; for example, when working in the same group at a particular location.
