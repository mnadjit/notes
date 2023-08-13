# Firmware
Find compatible firmware from:
https://openwrt.org/toh/start

- Update the package manager links
`opkg update`
- **luci** is the web ui 
`opkg install luci bmon`
- **bmon** package for monitoring
`opkg install bmon` 

# Configuration
## Client Mode
### CLI
#### Wi-fi Client Mode Config
https://openwrt.org/docs/guide-user/network/wifi/basic
> update `/etc/config/wireless`
```
config wifi-device 'radio0'
        option type 'mac80211'
        option path 'pci0000:00/0000:00:00.0/0000:01:00.0/bcma0:1'
        option channel 'auto'
        option band '2g'
        option htmode 'HT20'

config wifi-iface 'default_radio0'
        option device 'radio0'
        option network 'my_network'
        option mode 'sta'
        option ssid 'AP_name'
        option key 'AP_password'
        option encryption 'psk2'
```
#### DHCP: enable
https://openwrt.org/playground/arinc9/networking-basics
> update /etc/config/network
> add the following lines to the file
```
config interface 'my_network'
        option proto 'dhcp'
```
#### Firewall: Add network
https://openwrt.org/docs/guide-user/firewall/firewall_configuration
> update /etc/config/firewall
> under 'config zone' section where the 'option name' is 'wan' add the following:
```
list network 'my_network'
```
> Restart network service
`service network restart`

## Add USB drive
https://openwrt.org/docs/guide-user/storage/usb-drives-quickstart

## Configure WAN-LAN bridge
a.k.a. Relay configuration
https://openwrt.org/docs/guide-user/network/wifi/relay_configuration
However, Raspberry Pi does not support bridging of Wan and LAN interfaces 

# my devices
## D-Link DSL-2750B
- Hardware type: T1
- Manual: http://files.dlink.com.au/products/DSL-2750B/REV_T/Manuals/DSL-2750B_T1_Manual_v3.00(AU).pdf
- Manufacturer Files: https://files.dlink.com.au/products/DSL-2750B/
	- Stock firmware: https://files.dlink.com.au/products/DSL-2750B/REV_T/Firmware/
- OpenWRT Page: https://openwrt.org/toh/hwdata/d-link/d-link_dsl-2750b_t1
	- Make sure to download the firmware from **releases** URL. **snapshots** are development firmwares.
	- sysupgrade image: https://downloads.openwrt.org/releases/22.03.3/targets/bcm63xx/generic/openwrt-22.03.3-bcm63xx-generic-adb_a4001n1-squashfs-sysupgrade.bin
### Reset
While on, hold reset button for just over 10 seconds and release. It should reboot itself and return to the last firmware uploaded to its ROM
### Rescue Mode
While off, hold the reset button. Switch the router on and keep holding the rest button for over 30 seconds and release. It might not even reboot, but the web ui should be accessible via http://192.168.1.1 where you may upload the firmware of interest and flash the ROM.

## NetComm N300 Gigabit Router - NF7
Manual: http://media.netcomm.com.au/public/assets/pdf_file/0013/131341/NF7-User-Guide.pdf

## Raspberry Pi 2 B 1.2
https://openwrt.org/toh/hwdata/raspberry_pi_foundation/raspberry_pi_2_b_bcm2837

firmware: https://downloads.openwrt.org/releases/22.03.3/targets/bcm27xx/bcm2709/openwrt-22.03.3-bcm27xx-bcm2709-rpi-2-ext4-factory.img.gz
upgrade: https://downloads.openwrt.org/releases/22.03.3/targets/bcm27xx/bcm2709/openwrt-22.03.3-bcm27xx-bcm2709-rpi-2-ext4-sysupgrade.img.gz
