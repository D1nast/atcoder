# https://atcoder.jp/contests/abc333/tasks/abc333_d

# 出次数が1になるまで頂点1から生えている木のうちノード数が最小の木の値を足す。
# 最後に頂点１の削除回数を足して答えが求まる
# 閉路が無いので、木のノードの数がそのまま必要削除するとなる
# ノードの数はDFSで求められる

import sys
sys.setrecursionlimit(10 ** 6)

def dfs(cur,graph,visited,count,start):
    count[start]+=1
    visited[cur] = True
    for e in graph[cur]:
        if not visited[e]:
            dfs(e,graph,visited,count,start)


n = int(input())
graph = [[]for _ in range(n)]
visited = [False]*n
visited[0] = True
count = {}
ans = 1
for i in range(n-1):
    u,v = list(map(int,input().split()))
    u -=1
    v -=1
    graph[u].append(v)
    graph[v].append(u)

for nv in graph[0]:
    count.setdefault(nv,0)
    dfs(nv,graph,visited,count,start=nv)

ans_dict = sorted(count.items(), key=lambda x:x[1])
for i in range(len(graph[0])-1):
    ans += ans_dict[i][1]

print(ans_dict)
print(ans)
print(graph)