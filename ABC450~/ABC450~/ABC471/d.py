import heapq
heapq.heapify([])
q,v = list(map(int,input().split()))
query2 = []
for i in range(q):
    query = list(map(int,input().split()))
    if query[0] == 1:
        heapq.heappush([query[1],query[2]])
    else:
        query2.append(query[1])
print(heapq)


# バッテリー残量が大きい値を出力、出力したバッテリーは除去
# クエリ2のti[1] - ti[1] + ti[2]

# ある時点において、最も数の多い要素を管理する優先度付きキューのようなもので管理

# 最も

# ある時点で