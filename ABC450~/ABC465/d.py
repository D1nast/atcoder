# 木構造の問題
# 大きい方から割り続けていくと、答えに辿り着く。
# XYを割り続けて行った時の共通の商がなければ、ルート（0）に行き着く
t = int(input())
ans = []
for i in range(t):
    x,y,k = list(map(int,input().split()))
    cnt = 0
    while x != y:
        if x>y:
            x//=k
        else:
            y//=k
        cnt += 1
    ans.append(cnt)

print("\n".join(map(str,ans)))