# 4
# 11 9 3
# 0 0 2
# 842 180 7
# 1948706013487601 48019760148910476 89014537

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
# Xより小さいならX/K,　大きいならxk