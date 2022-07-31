nums = [1,2,3,4,5,6,7,8,9,0]
target = 11
l = len(nums)
for i in range(0,l):
    j = i
    for j in range(i+1,l):
        if nums[i] + nums[j] == target:
            print(i,j)
