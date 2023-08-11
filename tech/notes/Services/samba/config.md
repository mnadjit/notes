# Reference
Cheat sheet: https://gist.github.com/khazeamo/f762f532bfbc17d5bf396e9d4c2a9586#samba

# Install 
```sh
sudo apt install samba samba-common samba-client
systemctl status smbd # make sure service is installed, running and enabled
```

# Basic Configuration
`vim /etc/samba/smb.conf`
```smb.conf
[share_name]
   comment = <description>                 # description of the shared path
   path = /path/to/dir                     # full path to shared path
   browseable = yes                        # visible or hidden
   read only = no                          # access permissions
   guest ok = no                           # allow no password access
   valid users = <user1> <user2> <@group>  # users and groups allowed to access the shared path
   invalid user = <user1> <user2> <@group> # users and groups not allowed to access the shared path
   unix password sync = yes                # Samba password changes with unix user's unix password
```
## Check config
```sh
/etc/samba $ testparm
```
## Add Unix user as Samba user
```sh
smbpasswd -a $unix_user     # you'll get prompted for samba password. 
                            # Enter unix password if you want to use the same password for both 
							# and make sure to set 'unix password sync' to 'yes' in smb.conf file
```

## Auto-Mount
1) Install CIFS tools
- `sudo apt install cifs-utils`
2) Add credentials to a file e.g. `/home/user/.smb`
```cifs
username=
password=
```
3) update `/etc/fstab` and add the following entry
```
//server/dir     /path/to/local_dir     cifs    uid=0,credentials=/home/user/.smb,x-systemd.mount-timeout=5 0 0    # uid of user to own the mountpoint; 0: root, find user uid in /etc/passwd
```
```sh
sudo systemctl daemon-reload
sudo mount -a
```