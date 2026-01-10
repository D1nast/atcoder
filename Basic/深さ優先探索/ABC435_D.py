import sys
sys.setrecursionlimit(10**7)

def dfs(graph, q2, is_blacked):
    for next_node in graph[q2]:
        if is_blacked[next_node] == 0:
            is_blacked[next_node] = 1
            dfs(graph, next_node, is_blacked)

n,m = map(int, input().split())
graph = [[]for _ in range(n)]
is_blacked = [0]*n

for _ in range(m):
    x,y = map(int, input().split())
    x -= 1
    y -= 1
    graph[y].append(x)

for _ in range(int(input())):
    q1, q2 = map(int, input().split())
    q2 -= 1
    if q1 == 1:
        if is_blacked[q2] == 0:
            is_blacked[q2] = 1
            dfs(graph, q2, is_blacked)

    else:
        print("Yes" if is_blacked[q2] else "No")