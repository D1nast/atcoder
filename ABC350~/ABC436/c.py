n,m = map(int,input().split())
count = 0
set = set()
square = [[0,0],[0,1],[1,0],[1,1]]

for i in range(m):
    r,c = map(int,input().split())
    check = 0
    for d in square:
        dr,dc = r + d[0], c + d[1]  
        if (dr,dc) in set:
            check = 1
            break
    
    if check == 0:
        count += 1
        for d in square:
            dr,dc = r + d[0], c + d[1] 
            set.add((dr,dc))

print(count)

#　アルゴリズムの方針
# 周囲のマスに黒マスがないか確認、あれば無理フラグ立ててそのループ終了
# 周囲のマスに何もなければ　set add 、count += 1