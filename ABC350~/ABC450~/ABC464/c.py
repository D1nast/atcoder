from collections import Counter
n,m = list(map(int,input().split()))
birds = [list(map(int,input().split())) for _ in range(n)]
color=Counter()
event=[[]for _ in range(m)]

for i in range(n):
    if birds[i][0] == birds[i][2] or birds[i][1]-1==0:
        color[birds[i][2]]+=1
    else:
        color[birds[i][0]]+=1
        event[birds[i][1]-1].append([i,birds[i][0],birds[i][2]])

for i in range(m):
    for changeTarget in event[i]:
        color[changeTarget[2]]+=1
        color[changeTarget[1]]-=1
        if color[changeTarget[1]] ==0:
            del color[changeTarget[1]]
    print(len(color))

# Di - 1で色が変わる
# Di=1の鳥、Ai=Biの鳥は変化なし

# Di日目に

# event=[i番目の鳥,Ai,Bi]