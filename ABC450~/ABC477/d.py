# https://atcoder.jp/contests/abc477/tasks/abc477_d
# 区間の問題
# 各マスで、タイルが置かれていなかった区間に発生した、最も最後のクエリ2を求める事が解法となる
# 計算量はN+Q(log(Q))

import bisect
n,q = list(map(int,input().split()))

q2_i = [0]
q2_c = ["a"]
q1 = [ [0]for _ in range(n+1) ]
ans = []
for i in range(q):
    d1,d2 = input().split()
    if d1 == "1":
        d2 = int(d2)
        q1[d2].append(i+1)
    else:
        q2_i.append(i+1)
        q2_c.append(d2)

for i in range(1,n+1):
    ans_tmp = q2_c[0]
    # 各マスでタイルのなかった区間に発生したクエリ2を確認する
    for j in range(0,len(q1[i]),2):
        l = q1[i][j]
        r = q+1 if j==len(q1[i])-1 else q1[i][j+1]-1
        b_search = bisect.bisect_right(q2_i,r)-1

        # タイルが置かれていなかった区間で、最も最後のクエリ2を求める
        if q2_i[b_search] >=l:
            ans_tmp = q2_c[b_search]

    ans.append(ans_tmp)

print("".join(ans))

# print("q2_i",q2_i,"q2_c",q2_c,"q1",q1)


# 2刻みで確認、それが最後のマスだったら、N+1の値で二分探索
# タイルの置かれていない区間の右端の値以下のクエリ２のインデックスを確認して、
# そのインデックスが区間の左端の値未満であれば、そこの区間にクエリ２は存在していないことになる
# 例：
## クエリ２：[1,2]
## 区間：[l=3, r=5]