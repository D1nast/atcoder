n = int(input())
a = list(map(int,input().split()))
a_sum = [a[0]]*n
ans = 0
for i in range(1,n):
    a_sum[i] = a[i] + a_sum[i-1]

for i in range(n):
    ans += (a_sum[-1] - a_sum[i])*a[i]

print(ans)

# 累積和とる
# 掛け算まとめる
# n回回す
