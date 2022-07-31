import base64
###ASCII85型（ctf常用）
c = base64.a85decode(b'Ao(mgHX^E)AN2PSBOu3qI0o').decode() #解密
#m = base64.a85encode().decode()#加密
print(c)
