---
aliases:
  - Kali Linux
tags:
  - tech
  - cybsec
  - certification
  - oscp
  - python
author: Mehdi N Tehrani
creat_date: 2023-12-02
category: Cyber Security
subcategory: Offensive Security - OSCP
---

# String
#string_format
```python
print("This is {}".format(myvar))
print("This is %s" % myvar)
print(f"This is {myvar}")
```
# Dictionary
#dictionary
```python
mydict = { 'first': 1, 'last': 'end'}
mydict.get('first') # 1
mydict.update({'first':2}) # if 'first' doesn't exists, adds it to the dictionary
```
# Sockets
#sockets
#port_scanner
```python
#!/bin/python3
import sys
import socket as sc

# Define target
if len(sys.argv) == 2:
    target = sc.gethostbyname(sys.argv[1])
else:
    print('Invalid number of arguments provided')
    print('Usage: script.py <hostname>')
    sys.exit()

sc.setdefaulttimeout(.5)

for i in range(8080, 8085):
    try:
        c = sc.socket(sc.AF_INET, sc.SOCK_STREAM)
        c.connect((target, i))
        print(f"port is open: {i}")
        c.close()
    except KeyboardInterrupt:
        print('Exiting program...')
        c.close()
        sys.exit()
    except sc.gaierror:
        print('Could not resolve hostname')
        sys.exit()
    except sc.error:
        print(f"port is closed: {i}")
```

# Files
```python
myfile = open("./test.txt") # default in 'r' mode
is_readable = myfile.readable()
whole_file_content = myfile.read() 
first_line = myfile.readline() 
myfile.seek(0) # set file reader to the beginning of the file

my_writable_file = open("./test.txt", 'w')
mywritable_file.write("text to be written to file")
my_appendable_file = open("./test.txt", 'a')
```
