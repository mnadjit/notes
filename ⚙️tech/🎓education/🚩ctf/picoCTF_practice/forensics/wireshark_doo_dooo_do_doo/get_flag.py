#!/usr/bin/env python3

import os
import re

packet_numbers = os.popen("tshark -r ./shark1.pcapng -Y http | grep 'text/html' | awk '{print $1}'").read().split('\n')

for pn in packet_numbers:
    if not pn.isnumeric():
        continue

    lines = os.popen(f"tshark -r ./shark1.pcapng -x frame.number=={pn}").read().split('\n')

    packet = ""
    for l in lines:
        packet += l[-16:]

    enc_flag = re.search("\w{7}\{.*?\}", packet)

    if enc_flag:
        enc_flag = re.search("\w{7}\{.*?\}", packet).group(0)
    else:
        continue
    
    rot13trans = str.maketrans('NOPQRSTUVWXYZABCDEFGHIJKLMnopqrstuvwxyzabcdefghijklm', 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz')

    print(enc_flag.translate(rot13trans))
