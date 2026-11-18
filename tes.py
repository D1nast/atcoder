# 優先度付きキューとキューの合わせ技
# イベントは優先度付きキューで、待ちは配列で管理

from collections import deque
import heapq

n,k = list(map(int,input().split()))
restraunt = 0
event = []
wait = deque()
ans =[]
for i in range(n): event.append(list(map(int,input().split()))+["A"])
heapq.heapify(event)
# print(event)

while event:
    # 事が発生する時間、滞在時間、人数、パターン
    i,o,p,pattern = heapq.heappop(event)
    if pattern == "A":
        if not wait and restraunt+p <= k:
            restraunt += p
            heapq.heappush(event,[o+i,o,p,"B"])
            ans.append(i)
        else:
            wait.append([i,o,p,pattern])
    else:
        restraunt -= p
        while len(wait) > 0:
            if wait[0][2]+ restraunt <= k:
                restraunt += wait[0][2]
                heapq.heappush(event,[i+wait[0][1],wait[0][1],wait[0][2],"B"])
                ans.append(i)
                wait.popleft()
            else:
                break

# 小技だが、for文でprintすると１ケースTLEになったため
print("\n".join(map(str,ans)))
 
