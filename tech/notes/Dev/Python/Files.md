```python
# Get handle to a file, read-only and get bytes
f = open('/path/to/file', 'rb')
bytes = f.read()
```
```python
# Get handle to a file (read-only) and read as ascii
f = open('/path/to/file', 'r')
bytes = f.read()
```
```python
# Get handle to a file - writable
f = open('/path/to/file', 'w')
```