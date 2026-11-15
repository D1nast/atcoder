n,k,m = list(map(int,input().split()))
jwel = []
master_j = {}
get_j = set()
ans = 0

for i in range(n):
    get = list(map(int,input().split()))
    jwel.append([get[0],get[1],i])
    master_j.setdefault(get[0],[get[1],i])
    if master_j[get[0]][0] < get[1]: master_j[get[0]] = [get[1],i]

sorted_jwel = sorted(jwel,key=lambda x:-x[1])
sorted_mj = sorted(master_j.items(),key= lambda v:-v[1][0])

# M種類の宝石を取る
for i in range(m):
    ans += sorted_mj[i][1][0]
    get_j.add(sorted_mj[i][1][1])


# 残りの宝石を取る
count = 0
for i in range(n):
    if count == k-m:
        break
    if not sorted_jwel[i][2] in get_j:
        ans += sorted_jwel[i][1]
        count += 1

print(ans)