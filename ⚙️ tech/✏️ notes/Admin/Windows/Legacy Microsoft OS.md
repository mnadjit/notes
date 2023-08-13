# Download
https://ftp.webtent.net/iso/Microsoft/

# Windows 98 SE
Download: https://archive.org/details/windows-98-se-isofile
## License
`RW9MG-QR4G3-2WRR9-TG7BH-33GXB`
## Memory
### Over  1GB of memory Allocated
https://www.ibm.com/support/pages/windows-9598-error-insufficient-memory-initialize-windows-ibm-intellistation-m-pro-type-6889
If your computer has 1 gigabyte (GB) or more of random-access memory (RAM) installed, Windows 95/98 may not start. Also, when you try to start your computer, you may receive the following, or similar error message: "Insufficient memory to initialize Windows."
#### Solution
To correct this issue in a sytem installed with 1GB or of RAM, add the following line to the (386enh) section of the SYSTEM.INI file in Windows directory:  
`MaxPhysPage=3B000`
This enables the amount of physical RAM that Windows can access to 944MB. To do so, use the following steps, use any text editor (such as Notepad) to edit the `C:\Windows\SYSTEM.INI` file. Add the following line in the "386Enh" section of the file.

# Windows XP SP3 x86
## Download
https://archive.org/details/WinXPProSP3x86
## License
`MRX3F-47B9T-2487J-KWKMF-RPWBY`
### Other Win XP Licenses
https://gist.github.com/denizssch/72ec2aa1c5d0a84ffb57076f7dbf30d6
## Drivers
https://pve.proxmox.com/wiki/Windows_XP_Guest_Notes
### Download
#### WinCDEmu.exe 
Install first
https://github.com/sysprogs/WinCDEmu/releases/download/v4.1/WinCDEmu-4.1.exe
#### Virtio-Win.iso
Then use this to add missing drivers
https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/virtio-win-0.1.229-1/
