import sys

n,k,x = map(int,input().split())
a = list(map(int,input().split()))
a.sort(reverse=True)
ans = n-k
sake = 0


for i in range(n-k,n):
    # print(i)
    sake += a[i]
    ans += 1
    if sake >= x:
        print(ans)
        sys.exit()

print(-1)

# K個日本酒があって、Xml以上飲むカップの最小
# 最悪のケースでも日本酒をX以上飲むことのできるカップの個数
# 外しても行けるかどうか、外した場合到達できるかどうか
# ここらがアルゴリズムの判定として必要そう
#　a_sum[K] < Xの場合は日本酒を確実に飲めない
# 日本酒を飲める場合は最高のパターンと最悪のパターンの検証で解ける
# 最高のパターンは頭から飲んだコップに全て日本酒が入っている場合
# 最悪のパターンは全部外しちゃった場合
# ハズレのコップの数はn-k
# 答えはn-k回外した後何回コップを飲めば日本酒をX以上飲むことができるか
# コード解釈誤り、昇順でソートすると小さい順に飲むから、個数が最適化されない。
# 容量の大きいコップに水入れたら、後は容量の大きい順にコップを飲めば最低限の数で済む
# 以下コンテスト中に思いついたコード。昇順にしていたのが良くなかった


# import sys

# n,k,x = map(int,input().split())
# a = list(map(int,input().split()))
# a.sort()
# a_sum = []
# ans = n-k
# sake = 0

# for i in range(n):
#     if i == 0:
#         a_sum.append(a[i])
#     else:
#         a_sum.append(a_sum[-1]+a[i])

# if a_sum[k-1] < x:
#     print(-1)
#     sys.exit()

# for i in range(k):
#     sake += a[i]
#     ans += 1
#     if sake >= x:
#         print(ans)
#         sys.exit()
