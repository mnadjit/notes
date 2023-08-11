# xargs
```sh
# find all file (no directories) with name like test *, and move to directory $dir
# xargs -I %: where % is the placeholder for each string find returns. Anything else can be used e.g. '{}' \
#     which would become: xargs -I '{}' mv '{}' $dir
find . -type f \( -not -name "test*" \) | xargs -I % mv % $dir
```

# find
```sh
find . -type d   # find directories only
find . -type f   # find files only
find . -type f \( -name "*.txt" -or -name "*.log" \) # find files with *.txt or *.log pattern
```

# dd
```sh
dd if=/path/to/dir of=/dev/sdX1 bs=4m conv=fdatasync
mkisofs -o ./image.iso /path/to/dir
```
