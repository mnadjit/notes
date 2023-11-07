#!/usr/bin/env python

import hashlib

key_start = "picoCTF{1n_7h3_|<3y_of_"
username = b"SCHOFIELD"

key = key_start
key += hashlib.sha256(username).hexdigest()[4]
key += hashlib.sha256(username).hexdigest()[5]
key += hashlib.sha256(username).hexdigest()[3]
key += hashlib.sha256(username).hexdigest()[6]
key += hashlib.sha256(username).hexdigest()[2]
key += hashlib.sha256(username).hexdigest()[7]
key += hashlib.sha256(username).hexdigest()[1]
key += hashlib.sha256(username).hexdigest()[8]
key += "}"

print(key)
