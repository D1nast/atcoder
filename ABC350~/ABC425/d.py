from collections import deque
# タイムスタンプ付きBFS
def bfs(start,grid,visited,ans):
    queue = deque()
    for element in start:
        queue.append(element)
    while queue:
        x,y,t = queue.popleft()
        t += 1
        # 黒塗りされているマスの隣接マスを探索
        for dx,dy in [(1,0),(-1,0),(0,1),(0,-1)]:
            black_count = 0
            nx,ny = x+dx,y+dy
            # 未訪問なら訪問済にして、タイムスタンプを記録
            if 0 <= nx < h and 0 <= ny < w and visited[nx][ny][0] == 0:
                visited[nx][ny][0] = 1
                visited[nx][ny][1] = t
                # 隣接マスの隣のマスの黒塗りが１だけなら黒塗り、Queueに追加
                # この時、タイムスタンプが異なるものだけをカウントする
                for n_dx,n_dy in [(1,0),(-1,0),(0,1),(0,-1)]:
                    nnx,nny = nx+n_dx,ny+n_dy
                    if 0 <= nnx < h and 0 <= nny < w and grid[nnx][nny] == "#" and visited[nnx][nny][1] != t: 
                        black_count += 1
                if black_count == 1:
                    grid[nx][ny] = "#"
                    queue.append((nx,ny,t))
                    ans += 1
    return ans

# 黒塗りマスの周囲のマスを探索
# 未訪問なら訪問済ににする
# ①のマスの更に周囲のマスを探索し、黒塗りのマスが一つなら黒塗りしてキューに追加
# この時、タイムスタンプが同じマスは黒塗りマスとカウントしない（■ □ □ ■）など同時に塗らないといけないケースがあるため

h,w = map(int,input().split())
# 0が未訪問、1が訪問済み
grid = [list(input()) for _ in range(h)]
# visited = [[0,0]*w for _ in range(h)]
visited = [[[0,0] for _ in range(w)] for _ in range(h)]

start = []
ans = 0
for i in range(h):
    for j in range(w):
        if grid[i][j] == '#':
            visited[i][j][0] += 1
            ans += 1
            start.append((i,j,0))

ans = bfs(start,grid,visited,ans)
print(ans)
# for row in grid:
#     print("".join(row))

# directions = [(1,0),(-1,0),(0,1),(0,-1)]
