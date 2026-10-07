# 配列の中から3つの要素を選ぶ組み合わせを作る
# combinations = list(itertools.combinations(w, 3))
import itertools

n,v = list(map(int,input().split()))
arr = list(map(int,input().split()))
w=[]
ans =0
for i in range(n):
    w.append([arr[i],i+1])

combinations = list(itertools.combinations(w, 3))
for c in combinations:
    if c[0][1]+c[1][1]+c[2][1] <= v:
        ans = max(ans,c[0][0]+c[1][0]+c[2][0])

print(ans)