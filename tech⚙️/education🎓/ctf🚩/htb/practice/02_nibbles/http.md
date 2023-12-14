http://10.10.10.75/
```
<!-- /nibbleblog/ directory. Nothing interesting here! -->
```

http://10.10.10.75/nibbleblog/
![[Pasted image 20231214110917.png]]


http://10.10.10.75/nibbleblog/admin.php
Sign in page found

# ffuf
## /
```
                        [Status: 200, Size: 93, Words: 8, Lines: 17, Duration: 307ms]
.htaccess               [Status: 403, Size: 295, Words: 22, Lines: 12, Duration: 3796ms]
.htpasswd               [Status: 403, Size: 295, Words: 22, Lines: 12, Duration: 3796ms]
.hta                    [Status: 403, Size: 290, Words: 22, Lines: 12, Duration: 4915ms]
index.html              [Status: 200, Size: 93, Words: 8, Lines: 17, Duration: 307ms]
server-status           [Status: 403, Size: 299, Words: 22, Lines: 12, Duration: 253ms]
```

## /nibbleblog
```
                        [Status: 200, Size: 2987, Words: 116, Lines: 61, Duration: 2150ms]
admin.php               [Status: 200, Size: 1401, Words: 79, Lines: 27, Duration: 308ms]
admin                   [Status: 301, Size: 321, Words: 20, Lines: 10, Duration: 308ms]
.htpasswd               [Status: 403, Size: 306, Words: 22, Lines: 12, Duration: 3143ms]
.htaccess               [Status: 403, Size: 306, Words: 22, Lines: 12, Duration: 3145ms]
.hta                    [Status: 403, Size: 301, Words: 22, Lines: 12, Duration: 4194ms]
content                 [Status: 301, Size: 323, Words: 20, Lines: 10, Duration: 308ms]
index.php               [Status: 200, Size: 2987, Words: 116, Lines: 61, Duration: 308ms]
languages               [Status: 301, Size: 325, Words: 20, Lines: 10, Duration: 304ms]
plugins                 [Status: 301, Size: 323, Words: 20, Lines: 10, Duration: 219ms]
README                  [Status: 200, Size: 4628, Words: 589, Lines: 64, Duration: 305ms]
```

## /nibbleblog -e .php
```
                        [Status: 200, Size: 2987, Words: 116, Lines: 61, Duration: 307ms]
.hta.php                [Status: 403, Size: 305, Words: 22, Lines: 12, Duration: 307ms]
.hta                    [Status: 403, Size: 301, Words: 22, Lines: 12, Duration: 307ms]
.htaccess               [Status: 403, Size: 306, Words: 22, Lines: 12, Duration: 308ms]
.php                    [Status: 403, Size: 301, Words: 22, Lines: 12, Duration: 308ms]
.htpasswd.php           [Status: 403, Size: 310, Words: 22, Lines: 12, Duration: 4561ms]
.htpasswd               [Status: 403, Size: 306, Words: 22, Lines: 12, Duration: 4575ms]
.htaccess.php           [Status: 403, Size: 310, Words: 22, Lines: 12, Duration: 4577ms]
admin.php               [Status: 200, Size: 1401, Words: 79, Lines: 27, Duration: 306ms]
admin.php               [Status: 200, Size: 1401, Words: 79, Lines: 27, Duration: 306ms]
admin                   [Status: 301, Size: 321, Words: 20, Lines: 10, Duration: 309ms]
content                 [Status: 301, Size: 323, Words: 20, Lines: 10, Duration: 307ms]
feed.php                [Status: 200, Size: 302, Words: 8, Lines: 8, Duration: 306ms]
index.php               [Status: 200, Size: 2987, Words: 116, Lines: 61, Duration: 283ms]
index.php               [Status: 200, Size: 2987, Words: 116, Lines: 61, Duration: 284ms]
install.php             [Status: 200, Size: 78, Words: 11, Lines: 1, Duration: 286ms]
languages               [Status: 301, Size: 325, Words: 20, Lines: 10, Duration: 225ms]
plugins                 [Status: 301, Size: 323, Words: 20, Lines: 10, Duration: 306ms]
README                  [Status: 200, Size: 4628, Words: 589, Lines: 64, Duration: 309ms]
sitemap.php             [Status: 200, Size: 402, Words: 33, Lines: 11, Duration: 305ms]
themes                  [Status: 301, Size: 322, Words: 20, Lines: 10, Duration: 306ms]
update.php              [Status: 200, Size: 1622, Words: 103, Lines: 88, Duration: 306ms]
```