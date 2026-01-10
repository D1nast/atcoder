n,m = map(int, input().split())
graph = [[] for _ in range(n)]
ans = 10**18

for i in range(m):
    u,v = map(int, input().split())
    u -= 1
    v -=1
    graph[u].append(v)
    graph[v].append(u)


for i in range(1<<n):
    node = []
    count = 0
    for shift in range(n):
        # 1が黒で0が白
        if 1 & i>>shift==1 :
            node.append(1)
        else:
            node.append(0)

    for neighbor in range(n):
        for v in graph[neighbor]:
            if node[neighbor]== node[v]:
                count += 1
    ans = min(ans, count//2)

print(ans)


# 左シフト演算　1<<n 左項の値をn回左にシフト　
# 右シフト演算　i>>shift 左項の値をshift回右にシフトß