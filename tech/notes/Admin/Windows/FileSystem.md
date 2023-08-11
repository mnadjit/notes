---
alias: 
tags: partition diskpart 
---
# References
https://www.partitionwizard.com/partitionmanager/cmd-list-drives.html

# Partition
## fdisk
## diskpart
```cmd
:: run diskpart
diskpart

:: get a list of all disks
list disk

:: select a disk
select disk <disk_number>
:: for example 'select disk 0'

:: list volumes in disk 
list volume
list partition
```

## WMIC
```cmd
wmic logicaldisk get name, caption, deviceid, volumename, description
```
