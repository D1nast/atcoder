n,q = map(int, input().split())
a = list(map(int, input().split()))

boxes = [0] *  (n+2)
ans = 0


for i in range(len(a)):
    index = a[i]
    new_value = 1 if boxes[index] == 0 else 0
    boxes[index] = new_value
# 黒の処理
    if boxes[index] == 1:
        if boxes[index-1] == 0 and boxes[index+1] == 0:
            ans += 1
        elif boxes[index-1] == 1 and boxes[index+1] == 1:
            ans -= 1
# 白の処理
    if boxes[index] == 0:
        if boxes[index-1] == 1 and boxes[index+1] == 1:
            ans += 1
        elif boxes[index-1] == 0 and boxes[index+1] == 0:
            ans -= 1

    print(ans)