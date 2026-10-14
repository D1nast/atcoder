n,x = list(map(int,input().split()))
money = []
for _ in range(n):
    money.append(list(map(int,input().split())))
yen = [1]*x
for i in range(1,x):
    yen[i]=i+1

dp = [[] for _ in range(n)]
dp_bool = [[False]*x for _ in range(n)]
for i in range(n):
    dp[i].append(yen)

print(dp,dp_bool)