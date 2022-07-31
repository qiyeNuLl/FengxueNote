import hashlib

filename = '/fllllllllllllag'
cookie_secret ="2b42d60e-4cd8-41a1-9de7-ba7efd2405e5"

def getvalue(string):
    md5 = hashlib.md5()
    md5.update(string.encode('utf-8'))
    return md5.hexdigest()

def merge():
    print(getvalue(cookie_secret + getvalue(filename)))

merge()