stack = []
left = 0
right = 0
stack = [0]

for i in range(int(input())):
    query = input().split() 
    # １pushの処理
    if int(query[0]) == 1:
        new_value = stack[-1] + (1 if query[1] == "(" else -1 )
        if new_value < 0 :
            new_value = -10**9
            stack.append(new_value)
        else:
            stack.append(new_value)
    # ２popの処理 
    else:
        stack.pop()
    
    print("Yes" if stack[-1]==0 else "No")
    # print(stack)

    # ある一定のラインからデータが壊れる