
# bisect_left: x以上の値がある最初のインデックス
# bisect_right: xより大きい値がある最初のインデックス

import bisect

n,q = list(map(int,input().split()))
a = list(map(int,input().split()))
a.sort()
sum_a = [0]*n
sum_a[0] = a[0]
for i in range(1,n):
    sum_a[i] = sum_a[i-1]+a[i]

for i in range(q):
    b = int(input())
    if b == 1:
        print(1)
    elif b > a[-1]:
        print(-1)
    else:
        bis = bisect.bisect_left(a,b)
        if bis == 0:
            print((len(a)-bis)*(b-1)+1)
        else:
            print(sum_a[bis-1]+(len(a)-bis)*(b-1)+1)

# 1,4,4,81
# sum(二分探索でbi未満の値)

# bisect_left: x以上の値がある最初のインデックス