import bisect

n,q = list(map(int,input().split()))
a = list(map(int,input().split()))

# ブロックの累積和
b_sum = []
b_ind = []
# ブロック内の累積和
b_in_sum = []
counter = a[0]
memo = 1
for i in range(n):
    if i == 0:
        b_sum.append(a[i])
        b_ind.append(a[i])
        b_in_sum.append([a[i]])
    else:
        b_sum.append(b_sum[-1]+ counter + a[i])
        b_ind.append(memo+1)
        counter += a[i]

        b_in_sum.append(b_in_sum[-1]+[a[i]])
        b_in_sum[-1][-1] = b_in_sum[-1][-1]+b_in_sum[-1][-2]
        memo += len(b_in_sum[-1])

for i in range(q):
    l,r = list(map(int,input().split()))
    r_pos = bisect.bisect_right(b_ind,r)-1
    l_pos = bisect.bisect_right(b_ind,l)-1
    # ブロックの累積和のうち、取る範囲を取得
    if l_pos==0:
        sum = b_sum[r_pos-1]
    else:
        sum = b_sum[r_pos-1] - b_sum[l_pos-1]

    # 右端ブロックのうち、R以内の値を足す
    sum += b_in_sum[r_pos][r-b_ind[r_pos]]
    # 左端ブロックから、範囲外を差し引く
    sum -= b_in_sum[l_pos][-1] - b_in_sum[l_pos][l-b_ind[l_pos]]
    print(sum)

print("b_sum",b_sum,"b_ind",b_ind,"b_in_sum",b_in_sum)

# 2つを求めて、累積和を求める
# ブロックの累積和
# ブロック内の累積和

# Rからブロックの位置を求め、ブロック内のうち、Rのポジションを測る
# Lからブロックの位置を求め、ブロック内のうち、Lのポジションを測る
# RからLを差し引く累積和問題

# それぞれの累積和は、{ブロックの最初の数字:累積和の値}
# ブロック内の累積和はL(orR)i - ブロックの累積和のキーで求められる

# 答えは以下で求まる
# ブロックの累積和 - 両端のブロック内の累積和
