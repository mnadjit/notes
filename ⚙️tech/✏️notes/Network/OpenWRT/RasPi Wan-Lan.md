# Install
> Raspberry Pi 2 B 1.2
https://openwrt.org/toh/hwdata/raspberry_pi_foundation/raspberry_pi_2_b_bcm2837
- Download Firmware:
https://downloads.openwrt.org/releases/22.03.3/targets/bcm27xx/bcm2709/openwrt-22.03.3-bcm27xx-bcm2709-rpi-2-ext4-factory.img.gz
- Decompress
`gunzip $image.img.gz`
- Burn to storage
`dd if=$image.img of=/dev/sdX status=progress bs=1M conv=fdatasync`
- Update packages Post-Installation
`opkg update`

# Config
## Raspberry Pi as Wi-Fi client
To have a LAN subnet e.g. 192.168.1.0/24 connected to Raspberry Pi which connects to an access point via WAN in client mode, after installing OpenWRT on Raspberry Pi
### Wireless
- config `/etc/config/wireless`: to connect to ISP router
```
config wifi-device 'radio0'
	option type 'mac80211'
	option path 'platform/soc/3f300000.mmcnr/mmc_host/mmc1/mmc1:0001/mmc1:0001:1'
	option channel 'auto'
	option band '2g'
	option htmode 'HT20'

config wifi-iface 'default_radio0'
	option device 'radio0'
	option network '$net_name'
	option mode 'sta'   # stands for station i.e. client mode
	option ssid '$ap_ssid_name'
	option key '$ap_password'
	option encryption '$encryption'   # e.g. psk2

```
### Network
- config `/etc/config/wireless`: to enable dhcp
```
config interface '$net_name'
	option proto 'dhcp'
```
### Firewall / NAT
- config `etc/config/firewall`: to add network to a firewall zone
```
config zone
	option name '$net_name'
config forwarding
	option src 'lan'
	option dest 'wan'
config forwarding
	option src 'wan'
	option dest 'lan'
config nat
	option name 'out'
	option target 'MASQUERADE'
	option src '*'
	list proto 'all'
config nat
	option name 'in'
	option target 'ACCEPT'
	option src '*'
	option proto 'all'
```