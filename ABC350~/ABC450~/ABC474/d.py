n = int(input())
a = list(map(int,input().split()))
b = list(map(int,input().split()))
countb = 0
counta = 0
ans = [0]*n
check = [False]*n
for i in range(n):
    if b[i]>=a[i]:
        countb += b[i]-a[i]
        ans[i]=1
        check[i]=True
    else:
        counta += 1

if counta*10**18 <= countb:
    print("No")
else:
    for i in range(n):
        if check[i]:
            continue
        else:
            ans[i] = 10**18
    print("Yes")
    result = " ".join(map(str,ans))
    print(result)

