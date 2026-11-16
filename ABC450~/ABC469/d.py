n,m = map(int,input().split())
ab = [list(map(int,input().split())) for i in range(m)]
abs = [frozenset(ele) for ele in ab]
ans=set()

for a in ab[0]:
    s = -1
    for i in range(1,m):
        if a not in abs[i]:
            if s == -1:
                s = abs[i]
            else:
                s &= abs[i]
    if s==-1:
        for b in range(1,n+1):
            if a!=b:
                ans.add(frozenset({a,b}))
    else:
        for b in s:
            ans.add(frozenset({a,b}))

print(len(ans))


# print(checkA,checkB)
# A1を要素に含まない行で、共通する要素がペアとなる（B1の場合も然り）
# A1の要素か、A2の要素が含まれていること
# 抜き出した要素の先頭を使って、先頭から末尾まで要素が含まれてればOK
# 配列をソートしてsetに突っ込む、要素数をans


