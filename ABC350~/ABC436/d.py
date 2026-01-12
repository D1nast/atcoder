from collections import deque,defaultdict
import sys
input = sys.stdin.readline

def bfs(grid,visited,start,warp,h,w,warped):
    queue = deque()
    queue.append(start)
    used = defaultdict(bool)
    while queue:
        x,y,t = queue.popleft()
        if grid[x][y] not in ".#" and not used[grid[x][y]]:
            used[grid[x][y]] = True
            for nx,ny in warp[grid[x][y]]:
                if visited[nx][ny] == 10**18:
                    visited[nx][ny] = t+1
                    queue.append((nx,ny,t+1))
        # 周囲のマスを見る
        for dx,dy in [(1,0),(-1,0),(0,1),(0,-1)]:
            nx,ny = x+dx,y+dy
            # グリッドの範囲内かつ未訪問なら処理開始
            if 0 <= nx < h and 0 <= ny < w and visited[nx][ny] == 10**18 and grid[nx][ny] != "#":
                visited[nx][ny] = t+1
                queue.append((nx,ny,t+1))
    return visited[h-1][w-1]

h,w = map(int,input().split())
grid = []
warp = defaultdict(list)
visited = []
warped = []
for i in range(h):
    grid.append(input())
    visited.append([10**18]*w)
    warped.append([0**18]*w)
for i in range(h):
    for j in range(w):
        if grid[i][j] != "." and grid[i][j] != "#":
            warp[grid[i][j]].append((i,j))
visited[0][0] = 0
ans = bfs(grid,visited,[0,0,0],warp,h,w,warped)
if ans == 10**18:
    print(-1)
else:
    print(visited[h-1][w-1])