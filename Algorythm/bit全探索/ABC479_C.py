# https://atcoder.jp/contests/abc479/tasks/abc479_c
# https://www.youtube.com/watch?v=umfbbrElhaM
# 2^20のbit演算。典型的な問題
# youtube解説がわかりやすい

n,w = list(map(int,input().split()))
bento=[]
ans = 0
for i in range(n):
    bento.append(list(map(int,input().split())))

for i in range(2**n):
    yummy = 0
    weight = 0
    for j in range(n):
        # 各桁が1かどうか確認している
        if (i>>j)&1:
            yummy += bento[j][0]
            weight += bento[j][1]
    if weight <= w:
        ans = max(ans,yummy)

print(ans)
