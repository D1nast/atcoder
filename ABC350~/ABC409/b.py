a = int(input())
t = list(map(int, input().split()))
ans = 0
hash = {}

for i in t:
    hash[i] = hash.get(i, 0) + 1

print(hash)
for i in hash:
    if hash[i] >= i:
        ans = max(hash[i],ans)

print(ans)