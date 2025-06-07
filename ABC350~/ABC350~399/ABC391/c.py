n,q = map(int,input().split())
ans = 0
nest = [1]* (n+1)
pigeon = {}
for i in range(n):
    i+=1
    pigeon[i] = i

for i in range(q):
    query = list(map(int,input().split()))
    if query[0] == 2 :
        print(ans)
    else :
        bef_1 = nest[pigeon[query[1]]]
        bef_2 = nest[query[2]]
        # 鳩の巣移動
        nest[pigeon[query[1]]] -= 1
        if bef_1 >= 2 and nest[pigeon[query[1]]]<= 1 :
            ans -= 1
        # print(nest)
        pigeon[query[1]] = query[2]
        nest[query[2]] += 1
        if bef_2 <= 1 and nest[query[2]] >= 2:
            ans += 1
        # print(nest)