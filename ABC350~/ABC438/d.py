n = int(input())
a = list(map(int, input().split()))
b = list(map(int, input().split()))
c = list(map(int, input().split()))
a_sum, c_sum = [0]*n, [0]*n
for i in range(n):
    a_sum[i] = a_sum[i-1] + a[i]

ans = a_sum[n-3] + b[n-2] + c[n-1]
print("初期値",ans)
body_to_tail = 0
extra = [0]*n

for i in range(n-1,-1,-1):
    if i == n-1:
        c_sum[i] = c[i]
    else:
        c_sum[i] = c_sum[i+1] + c[i]
        extra[i] = extra[i+1] + b[i] - c[i]

print("c_sum:",c_sum)
print("extra:",extra)
for i in range(n-1,-1,-1):
    print("i:",i)
    if n-3 <= i :
        continue
    elif i == n-4:
        # ans = max(ans,a_sum[i] + max(body_to_tail[i+1],body_to_tail[i+2])+c_sum[i+1])
        body_to_tail = max(body_to_tail,extra[i+1],extra[i+2])
        ans = max(ans,a_sum[i]+body_to_tail+c_sum[i+1])
    else:
        # ans = max(ans,ans+body_to_tail[i+1])
        body_to_tail = max(body_to_tail,extra[i+1])
        ans = max(ans,a_sum[i]+extra[i+1]+c_sum[i+1])
    print("body",body_to_tail,"extra:",extra,"ans:",ans,"a_sum:",a_sum[i])
print(ans)

        
        









# a_sum,b_sum,c_sum = [0]*n, [0]*n, [0]*n
# a_sum[0],b_sum[0],c_sum[0] = a[0], b[0], c[0]
# mid_tail = [0]*n
# # 累積和
# for i in range(1,n):
#     a_sum[i] = a_sum[i-1] + a[i]
#     b_sum[i] = b_sum[i-1] + b[i]
#     c_sum[i] = c_sum[i-1] + c[i]
# # print(a_sum,b_sum,c_sum)
# # y＋zの累積和
# for i in range(1,n-1):
#     # print(i)
#     mid_tail[i] = b_sum[i] + c_sum[-1] - c_sum [i]
#     print(mid_tail)
