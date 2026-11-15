# https://atcoder.jp/contests/abc481/tasks/abc481_d
# ダイクストラ法を使う問題
# スタートノードから隣接するノードを調べる
# 最短距離の隣接ノードから、更にそこから隣接するノードを調べる（これを繰り返す）

import heapq

def dijkstra(space, start, end):
    # 未訪問ノードの距離を無限
    distances = {node: float('infinity') for node in space}
    distances[start] = 0
    queue = [(0, start)]
    
    while queue:

        current_distance, current_node = heapq.heappop(queue)
        
        if current_node == end:
            return distances[end]

        for neighbors in space[current_node]:
            next_node,weight = neighbors[0],neighbors[1]
            distance = current_distance + weight
            # print("disctance",distance,"distances",distances)
            if distance < distances[next_node]:
                distances[next_node] = distance
                heapq.heappush(queue,(distance,next_node))        

    return -1

n,m,s,t = list(map(int,input().split()))
space = {i:[] for i in range(1,n+1) }

for _ in range(m):
    load = list(map(int,input().split()))
    space.setdefault(load[0],[])
    space[load[0]].append([load[1],-1])

for k,v in space.items(): 
    v.sort()
    for i in range(len(v)):
        v[i][1]=0 if i == 0 else 1 

print(dijkstra(space, s, t))