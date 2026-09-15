n,k,m = list(map(int,input().split()))
j = [list(map(int,input().split())) for _ in range(n)]
j = [[y, x, 0] for x, y in j]
j.sort(reverse=True)
ans = 0
manageJ = set()
checkM = m
count =0 

for i in range(k-m):
    ans += j[i][0]
    manageJ.add(j[i][1])
    j[i][2] = 1
    count += 1

checkM -= len(manageJ)

for i in range(n):
    if checkM != 0:
        if j[i][2] == 0 and j[i][1] not in manageJ:
            ans += j[i][0]
            manageJ.add(j[i][1])
            j[i][2] = 1
            checkM -= 1
            count += 1
    else:
        break

for i in range(n):
    if count == k:
        break
    else:
        if j[i][2] == 0:
            ans += j[i][0]
            count +=1

print(ans)



# Mの条件を満たすまで、効用の高い石を取り続ける

# 満たした後は公用の高い順にKを満たすまで取り続ける

# 石を効用の順に並べ替える
# 石の種類を管理するセットを作る
# 取った石のインデックスを控える
# もう一度頭から走査する

# 高い順に取り続ける

# 管理対象
# 効用
# 取っていない種類
# setで取ってきた石の種類

