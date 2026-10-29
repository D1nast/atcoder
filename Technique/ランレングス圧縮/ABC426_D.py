# https://atcoder.jp/contests/abc426/tasks/abc426_d
# 0と1の最大連続数と、0と1の出現回数を控えて回答する問題

from itertools import groupby

for i in range(int(input())):
    n = int(input())
    s = input()
    # 0と1の連続回数の最大値
    max_c = [0,0]
    # 0と1の出現回数
    length_c = [0,0]

    # キーと連続する値に分かれる（"0","0000"）
    for c,g in groupby(s):
        # イテレータは一度使用すると使えないので、変数に格納しておく
        length = len(list(g))
        max_c[int(c)] = max(max_c[int(c)],length)
        length_c[int(c)] += length

    ans = min( 
        (length_c[0] - max_c[0])*2 + length_c[1],
        (length_c[1] - max_c[1])*2 + length_c[0]
     )
    print(ans)  