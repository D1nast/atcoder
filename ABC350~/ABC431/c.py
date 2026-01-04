import bisect ,sys
n,m,k = map(int,input().split())
head =  list(map(int,input().split()))
body = list(map(int,input().split()))
head.sort()
body.sort()
body_used = 0
robot = 0
# print("head",head,"body",body)

# for i in head:
for i in range(min(n,m)):
    # x以上の値の一番左側のindex
    b_search = bisect.bisect_left(body,head[i],body_used)
    # 最後のケースと範囲外のケース対処
    if b_search > m-1 or (b_search==m-1 and body[b_search] < head[i] ):
        # print("bsearch",b_search)
        print("No")
        sys.exit()
    # B>=H で完成
    if body[b_search] >= i:
        robot += 1
        body_used = b_search+1
        if robot == k:
            print("Yes")
            sys.exit()
    else:
        print("No")
        sys.exit()

    # print("b_search:",b_search)


# サタンを決めてbsearch