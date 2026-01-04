n = int(input())
a = list(map(int,input().split()))
ans = 1
next_domino = 1+a[0]

for i in range(1,n):

    if next_domino > i+1:
        ans += 1
        next_domino = max(next_domino,i+1+a[i]) 
    else:
        break

print(ans)


# ドミノを倒した時の余力内であれば、その隣のドミノを倒すことができる
# 余力は都度都度確認する
# 余力の確認、倒す、余力の更新のループ


