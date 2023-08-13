> Use dd
- `if`: input file
- `of`: output file
- `bs`: Bytes to be read and written at any time. default=512 KB
```sh
sudo dd if=/path/to/in_file of=/path/to/out_file bs=4M status=progress
```
