n = int(input())
a = list(map(int,input().split()))
pos = 0
plus = []
minus = []
plus_pos = 0
minus_pos = 0
ans = 0
for i in sorted(a):
    if i >= 0:
        plus.append(i)
    else:
        minus.append(i)
sorted_minus = sorted(minus,reverse=True)

for i in range(n):
    if plus_pos == len(plus):
        ans += abs(pos - sorted_minus[minus_pos])
        pos = sorted_minus[minus_pos]
        minus_pos += 1
    elif minus_pos == len(minus):
        ans += abs(pos - plus[plus_pos])
        pos = plus[plus_pos]
        plus_pos += 1
    else:
        if abs(pos - plus[plus_pos]) == abs(pos - sorted_minus[minus_pos]):
            ans += abs(pos - sorted_minus[minus_pos])
            pos = sorted_minus[minus_pos]
            minus_pos += 1 
        elif abs(pos - plus[plus_pos]) > abs(pos - sorted_minus[minus_pos]):
            ans += abs(pos - sorted_minus[minus_pos])
            pos = sorted_minus[minus_pos]
            minus_pos += 1 
        else:
            ans += abs(pos - plus[plus_pos])
            pos = plus[plus_pos]
            plus_pos += 1
    # print("pos",pos,plus,sorted_minus)    
print(ans)

# プラスとマイナスの座標を見比べて、差が少ない方に移動する
# = < > ３パターン必要
# インデックスの対象外になった時の処理

# 正から正：abs(pos - plus[i])
# 正から負：abs(pos - minus[i])
# 負から正：abs(pos - plus[i])
# 負から負：abs(pos - minus[i])
# 絶対値の少ない方に移動する