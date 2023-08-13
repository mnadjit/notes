> `diskutil list`
- Get a list of all block devices
> `sudo diskutil mount disk0f1`
- Mount a disk; Name is found in the list obtained using `diskutil tool` e.g. disk0f1
> `sudo diskutil unmount disk0f1`
- Unmount a disk

# Resize Virtual Disk
Once virtual disk has been resized, the following commands should be run to allow the apfs partitions to expand into the free space. For example if the virtual disk is a Linux qemu disk format i.e. qcow2, after running `qemu-img resize MyDisk.qcow2 +20G
` to expand the file MyDisk.qcow2 by 20 gigabytes, the following commands should be run in Mac terminal. Explained [here](https://github.com/foxlet/macOS-Simple-KVM/issues/212#issuecomment-1054225692).
> `diskutil repairdisk <disk#>`   e.g.  `diskutil repairdisk disk0`
> `diskutil apfs resizeContainer <partition_id> 0`    e.g.  `diskutil apfs resizeContainer disk0s3 0`
- disk# and partition_id are both found using `diskutil list`
- partition_id is the id of the partition you'd want to expand into the free space of the disk containing it