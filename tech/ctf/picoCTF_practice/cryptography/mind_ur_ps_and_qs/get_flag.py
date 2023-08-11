#!/usr/bin/python

from Crypto.Util.number import inverse

c = 964354128913912393938480857590969826308054462950561875638492039363373779803642185
n = 1584586296183412107468474423529992275940096154074798537916936609523894209759157543
e = 65537

# found from n using factordb.com
p = 2434792384523484381583634042478415057961
q = 650809615742055581459820253356987396346063


# m = c^d mod n 
# d = e mod lcm(p-1, q-1) 
# d = e^-1 mod totient
# n = p * q

enc_msg_bytes = c.to_bytes((c.bit_length() + 7) // 8, 'big')
#print(enc_msg_bytes.hex())
    
r = (p-1) * (q-1)

d = inverse(e, r)

m = pow(c, d, n)

print(m.to_bytes((m.bit_length() + 7) // 8, 'big').decode('latin-1'))
