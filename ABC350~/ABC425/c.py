n,q = map(int, input().split())
a = [0]+list(map(int, input().split()))*2
a_sum = a.copy()
left = 1

for i in range(1,len(a_sum)):
    a_sum[i] = a_sum[i-1] + a[i]

for i in range(q):
    query = list(map(int, input().split()))
    if query[0] == 1:
        left = left + query[1]
        if left > n:
            if left % n == 0:
                left = n
            else:
                left = left%n
        # print("i:",i,"n:",n,"left",left)
    else:
        query[1] -= 1
        query[2] -= 1
        right = left + query[2]
        # print(a_sum)
        print(a_sum[right] - a_sum[left+query[1]-1])
        # print("a_sum[right]",a_sum[right],"a_sum[left+query[1]-1]",a_sum[left+query[1]-1])
        # print("left",left,left+query[1]-1)

