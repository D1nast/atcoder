n,q = list(map(int,input().split()))
p = [0] + list(map(int,input().split()))
removed = {}
isRemoved = [0]*(n+1)
removeQuery = []
ans = []

for i in range(q):
    get = int(input())
    isRemoved[get]=1
    removeQuery.append(get)

# 取り除かれなかった数字
for i in range(1,n+1):
    if isRemoved[p[i]] == 0:
        ans.append(p[i])

# print("ans",ans,"isRemoved",isRemoved)

# 取り除かれた数字
removeStack=[]
for i in reversed(range(len(removeQuery))):
    if removeQuery[i] not in removed:
        removeStack.append(removeQuery[i])
        removed.setdefault(removeQuery[i],0)

for i in reversed(range(len(removeStack))):
    ans.append(removeStack[i])

print(" ".join(map(str,ans)))

# 除去された値は、
# 削除されなかった値はそのまま
# 