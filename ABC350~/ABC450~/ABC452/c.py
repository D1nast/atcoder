n = int(input())
borne = [list(map(int,input().split())) for _ in range(n)]
j = int(input())
st = [input() for _ in range(j)]
nSet = [set() for _ in range(n)]

# n=肋骨の数
# Bi = borne[i][1]-1
# 文字列×肋骨
for s in st:
    for i in range(n):
        if len(s)==borne[i][0]:
            nSet[i].add(s[borne[i][1]-1])

for s in st:
    ok = False
    if len(s)==n:
        for i in range(n):
            if s[i] not in nSet[i]:
                ok =False
                break
            if i == n-1:
                ok = True
    print("Yes") if ok else print("No")
# 各肋骨に入り得る

# 各肋骨にM通り試して、入る可能性のある文字を探索する
    # 肋骨に入る可能性のある文字はsetで管理
# 完了後、Mのクエリに回答する

# 実装条件
# Siの文字列の長さ=borne[i]でない場合はスキップ