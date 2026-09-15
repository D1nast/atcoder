# P<S<Q
# 全パターン並び替える
# 頭から順に検討する
# 10^6
from itertools import permutations

n = int(input())
p = list(map(int,input().split()))
q = list(map(int,input().split()))
ans = 0

# 一度OKが出たらその数列を判定しない
# それまでは判定を行う
# クリア条件を満たしたら答えを＋１して終わり
# 条件を満たさないことがわかったらその数列の判定は終了

for s in permutations(list(range(1,n+1))):
    big ,small = 0,0
    for i in range(n):
        if big == 0:
            if p[i]<s[i]:
                big =1
            elif p[i]>s[i]:
                break
        if small == 0:
            if s[i]<q[i]:
                small = 1
            elif s[i]>q[i]:
                break
        if big == small ==1:
            ans += 1
            break
print(ans)

# P<S<Q
# 
# 条件に該当しなかった場合継続するかどうか？
    # 継続できる場合
        # P<=S<=Q
    # 継続できない場合
        # P>S
        # S>Q
        # P>Q
# 各桁を比較してP<S<Qの時点でOKとする

# S = 1,2,1

# 各桁チェック　→ 継続判定　→ big,small

# 以下の例で条件をクリアしてるのに、各桁判定で弾かれる

# 7
# 3 6 5 2 7 1 4
# 4 1 5 7 2 3 6

# P < Sの判定
# S <Qの判定分ける
    
# P Qの数列を見てsmallかbig
# 照明が終わっているのに各桁判定している