# 1〜Nまでの和
# 1~Nまでのaの倍数を削除
# 1~Nまでのbの倍数を削除
# 最小公倍数を求めて重複分を足す
import math

n,a,b = list(map(int,input().split()))
sum = n*(n+1)//2
a_s = n//a
b_s = n//b
dup = math.lcm(a,b)
dup_s = n//dup
a_sum = a_s*(a*2 + (a_s-1)*a)//2
b_sum = b_s*(b*2 + (b_s-1)*b)//2
dup_s = dup_s*(dup*2 + (dup_s-1)*dup)//2

print(sum-a_sum-b_sum+dup_s)
# Nまでの話
# 1/2 x Nx(N+1)


# 等差数列の和の公式を使う
# n = 項数
# a1 = 初項
# d = 交差
# 公式：(n{2a1 + (n-1)d}) //2
# 公式：項数*(2*初稿 + (項数-1)*交差)//2

# math.lcm(a,b)
# aとbの最小公倍数