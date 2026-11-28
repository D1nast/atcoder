n = int(input())
l = list(map(int,input().split()))

ans = 0
for i in range(2**n):
    pos = 0.5
    tmp = 0
    for j in range(n):
        # 1が正の方向、0が負けの方向
        if (i>>j)&1:
            # 現在地が負　かつ　移動後が正
            if pos < 0 and pos+l[j]>0:
                tmp += 1
                ans = max(tmp,ans)
            pos += l[j]
        else:
            # 現在地が正　かつ　移動後が負
            if pos > 0 and pos-l[j] < 0:
                tmp += 1
                ans = max(tmp,ans)
            pos -= l[j]

print(ans)