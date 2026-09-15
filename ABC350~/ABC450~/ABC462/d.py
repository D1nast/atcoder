# 一緒にいる時間がD以上なら可能性あり
n,d = list(map(int,input().split()))
m = 10**6+1
times = [0]*m
ans = 0
c = 0
for i in range(n):
    s,t = list(map(int,input().split()))
    if s+d <=t :
        times[s] += 1
        times[t-d+1] -= 1

for i in range(m):
    c += times[i]
    ans += c*(c-1) //2 
print(ans)
