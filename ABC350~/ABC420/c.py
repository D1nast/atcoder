n,q = map(int,input().split())
a = list(map(int,input().split()))
b = list(map(int,input().split()))
ans = 0

for i in range(n):
    ans += min(a[i],b[i])

for i in range(q):
    c,x,v = input().split()
    x,v = int(x)-1,int(v)
    pre = min(a[x],b[x])
    if c == "A":
        a[x] = v
    else:
        b[x] = v
    now = min(a[x],b[x])
    ans += now - pre
    print(ans)
