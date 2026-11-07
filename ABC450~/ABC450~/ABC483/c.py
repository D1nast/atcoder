n,m = list(map(int,input().split()))
default_can = [0]*n
change_vote = [[] for _ in range(n)]

for i in range(m):
    a,b = list(map(int,input().split()))
    a -= 1
    b -= 1
    default_can[a]+=1
    change_vote[a].append(b)

c1 = (n,-1)
c2 = (n,-1)

# 第二候補者まで求める
# 若い番号が、常に先頭にくるようになっている
for i in range(n):
    if default_can[i] > c1[1]:
        c2 = c1
        c1 = [i,default_can[i]]
    elif default_can[i] > c2[1]:
        c2 = [i,default_can[i]]

ans = []

# 各候補者が、辞退した時の差分を求める
# ciとして管理する
for i in range(n):
    ci = (n,-1)
    change = change_vote[i]
    default_can[i]=0
    for j in change:
        default_can[j]+=1

    # 候補者の増減を見て、最新とどうかを確認する
    for j in range(len(change)+2):
        if j < len(change):
            x = change[j]
        elif j == len(change):
            x = c1[0]
        else:
            x = c2[0]

        if default_can[x] > ci[1]:
            ci = (x,default_can[x])
        elif ci[1] == default_can[x] and ci[0] > x:
             ci = (x, default_can[x])

    ans.append(ci[0]+1)
    default_can[i] += len(change)

    for j in change:
        default_can[j]-=1

print("\n".join(map(str,ans)))
