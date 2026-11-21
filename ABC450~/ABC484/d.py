# i-1の要素数分、答えが加算される
# Aiと重複する要素数 - 1 答えに加算
# Aiをカウントに加算

from collections import defaultdict
n = int(input())
a = [0]+list(map(int,input().split()))
ans = 1
dup = defaultdict(int)
dup[a[1]]=1

for i in range(2,n+1):
    # 前項と値が同じ場合は、答えに加算されない
    if a[i] == a[i-1]:
        dup[a[i]]+=1
        continue
    if a[i] in dup:
        ans += i - dup[a[i]] - 1
    else:
        ans += i-1
    dup[a[i]]+=1
print(ans)
print(dup)

# 重複した値分、要素から差し引く
# 連続した値になっていたら答えに加算されない