# ブロックの累積和と、ブロック内の累積和を用意する
# Rは、Rが位置するブロックの直前のブロックの累積和+ブロック内の累積和で求める
# Lは、L-1が位置するブロックの直前の累積和+ブロック内の累積和を求めて差し引く


import bisect

n,q = list(map(int,input().split()))
a = [0] + list(map(int,input().split()))
a_sum = [0]*(n+1)
sum_ind = [0]
block = [0]
tmp = 0

# 必要なデータ構造の作成
for i in range(1,n+1):
    # ブロック累積和の境界のインデックスを示す
    sum_ind.append(sum_ind[-1]+i)

    # ブロック内の要素数を示す
    block.append(block[-1]+a[i])

    # ブロック累積和の作成
    ## 前項までの要素の総和+その項+前項の累積和
    a_sum[i]= tmp+a[i]+a_sum[i-1]
    tmp = tmp+a[i]

# クエリ処理
for _ in range(q):
    ans = 0
    query = list(map(int,input().split()))
    l = bisect.bisect_right(sum_ind,query[0]-1)-1
    r = bisect.bisect_right(sum_ind,query[1])-1

    # Rの処理（ブロック累積和＋ブロック内累積和）
    ans += a_sum[r]+block[query[1]-sum_ind[r]]
    # print("query",query,"ans:",ans)
    # Lの処理
    ans -= a_sum[l] + block[query[0]-1 - sum_ind[l]]

    print(ans)

print("a_sum",a_sum,"a",a,"sum_ind",sum_ind,"block",block)