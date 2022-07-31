import hashlib
a=hashlib.md5()
a.update('1'.encode(encoding='utf-8'))
b=a.hexdigest()
print(b)