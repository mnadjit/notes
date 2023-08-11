#!/usr/bin/env python

from pwn import *

HOST = 'mercury.picoctf.net'
PORT = 41934

MAX_CHUNK_SIZE = 1_000
KEY_LENGTH = 50_000

context.log_level = 'error'

r = remote(HOST, PORT)
r.recvuntil(b'flag!\n')

enc_flag = unhex(r.recvlineS())
log.info(f"encrypted flag:\n{enc_flag}")

counter = KEY_LENGTH - len(enc_flag)

with log.progress('wrapping around...') as p:
    while counter > 0:
        p.status(f"{counter} bytes left")
        chunk_size = min(MAX_CHUNK_SIZE, counter)
        r.sendlineafter(b'encrypt? ', b'\0' * chunk_size)

        counter -= chunk_size 

r.sendlineafter("encrypt? ", enc_flag)
r.recvlineS()

flag = unhex(r.recvlineS()).decode('ascii')
print(f"picoCTF{{{flag}}}")
