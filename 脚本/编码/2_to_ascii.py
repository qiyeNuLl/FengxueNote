a='01101011011011110110010101101011011010100011001101110011'

flag=' '

b = [a[i:i+8] for i in range(0,len(a),8)]

L = []

for i in b:
    flag = chr(int(i,2))
    print(flag)
    L.append(flag)
    b = "".join(map(str,L))
    print("flag{"+b+"}")