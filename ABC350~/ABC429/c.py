n = int(input())
a = map(int,input().split())
c = [0]*(n+1)
ans = 0
for i in a:
    c[i] += 1

for i in range(1,n+1):
    ans += int(c[i]*(c[i]-1)/2)*(n-c[i])

print(ans)