def func(s1,s2):
    a = [0] * 26
    for i in s1:
        mid = ord(i) - ord('a')
        a[mid] += 1
    for i in s2:
        mid = ord(i) - ord('a')
        a[mid] += 1
    index = 0
    while index < 26:
        if a[index] != 0 and a[index] != 2:
            return False
        index += 1
    return True

def demo():
    strs = ["eat", "tea", "tan", "ate", "nat", "bat"]
    res = []
    right = 1
    while len(strs) > 0:
        ans = []
        while right < len(strs):
            if func(strs[0],strs[right]):
                ans.append(strs.pop(right))
            else:
                right += 1
            ans.append(strs.pop(0))
        print(ans)
        res.append(ans)
    return res



print(demo())
