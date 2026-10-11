n = int(input())
s = input()
tmp = 0
ans = 0
for i in range(n):
    if s[i]=="R":
        tmp += 1
        if i == n-1:
            ans = max(ans,tmp)   
    else:
        ans = max(ans,tmp)
        tmp = 0
print(ans)