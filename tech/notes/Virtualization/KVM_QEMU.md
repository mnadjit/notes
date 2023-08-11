# Convert .ova to .qcow2
https://www.vinchin.com/en/blog/convert-ova-to-qcow2.html
- `tar -xvf /path/to/image.ova`: to get vmdk.gz file
- `gunzip /path/to/compressed.gz`: to get the vmdk file
- `qemu-img convert -p -f vmdk -O qcow2 /path/to/image.vmdk /path/to/image.qcow2`

