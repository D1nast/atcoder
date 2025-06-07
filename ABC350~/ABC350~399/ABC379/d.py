n,m = map(int,input().split())
x = list(map(int,input().split()))
a = list(map(int,input().split()))
xa = sorted(zip(x,a))
xa = list(map(list,xa))
init = n
need_stone = 0
ans = 0

for i in reversed(range(m)):
    need_stone = init - xa[i][0]
    # need_stone = init - x[i]
    # print("need_stone:",need_stone)
    if xa[i][1] - need_stone >=2:
        print(-1)
        exit()
    elif xa[i][1] - need_stone == 1:
        init = xa[i][0]-1
        # print("init case==1",init)
        # print("Σ",need_stone * (need_stone+1)//2)
        ans += need_stone * (need_stone+1)//2
    else:
        if i == 0 and xa[i][0]-need_stone>=0:
            print(-1)
            exit()
        init = xa[i][0] + abs(xa[i][1] - need_stone)
        # print("不足",init)
        ans += need_stone * (need_stone+1)//2
        ans -= abs((xa[i][1] - need_stone)) * abs((xa[i][1] - need_stone+1))//2

print(ans)

        


        