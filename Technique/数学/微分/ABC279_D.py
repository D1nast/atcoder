# https://atcoder.jp/contests/abc279/tasks/abc279_d
# 傾きが0周辺の値を求める
# Bn + A/√(1+x) = 0
# Bn + A/(1+x)^-(1/2) = 0
# B + -(A/2)(1+x)^-3/2(=3乗して√) = 0
# B = (A/2)(1+x)^-3/2
# 2B/A = (1+x)^-3/2
## 指数同士は掛け算できるので、両辺を-2/3乗して1+x
# (2B/A)^(-2/3) = 1+x
# x = (2B/A)^(-2/3) - 1

# 微分は指数を減らして、指数-1
# 

import math

A, B = map(int, input().split())

def f(x):
    return B * x + A / math.sqrt(1 + x)

t = (2 * B / A) ** (-2 / 3) - 1
x0 = max(0, int(t))

# 浮動小数点の誤差対策で、周辺も少し多めに見る
ans = min(f(x) for x in range(max(0, x0 - 1), x0 + 3))
# 小数点以下10桁まで表示
print(f"{ans:.10f}")

