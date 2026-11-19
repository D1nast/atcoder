# https://atcoder.jp/contests/abc455/tasks/abc455_d
# 片方向リストの問題
# cards：どのカードを上に載せているかを示す
# value_cards：どのカードの上にいるか示す
# 各クエリ：cをqの上に載せる


from collections import defaultdict

n,q = list(map(int,input().split()))
cards = defaultdict(int)
value_cards = defaultdict(int)
ans = []

for i in range(n): cards[i+1] = 0
for i in range(q):
    c,q = list(map(int,input().split()))

    # 外す
    if c in value_cards:
        cards[value_cards[c]] = 0
        del value_cards[c]

    # 付け替える
    ## カードqは、カードcを上に載せている
    cards[q] = c
    ## カードcは、カードqの上に載っている
    value_cards[c] = q

for i in range(n):
    # どこかのカードの上に載っているなら、カードiが最初乗っていた山は0になる
    if i+1 in value_cards:
        ans.append(0)
    else:
        # キーがゼロになるまで続ける
        tmp = 0
        check = True
        call = i+1
        while check:
            if cards[call]!=0:
                call = cards[call]
            else:
                check = False
            tmp += 1
        ans.append(tmp)

print(" ".join(map(str,ans)))


# 各山の、最大のカード数を求める