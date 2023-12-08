#user #group #linux 

- [Fedora Docs](https://docs.fedoraproject.org/en-US/fedora/latest/system-administrators-guide/basic-system-configuration/Managing_Users_and_Groups/)
- `less /etc/passwd`: get a list of all users and their default shell
- `less /etc/group`: get a list of all available groups
- `groups`: get a list of groups the user is actively part of
- `groups <user>`: get a list of groups user is assigned to - might need re-log in for newly assigned ones to take effect
- `sudo passwd`: change password
- `sudo useradd`: add user
- `sudo userdel`: delete user
- `sudo usermod`: modify user
- `sudo usermod -aG $group_name $user_name`: add user to group e.g. wheel, libvirt or docker

