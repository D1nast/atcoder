from collections import defaultdict

n = int(input())
a = list(map(int,input().split()))
dp = defaultdict(int)

for i in range(n):  dp[a[i]] = dp[a[i]-1]+1 if a[i]-1 in dp else 1

ans = 0
for k,v in dp.items(): ans = max(ans,v)
print(ans)