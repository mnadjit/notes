#!/usr/bin/env python3

import string
import re

enc_flag = 'ihjghbjgjhfbhbfcfjflfjiifdfgffihfeigidfligigffihfjfhfhfhigfjfffjfeihihfdieieih'
ALPHABET = string.ascii_lowercase[:16]
LOWERCASE_OFFSET = ord('a')

for x in range(0, len(ALPHABET)):
    flag = "" 
    for i in range(0, len(enc_flag), 2):
        c1_idx = (ord(enc_flag[i]) - LOWERCASE_OFFSET - x) % len(ALPHABET)
        c2_idx = (ord(enc_flag[i+1]) - LOWERCASE_OFFSET - x) % len(ALPHABET)
        c = chr((c1_idx << 4) + c2_idx) 
        flag += c
    
    flag_pattern = f"(\w|\d|[_\?]){{{int(len(enc_flag) / 2)}}}"
    if re.match(flag_pattern, flag):
        print(f"picoCTF{{{flag}}}")
