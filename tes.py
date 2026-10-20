import math
from itertools import permutations

n,s,t = list(map(int,input().split()))
grid = []
ans = float("INF")
for _ in range(n):
    grid.append(list(map(int,input().split())))


for perm in permutations(grid, n):
    for i in range(2**n):
        tmp = 0
        now = [0,0]
        for j in range(n):
            if (i>>j)&1:
                # 前の地点からAiBiに移動
                x = now[0]-perm[j][0]
                y = now[1]-perm[j][1]
                tmp += math.sqrt(x**2 + y**2)/s
                # AiBiからCiDiにレーザー照射
                x = perm[j][0]-perm[j][2]
                y = perm[j][1]-perm[j][3]
                tmp += math.sqrt(x**2 + y**2)/t
                now[0],now[1] = perm[j][2],perm[j][3]
            else:
                # 前の地点からCiDiに移動
                x = now[0]-perm[j][2]
                y = now[1]-perm[j][3]
                tmp += math.sqrt(x**2 + y**2)/s
                # CiDiからAiBiにレーザー照射
                x = perm[j][2]-perm[j][0]
                y = perm[j][3]-perm[j][1]
                tmp += math.sqrt(x**2 + y**2)/t
                now[0],now[1] = perm[j][0],perm[j][1]
        ans = min(ans,tmp)

print(ans)


