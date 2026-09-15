from collections import Counter

n = int(input())
res = {}
for i in range(n):
    s = input()
    if s.lower() in res:
        res[s.lower()]+=1
    else:
        res[s.lower()]=1
ans = 0

for i in res:
    ans = max(ans,res[i])
print(ans)