#!/usr/bin/python3

f = open("./enc", "r")
d = f.read()

u16 = b''.join([d[i].encode("utf-16") for i in range(0, len(d))])

flag=[]
for i in range(0, len(u16), 4):
    flag.append(''.join([chr(u16[i + 3]), chr(u16[i + 2])]))

print(''.join(flag))
