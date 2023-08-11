- [Fedora Docs](https://docs.fedoraproject.org/en-US/fedora/latest/system-administrators-guide/basic-system-configuration/Configuring_the_Date_and_Time/)
- `sudo timedatectl set-timezone Australia/Melbourne`: set timezone

# NTP
https://www.cyberciti.biz/faq/linux-unix-bsd-is-ntp-client-working/
`timedatectl status` : check if ntp active/inactive and whether time has been synced or not
Tools:
- ntpq
	- `ntpq -pn`
	- `echo $?`   to get the exit code
- ntpstat
	- `ntpstat`
- openntpd

- `chronyd`
	- `chronyc`: cli tool
		- by entering chronyc cli tool and exiting it, the time got synced on a debian machine!!!  (proxmox)