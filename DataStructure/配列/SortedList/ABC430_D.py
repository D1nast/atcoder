# https://atcoder.jp/contests/abc430/submissions/me

# 計算量は NlogN^2で、10^8乗
# Pythonだとギリギリの計算量になる
# 配列の添字アクセスを無くす
# 答えを都度標準出力しない（後でまとめて出す
# ソートは複数要素にしない方が軽い

from sortedcontainers import SortedSet, SortedList, SortedDict
from collections import defaultdict

n = int(input())
x = list(map(int,input().split()))
p = SortedList([0,10**10+1,10**10+1])
dist = 0
dict = defaultdict(int)

ans = []
for i in range(n):

    p.add(x[i])
    idx = p.bisect_left(x[i])

    fprev = p[idx-2]
    prev = p[idx-1]
    pos = p[idx]
    back = p[idx+1]
    fback = p[idx+2]

    dist -= dict[prev]
    if back < 10**10+1:
        dist -= dict[back]

    # 前
    dict[prev] = min( abs(prev - fprev), abs(pos-prev))
    # 後
    dict[back] = min( abs(fback-back), abs(back-pos))
    # 新しく追加された人
    dict[pos] = min( abs(pos-prev), abs(back-pos))

    dist += dict[prev]+dict[back]+dict[pos]

    ans.append(dist)

print("\n".join(map(str,ans)))

