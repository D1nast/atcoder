from sortedcontainers import SortedSet, SortedList, SortedDict
x = int(input())
q = int(input())
arr = SortedList([x])
ans = []
for _ in range(q):
    get = list(map(int,input().split()))
    arr.add(get[0])
    arr.add(get[1])
    ans.append(arr[len(arr)//2])

print("\n".join(map(str,ans)))