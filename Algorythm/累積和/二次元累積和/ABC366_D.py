
# https://atcoder.jp/contests/abc366/submissions/79886752
# xはブロック数　yは行数　zは列数を表す


n = int(input())
grid = [[] for _ in range(n)]

for i in range(n):
    grid[i].append([0]*(n+1)) 
for i in range(n**2):
    query = [0]+list(map(int,input().split()))
    grid[i//n].append(query)

q = int(input())
query = []
ans = [0]*q

for i in range(q):
    query.append(list(map(int,input().split())))

# Gridの2次元累積和
for i in range(n):          # ブロック
    for j in range(1, n+1):     # 行
        for k in range(1, n+1): # 列
            grid[i][j][k] += grid[i][j-1][k] + grid[i][j][k-1] - grid[i][j-1][k-1]

print(grid)
# クエリ回答
for q_num in range(q):
    query_i = query[q_num]
    tmp = 0
    x1,x2 = query_i[2],query_i[3]
    y1,y2 = query_i[4],query_i[5]
    # ブロック番号
    for i in range(query_i[0]-1,query_i[1]):
        # print("i",i)
        tmp += grid[i][x2][y2] - grid[i][x1-1][y2] - grid[i][x2][y1-1] + grid[i][x1-1][y1-1]
    print(tmp)

