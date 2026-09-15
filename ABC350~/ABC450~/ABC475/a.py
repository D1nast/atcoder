import  bisect

n, s, L = list(map(int,input().split()))
a = list(map(int,input().split()))

P = [0] * n
for i in range(n - 1):
    P[i + 1] = P[i] + a[i]
s -= 1
print(P)
ans = 1

for l in range(s + 1):
    rem = L - 2 * (P[s] - P[l])
    if rem < 0:
        continue
    r = bisect.bisect_right(P, P[s] + rem) - 1
    ans = max(ans, r - l + 1)

for r in range(s, n):
    rem = L - 2 * (P[r] - P[s])
    if rem < 0:
        continue
    l = bisect.bisect_left(P, P[s] - rem)
    ans = max(ans, r - l + 1)

print(ans)
