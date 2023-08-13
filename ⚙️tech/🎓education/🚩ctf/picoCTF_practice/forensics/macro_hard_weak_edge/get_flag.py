#!/usr/bin/env python3

import base64

f = open('./ppt/slideMasters/hidden', 'r').read()

flag_b64 = f.replace(' ', '')
flag = base64.b64decode(flag_b64 + '==').decode('ascii').split(' ')[1]

print(flag)

