n,q = map(int,input().split())
arr = [1]*(n+1)
arr[0] = 0
r = 1

for i in(range(q)):
    x,y = map(int,input().split())
    count = 0
    while r <= x :
        count += arr[r]
        arr[y] += arr[r]
        arr[r] = 0
        r += 1 
        # print("count",count,"arr",arr)
    print(count)
    count = 0
