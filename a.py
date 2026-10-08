n = int(input())
dp = [float("inf")]*(n)
query = [[]]

for i in range(n):
    query.append(list(map(int,input().split())))



print(dp[-1])


# [inf,inf,inf,inf,inf]
# 各iは、ステージにたどり着くまでに払った最小のコストを示す

# [inf,100,200]

# 各到達ステージまでに支払ったコストをメモする

Xiごとに飛ぶ