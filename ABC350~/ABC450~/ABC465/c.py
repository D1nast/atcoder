n = int(input())
s = input()
a, b = [], []
rev = False
for i in range(n):
    if rev:
        a.append(i + 1)
    else:
        b.append(i + 1)
    if s[i] == "o":
        rev ^= True
ans = a[::-1] + b
if rev:
    ans = ans[::-1]
print(*ans)


# 足す→反転の繰り返し　oなら次足す位置を反転
# 最後に両方を足して必要なら反転

a 2,4
b 1,3

4,2,1,3


1,2,3,4
2,1,3,4
3,1,2,4
4,2,1,3
足す、反転する、