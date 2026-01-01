n,l = list(map(int,input().split()))
d = list(map(int,input().split()))
cnt = [0]*l
x = 0
ans = 0

if l%3 !=0:
    print(0)
    exit()

for i in range(n):
    if i!=0:
        x += d[i-1]
    x %= l
    cnt[x] += 1
    
for i in range(l//3):
    ans += cnt[i]*cnt[i+l//3]*cnt[i+2*l//3]

print(ans)
# % L で座標