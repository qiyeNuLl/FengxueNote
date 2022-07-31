a = "afZ_r9VYfScOeO_UL^RWUc"
L = []
n = len(a)
for i in range(0,n):
    j = ord(a[i]) + i + 5
    L.append(chr(j))
    print(L)
    b = "".join(map(str,L))
    print(b)

#凯撒密码变种，原字符串转ascii后为了向flag靠拢，出现每个字符+i+5的规律