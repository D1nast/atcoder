# 1~N1までのグラフの際長距離
# N1+1~N1+N2までのグラフの際長距離
# これらの合算+1の数を答える



from collections import deque

n1,n2,m = list(map(int,input().split()))
graph_1 = [[] for _ in range(n1)]
graph_2 =[[] for _ in range(n1+n2)]
visited = [False]*(n1+n2)
distance_1 = [0]*n1
distance_2 = [0]*(n1+n2)
ans = 0
max_h1 = 0
max_h2 = 0

# グラフの初期化
for i in range(m):
    a,b = list(map(int,input().split()))
    if a<=n1 and b<=n1:
        graph_1[a-1].append(b-1)
        graph_1[b-1].append(a-1)
    else:
        graph_2[a-1].append(b-1)
        graph_2[b-1].append(a-1)

# 1~N1のグラフ探索
Q = deque()
visited[0]=True
distance_1[0]=0
for node in graph_1[0]:
    Q.append([node,1])
    visited[node]=True
    distance_1[node]=1

while Q:
    deq,dist = Q.popleft()
    max_h1 = max(distance_1[deq],max_h1)
    # 隣のノードを探索
    for nv in graph_1[deq]:
        if not visited[nv]:
            Q.append([nv,dist+1])
            visited[nv]=True
            distance_1[nv]=dist+1

# N1~N1+N2のグラフ探索
visited[n1+n2-1]=True
distance_2[n1+n2-1]=0
for node in graph_2[n1+n2-1]:
    Q.append([node,1])
    visited[node]=True
    distance_2[node]=1

while Q:
    deq,dist = Q.popleft()
    max_h2 = max(distance_2[deq],max_h2)
    # 隣のノードを探索
    for nv in graph_2[deq]:
        if not visited[nv]:
            Q.append([nv,dist+1])
            visited[nv]=True
            distance_2[nv]=dist+1

print(max_h1+max_h2+1)
