from itertools import groupby

for i in range(int(input())):
    n = int(input())
    s = input()
    # 0と1の連続回数の最大値
    max_c = [0,0]
    # 0と1の出現回数
    length_c = [0,0]

    for c,g in groupby(s):
        length = len(list(g))
        max_c[int(c)] = max(max_c[int(c)],length)
        length_c[int(c)] += length

    ans = min( 
        (length_c[0] - max_c[0])*2 + length_c[1],
        (length_c[1] - max_c[1])*2 + length_c[0]
     )
    print(ans)  