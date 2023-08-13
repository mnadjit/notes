# Grub
## Grub CLI
Make sure `normal.mod` exists in `/boot/grub` directory in your CPU arch directory e.g. `x86_64-efi`
Commands below tells grub to run `/boot/grub/x86_64-efi/normal.mod` in `hd0,gpt1.gpt4` partition
```grub
ls
set root=(hd0,gpt1.gpt4)
set prefix=(hd0,gpt1.gpt4)/boot/grub
insmod normal
normal
```

#### Get the default kernel used by GRUB2:
> `grubby --default-index`
OR
> `grubby --default-kernel`
#### Change the default bootloader to GRUB2:
> `grubby --set-default-index=0`
OR
> `grubby --set-default-kernel=$path_to_kernel_file`
- Kernel files are found here: `/boot/vmlinuz-<version>`
#### Update Grub2 configuration file
After making changes to `/etc/default/grub` you need to run `grub2-mkconfig` for changes to be written to the grub.cfg file.
* Fedora
> `sudo grub2-mkconfig -o $boot_partition/$boot_dir_name/fedora/grub.cfg`
- Find out where boot partition is mounted using `lsblk` or `df`
- e.g. if `/dev/sda1` is mounted at `/boot/efi` and there is subdirectory `EFI` under it, then:
> `sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg`

# Windows Boot Manager 
`bootmgr.exe`
> Windows Boot Manager (Bootmgr.exe) is Microsoft's proprietary Unified Extensible Firmware Interface (UEFI) application. It is loaded from the volume boot code of your device's hard drive, and it **enables you to set up the boot environment**
```cmd
bcdedit /enum    # get windows boot manager and boot loader
bcdedit /enum {bootmgr}   # get windows boot manager only
bcdedit /enum {current}   # get windows boot loader only

bcdedit /set hypervisorlaunchtype auto    # enable virtualisation
bcdedit /set hypervisorlaunchtype off     # disable virtualisation

bcdedit /copy {current} /d "windows 11 new boot loader"   # copy current bootloader to a new entry; /d means description
```

# Linux Boot
## efibootmgr
Find out `systemd` or `grub` is being used for boot loading
`efibootmgr -v`
This command shows the order of entries used for boot loading e.g.
```
BootCurrent: 0001
Timeout: 1 seconds
BootOrder: 0001,0008,0000
Boot0000  Windows Boot Manager	VenHw(99e275e7-75a0-4b37-a2e6-c5385e6c00cb)WINDOWS.........x...B.C.D.O.B.J.E.C.T.=.{.9.d.e.a.8.6.2.c.-.5.c.d.d.-.4.e.7.0.-.a.c.c.1.-.f.3.2.b.3.4.4.d.4.7.9.5.}....................
Boot0001* Fedora	HD(1,GPT,68fb6995-71a1-4fcb-85d4-8047d9781462,0x800,0x100000)/File(\EFI\FEDORA\SHIMX64.EFI)
Boot0008* Fedora	HD(1,GPT,68fb6995-71a1-4fcb-85d4-8047d9781462,0x800,0x100000)/File(\EFI\FEDORA\SHIM.EFI)..BO
```
This output means Boot entry number 0001 is going to be the first to attempt to bootload from, then number 0008, followed by 0000
