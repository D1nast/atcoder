import bisect

n = int(input())
a = list(map(int,input().split()))+[0]
rle = [0]
rle_ind = [0]

count = 1
for i in range(0,n):
    if a[i] != a[i+1]:
        rle.append(count)
        rle_ind.append(rle_ind[-1]+count)
        count = 1
    else:
        count += 1

a.pop()
a.insert(0,0)
ans = []
for i in range(1,n+1):
    search = bisect.bisect_left(rle_ind,i)
    left = rle_ind[search-1]
    right = rle_ind[search]+1
    # 左端の場合：そのマスのインデックス＋１-1が答え
    if search == 1:
        ans.append(right-i)
    elif search+1==len(rle_ind):
        ans.append(i-left)
    else:
        ans.append( min( i-left, right-i  ) )



print(" ".join(map(str,ans)))