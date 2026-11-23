# https://atcoder.jp/contests/abc433/tasks/abc433_d
# 合同式(mod)の問題
# Ai*10k+Aj≡0 (mod m)

# https://naop.jp/2021/05/29/hunoamari/
# 負の数の余りは上記リンク参考
# -34 mod 5なら、-34//7 + 1s
# modは足りない数と捉えられる（35を7で割ったら、1足りない）

# Pythonのmodは、割る数と同じ符号

n,m = list(map(int,input().split()))
a = list(map(int,input().split()))
dict = [{} for _ in range(12)]
ans = 0

for i in range(n):
    formula = a[i]%m
    dict[len(str(a[i]))].setdefault(formula,0)
    dict[len(str(a[i]))][formula] += 1

for i in range(n):
    for k in range(1,11):
        formula = -(a[i]*10**k)%m
        dict[k].setdefault(formula,0)
        ans += dict[k][formula]

print(ans)
