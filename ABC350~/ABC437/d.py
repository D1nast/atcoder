import bisect

n, m = list(map(int, input().split()))
a = list(map(int,input().split()))
b = list(map(int,input().split()))
ans = 0
mod = 998244353
a_sum = [0]*n
a.sort()
a_sum[0]=a[0]
# print("a",a)

for i in range(1,n):
    a_sum[i] = a_sum[i-1]+a[i]

print("a_sum",a_sum)
for i in b:
    left = bisect.bisect_left(a,i)
    print("i",i,"left",left)
    if left == 0:
        ans += a_sum[-1] - n*i
    else:
        # 左側
        ans += i*left - a_sum[left-1] 
        # 右側
        ans += (a_sum[-1]-a_sum[left-1]) - i*(n-left)

print(ans%mod)



#　AーB >= 0 の時は i*n 
#  A-B <0 の時はひき算を逆にする
# Aの総和からB×Aの個数ひき算するだけ
