n,q = map(int,input().split())
arr = [1]*n
left = 0
ans =[]
for i in range(1,n):
    arr[i] = arr[i-1]+1
    
for i in range(q):

    query = list(map(int,input().split()))

    if query[0] == 1:
        query[1] = (left + query[1]-1) % n
        arr[query[1]] = query[2]
        # print(arr)
    elif query[0] == 2:
        query[1] = (left + query[1]-1)%n
        ans.append(arr[query[1]])
    else:
        tmp = query[1] % n
        left = (left+tmp)%n

# k mod n
for i in ans:
    print(i)