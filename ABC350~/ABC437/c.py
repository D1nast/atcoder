t = int(input())
for i in range(t):
    n = int(input())
    sum_power = 0
    ans = 0
    arr = []
    for j in range(n):
        w,p = list(map(int,input().split()))
        sum_power += p
        arr.append(w+p)
        # arr.append([abs(p-w),[w,p]])
    arr.sort()

    for reindeer in arr:
        sum_power -= reindeer
        if sum_power >= 0:
            ans += 1
        else:
            break
    print(ans)


