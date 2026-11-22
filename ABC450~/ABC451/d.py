
import math

# 9桁で終わり
# 文字列を結合、10桁を超えるなら枝刈り、範囲内なら答えに追加・次の再帰を呼び出す

def recur(power,ans,s):
    for i in range(len(power)):
        sc = s
        sc += str(power[i])
        if len(sc) >= 10:
            return
        ans.add(int(sc))
        recur(power,ans,sc)
    
n = int(input())    
power = []
ans = set()
for i in range(math.ceil(math.log(10**9,2))): power.append(2**i)

for i in range(len(power)):
    ans.add(power[i])
    s = str(power[i])
    recur(power,ans,s)

# 文字列として数字を渡す、桁数を渡す
# print(power,sorted(ans))
print(sorted(ans)[n-1])
