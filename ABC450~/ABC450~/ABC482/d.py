# https://atcoder.jp/contests/abc482/tasks/abc482_d

import math

n = int(input())
x = list(map(int,input().split()))
x.append(x[-1])
x.insert(0,x[0])

for i in range(1,n+1):
    ans = float("INF")

    # 左隣を感染させてから、右端に行く
    l_neighbor = math.ceil( (x[i]-x[i-1])/2 )
    l_edge = math.ceil( (x[i-1]-x[0])/2 )
    r_edge = math.ceil( (x[-1]-x[i])/2)
    ans = min( ans,l_neighbor + max(l_edge,r_edge) )

    # 右隣を感染させてから、左隣に行く
    r_neighbor = math.ceil( (x[i+1]-x[i])/2 )
    r_edge = math.ceil((x[-1]-x[i+1])/2)
    l_edge = math.ceil((x[i]-x[0])/2)
    ans = min( ans, r_neighbor+max(r_edge,l_edge))
    
    print(ans)