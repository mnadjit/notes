```sh
$ sudo apt-get update
$ sudo apt-get install python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential
$ python3 -m pip install --upgrade pip
$ python3 -m pip install --upgrade pwntools
```

```python
from pwntools import *

r = pwn.remote(HOST, PORT)
r.recvuntil('> ')
r.send(b'string to send')
print(r.recvline())
```