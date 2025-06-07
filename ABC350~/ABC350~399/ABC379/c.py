n,m = map(int,input().split())
x = list(map(int,input().split()))
a = list(map(int,input().split()))
ans = 0
xa = sorted(zip(x,a))
xa = list(map(list,xa))

if sum(a)!=n or xa[0][0]!=1:
    print(-1)
    exit()

for i in range(1,m):
    dist = xa[i][0] - xa[i-1][0] 
    need_stone = dist - 1
    pass_stone = max(xa[i-1][1] - need_stone - 1,0)
    xa[i][1] += pass_stone
    # 必要な石の数を下回るのであれば-1
    if xa[i-1][1] < need_stone + 1:
        print(-1)
        exit()
    ans += pass_stone*dist + ( need_stone * (need_stone+1) //2 )
    # print("pass_stone:",pass_stone,"need_stone:",need_stone,"ans:",ans,"dist:",dist)
    # if i == m-1:
    #     # print("last",(n-xa[-1][0])*(n-xa[-1][0]+1)//2)
    #     ans += (n-xa[-1][0])*(n-xa[-1][0]+1)//2
if xa[-1][0] < n:
    tail = n - xa[-1][0]
    ans += tail * (tail + 1) // 2


print(ans)
