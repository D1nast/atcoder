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

# print("a_sum",a_sum)
for i in b:
    left = bisect.bisect_left(a,i)
    # print("left",left)
    if left == 0:
        ans += a_sum[-1] - n*i
    else:
        # 左側
        ans += i*left - a_sum[left-1] 
        # 右側
        ans += (a_sum[-1]-a_sum[left-1]) - i*(n-left)

print(ans%mod)
# for i in b:
#     l = 0
#     r = n
#     while (r - l) >1:
#         mid = ((l + r)/2)
#         if i >= a[mid]:
#             l = mid
#         else:
#             r = mid
    
