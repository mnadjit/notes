#!/usr/bin/python3

import socket

HOST = "mercury.picoctf.net"
PORT = 7449

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.connect((HOST, PORT))
    data = s.recv(1024)

items = filter(None, data.decode(encoding='ascii').split(' \n'))
flag_list = [chr(int(x)) for x in items]

print("".join(flag_list))
