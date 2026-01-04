from itertools import groupby
# digits = list(map(int, input().strip()))
digits = groupby(input())
rle = []
ans = 0

for i,j in digits:
    rle.append([int(i),list(j)])

check = rle[0][0]
# print("rle",rle[0][0])
for i in range(1,len(rle)):
    if check+1 == rle[i][0]:
        ans += min(len(rle[i-1][1]),len(rle[i][1]))
    check = rle[i][0]
# print(rle)
print(ans)
