n,q = map(int,input().split())
a = list(map(int,input().split()))
b = list(map(int,input().split()))
ans = 0

for i in range(n):
    ans += min(a[i],b[i])

for i in range(q):
    c,x,v = input().split()
    x,v = int(x),int(v)
    if c == "A":
        ans -= min(a[x-1],b[x-1])
        a[x-1] = v
        ans += min(a[x-1],b[x-1])
    else:
        ans -= min(a[x-1],b[x-1])
        b[x-1] = v
        ans += min(a[x-1],b[x-1])
    print(ans)
