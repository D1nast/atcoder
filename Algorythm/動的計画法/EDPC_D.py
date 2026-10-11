# ナップサック問題
# https://atcoder.jp/contests/dp/tasks/dp_d

n,w = list(map(int,input().split()))
knapsack = [[0]*(w+1) for _ in range(n+1)]
item = []
item.append([0,0])
for i in range(n):
    item.append(list(map(int,input().split())))

for i in range(1,n+1):
    for j in range(1,w+1):
        if j < item[i][0]:
            knapsack[i][j] = knapsack[i-1][j]
        else:
            knapsack[i][j] = max( item[i][1]+knapsack[i-1][j-item[i][0]],knapsack[i-1][j] )

print(knapsack[-1][-1])

# 品物iまでで、品物iを選んだ時の総和
# 品物iまでで、品物iを選ばなかった時の総和