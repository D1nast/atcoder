
# 点を増やして、その長方形に含まれるものはないか確認する
# 点iのx,y両方の値が新しく設置される点より小さい時に条件を満たさない


# xで一番長く取る
# yで一番長く取る

# x,yで最長の点をマークする
# 更新する

n = int(input())
pos = [list(map(int,input().split())) for _ in range(n)]
pos.sort()
minY = -1
ans = 0
for i in range(n):
    if i == 0:
        ans += 1
        minY = pos[i][1]
    else:
        if not(pos[i][0] > pos[i-1][0] and pos[i][1] > minY):
            ans += 1
        minY = min(minY,pos[i][1])

# print(pos)
print(ans)
# 両方と比較して大きいなら更新する
# xがlongX以上かつ、

# x軸で最小の値
# y軸で最小の値
