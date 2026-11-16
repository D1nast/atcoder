n,q = list(map(int,input().split()))
l = list(map(int,input().split()))
r = list(map(int,input().split()))
query = []
for_left = [float("inf")]*(n-1)
for_right = [float("inf")]*(n-1)

for i in range(q):
    query.append(list(map(int,input().split())))

for i in reversed(range(n-1)):
    if i == n-2:
        for_left[i] = l[i]
    else:
        for_left[i] = min(for_left[i+1],l[i])
for i in (range(n-1)):
    if i == 0:
        for_right[i] = r[i]
    else:
        for_right[i] = min(for_right[i-1],r[i])


for i in range(q):
    s,t = query[i][0],query[i][1]
    if s==1:
        print(r[0])
    elif s == n:
        print(l[-1])
    else:
        # 左行き
        if s>t:
            print(min( l[s-2],r[s-1]+for_left[s-1] ))
        # 右行き
        else:
            print(min( r[s-1],l[s-2]+for_right[s-2] ))