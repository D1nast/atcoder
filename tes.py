def dfs(h,w,k,grid,visited,count,cur_h,cur_w,tmp_k):
    # 移動回数を満たしたならreturn
    if tmp_k == k:
        count["ans"] += 1
        return
    visited[cur_h][cur_w] = True
    # 上下左右
    for nw,nh in [[-1,0],[1,0],[0,-1],[0,1]]:
        next_nh = nh + cur_h
        next_nw = nw + cur_w
        if 0<=next_nh and next_nh<h and 0<=next_nw and next_nw<w:
            if grid[next_nh][next_nw] == "." and visited[next_nh][next_nw] == False:
                dfs(h,w,k,grid,visited,count,next_nh,next_nw,tmp_k+1)
    visited[cur_h][cur_w] = False
    
h,w,k = list(map(int,input().split()))
grid = []
for _ in range(h):
    grid.append(input())
count = {"ans":0}

for i in range(h):
    for j in range(w):
        if grid[i][j] == ".":
            tmp_visited = [[False]*w for _ in range(h)]
            tmp_visited[i][j] = True
            # 上下左右
            for nh,nw in [[-1,0],[1,0],[0,-1],[0,1]]:
                next_nh = nh + i
                next_nw = nw + j
                if 0<=next_nh and next_nh<h and 0<=next_nw and next_nw<w:
                    if grid[next_nh][next_nw] == ".":
                        # print("1階層目開始","i,j",i,j,"nw,nh",nh,nw,"tmp_visited",tmp_visited)
                        dfs(h,w,k,grid,tmp_visited,count,next_nh,next_nw,tmp_k=1)

print(count["ans"])
# 配列をコピー
# 各マス毎にコピー&探索
# K回移動するか、移動できなくなったら終了