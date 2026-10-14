# https://atcoder.jp/contests/abc277/submissions/me
# 辞書型のDFS

import sys
sys.setrecursionlimit(10 ** 6)

def dfs(cur,floar,floar_visited,ans):
    floar_visited[cur] = True
    for e in floar[cur]:
        if not floar_visited[e]:
            ans["v"] = max(ans["v"],e)
            dfs(e,floar,floar_visited,ans)

n = int(input())
floar = {}
floar_visited = {}
ans = {}
ans.setdefault("v",1)
ans["v"]
for _ in range(n):
    a,b = list(map(int,input().split()))
    floar.setdefault(a,[])
    floar.setdefault(b,[])
    floar_visited.setdefault(a,False)
    floar_visited.setdefault(b,False)
    floar[a].append(b)
    floar[b].append(a)

if not 1 in floar:
    print(ans["v"])
else:
    floar_visited[1] = True
    for next_node in floar[1]:
        if not floar_visited[next_node]:
            ans["v"] = max(ans["v"],next_node)
            dfs(next_node,floar,floar_visited,ans)
    print(ans["v"])


# print(floar,floar_visited,ans["v"])
