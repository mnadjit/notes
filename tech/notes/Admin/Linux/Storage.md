# fstab
https://www.redhat.com/sysadmin/etc-fstab
https://linuxopsys.com/topics/linux-fstab-options

# Mount a drive with persistence
1) use `blkid` to get UUID of the storage
2) get filesystem type using  
	- `df -Th | grep /dev/sdX`
	- `fdisk -l /dev/sdX`
3) update `/etc/fstab` following this pattern:
`UUID=$uuid /mnt/sdX $fs_type $options $backup $fs_check_order`
- backup values `0` or `1`: This is a legacy option. Always set it to `0` 
- file system check order values: `0`, `1`, or `2` 
	- 0: skip
	- 1: for root filesystem
	- 2: for non-root filesystems
e.g.
```fstab
UUID=abcde-1234 /mnt/mountpoint ext4 defaults 0 0
/dev/sda1 /mnt/mount_path xfs defaults 0 2
/dev/nvme0p1 /mnt/nvme btrfs ro,noexec,nouser,noauto,uid=0,gid=0,x-systemd.mount-timeout=5 0 0
```
4) IMPORTANT: 
	- mount all paths in `fstab` file and make sure there are no errors, otherwise on next system boot fails!
		- `mount -a`
## options (fourth field)
- `ro/rw`: Read-only or Read-Write
- `exec/noexec`: Executable or not
- `user/nouser`: non-root users allowed, or only root user
- `auto/noauto`: automatically mount or not
- `uid`: owner user id or user name
- `gid`: owner group id or group name
- `suid`: permit the operation of suid ?
- `guid`: ?
- `x-systemd.mount-timeout`: timeout in seconds for mounting the path

# LVM
> Logical Volume Manager
> https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/logical_volume_manager_administration/lvm_cli#doc-wrapper


