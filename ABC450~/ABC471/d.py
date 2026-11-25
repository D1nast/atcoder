# https://atcoder.jp/contests/abc471/tasks/abc471_d
# 最初にクエリ1が来るタイミングを基準として、優先度付きキューで実装する
# 時刻を揃えることで、クエリ2が到来するたびに、線形で変更を反映させずに済む

import heapq
q,v = list(map(int,input().split()))
battery = []
heapq.heapify(battery)
base = []
for i in range(q):
    query = list(map(int,input().split()))
    type = query[0]
    content = query[1:]

    if type ==1 and not base:
        base.append(query[1])

    if type ==1:
        heapq.heappush(battery,-(content[1]-content[0]+base[0]))
    else:
        if not battery:
            print(-1)
        else:
            out = heapq.heappop(battery)
            print(min(-(out-content[0]+base[0]),v ))

