# https://atcoder.jp/contests/abc382/tasks/abc382_d
# 再帰関数を用いた枝刈り全探索

import copy

def recursion(n,i,m,array,depth):
    depth += 1
    if len(array) == n:
        ans.append(array)
        return
    
    for j in range(i+10,m+1):
        # 枝刈り部分。これより大きい部分はreturnで処理されない
        if j+(n-depth)*10 > m:
            return
        next_arr = copy.deepcopy(array)
        if j <= m:
            next_arr.append(j)
            recursion(n,j,m,next_arr,depth)

n,m = list(map(int,input().split()))
ans = []

for i in range(1,11):
    recursion(n,i,m,[i],1)

ans.sort()
print(len(ans))
for i in ans:
    print(" ".join(map(str,i)))

# 1 11 21 31 41 51 61 71 81 91 101 111
# 1 19 29 39 49 59 69 79 89 99 109 119