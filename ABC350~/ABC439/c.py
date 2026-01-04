import math
n = int(input())
arr = [0]*(n+1)
ans = []
count = 0
for x in range(1,int(math.sqrt(n))+1):
    for y in range(x+1,int(math.sqrt(n-x*x))+1):
        arr[x*x + y*y] += 1

for i in range(1,n+1):
    if arr[i] == 1:
        ans.append(i)
        count += 1
print(count)
if count >=1:
    print(" ".join(map(str, ans)))