# https://atcoder.jp/contests/abc482/tasks/abc482_c
# 累積和と二分探索で解く

import bisect

h,w,n,q = list(map(int,input().split()))
tmp_r = []
tmp_c = []
for i in range(n):
    r,c = list(map(int,input().split()))
    tmp_r.append(r)
    tmp_c.append(c)

tmp_r.sort()
tmp_c.sort()

row = {}
column = {}

for i in tmp_r:
    row.setdefault(i,0)
    row[i] += 1

for j in tmp_c:
    column.setdefault(j,0)
    column[j] += 1

row_key = [0]
row_val = [0]
column_key = [0]
column_val = [0]

for k,v in row.items():
    row_key.append(k)
    row_val.append(row_val[-1]+v)

for k,v in column.items():
    column_key.append(k)
    column_val.append(column_val[-1]+v)

for i in range(q):
    query = list(map(int,input().split()))
    if query[0] == 1:
        left = bisect.bisect_left(row_key,query[1])
        right = bisect.bisect_right(row_key,query[2])-1
        print(row_val[right]-row_val[left-1])
    else:
        left = bisect.bisect_left(column_key,query[1])
        right = bisect.bisect_right(column_key,query[2])-1
        print(column_val[right]-column_val[left-1])