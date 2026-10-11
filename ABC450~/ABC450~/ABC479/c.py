n,w = list(map(int,input().split()))
bento=[]
ans = 0
for i in range(n):
    bento.append(list(map(int,input().split())))

for i in range(2**n):
    yummy = 0
    weight = 0
    for j in range(n):
        if (i>>j)&1:
            yummy += bento[j][0]
            weight += bento[j][1]
    if weight <= w:
        ans = max(ans,yummy)

print(ans)
