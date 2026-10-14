n = int(input())
parts = []
ans = 0
head = []
head.append([0,0,0])
w_sum=0
for _ in range(n):
    get = list(map(int,input().split()))
    parts.append(get)
    ans += get[2]


for i in range(n):
    if parts[i][1] > parts[i][2]:
        head.append(parts[i])
    w_sum += parts[i][0]

w_sum //= 2
dp = [[0]*(w_sum+1) for _ in range(len(head))]
for i in range(1,len(head)):
    for j in range(1,w_sum+1):
        if j >= head[i][0]:
            dp[i][j] = max(head[i][1]-head[i][2] + dp[i-1][j-head[i][0]],dp[i-1][j])
        else:
            dp[i][j] = dp[i-1][j]


# print(dp,"head",head)
print(ans+dp[-1][-1])