t = int(input())

for i in range(t):
    n,h = map(int,input().split())
    next_l=next_u = h 
    now = 0
    ans = True
    for j in range(n):
        t,l,u = map(int,input().split())
        next_l -= t - now
        next_u += t - now
        now = t
        next_l = max(l,next_l)
        next_u = min(u,next_u)
        if next_l > next_u :
            ans = False
    print("Yes" if ans else "No")