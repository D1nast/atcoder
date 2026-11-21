n = int(input())
s = input()
sector = [ [] for _ in range(3)]
set = [set(),set(),set()]
p = 0

for i in range(n):
    set[p].add(s[i])
    sector[p].append(s[i])
    if len(set[p])==3 and p < 2:
        p +=1

if len(set[2]) < 3:
    print(0)
    exit()

count = [ {"A":0,"B":0,"C":0} for _ in range(3)]
ans = 1

for i in range(3):
    for c in sector[i]:
        count[i][c] += 1

can_left = 0
while count[1]["A"] >= 1 and count[1]["B"] >= 1 and count[1]["C"] >= 1:
    del_c = sector[1][can_left]
    if count[1][del_c] >= 2:
        count[1][del_c] -=1
        can_left +=1
    else:
        break

ans += can_left
        
for i in range(len(sector[2])):
    # 右端から移動させる文字
    plus = sector[2][i]

    # 右端を移動させることで条件を満たさなくなったら終了
    if count[2][plus] == 1:
        break
    count[2][plus] -= 1
    
    # 右端を中間に足す
    sector[1].append(plus)
    count[1][plus]+=1

    # 右端を中間に移動させたことによって、中間を左端に寄せることができるようになるなら、ズラす
    # これを消せなくなるまでいく

    # 継続する
    while count[1]["A"] >=1 and count[1]["B"] >=1 and count[1]["C"]>=1:
        del_c = sector[1][can_left]
        if count[1][del_c] >= 2:
            count[1][del_c] -=1
            can_left += 1
        else:
            break
    ans += 1+can_left


print(ans)
# print(sector,set,count)


# 一番右端を中間に移す
# 移したら、中間をどこまで右に寄せられるか確認する

# 移した数+1と、さらに左端に移せる数の掛け算