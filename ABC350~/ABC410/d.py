from collections import deque

N, M = map(int, input().split())
graph = [[] for _ in range(N+1)]

for _ in range(M):
    a, b, w = map(int, input().split())
    graph[a].append((b, w))

visited = [[False] * 1024 for _ in range(N+1)]

queue = deque()
queue.append((1, 0))
visited[1][0] = True

min_xor = -1

while queue:
    node, xor_val = queue.popleft()
    
    if node == N:
        if min_xor == -1 or xor_val < min_xor:
            min_xor = xor_val

    for nxt, weight in graph[node]:
        new_xor = xor_val ^ weight
        if not visited[nxt][new_xor]:
            visited[nxt][new_xor] = True
            queue.append((nxt, new_xor))

print(min_xor)

    
