# iを選んでそこからK個は昇順にする事ができる

n,k = list(map(int,input().split()))
a = list(map(int,input().split()))
sorted_a = sorted(a)

diff=0
l = -1
r = -1
for i in range(n):
    if a[i] != sorted_a[i]:
        if l == -1:
            l = i
        r = i

print("Yes" if l==-1 or r-l+1 <= k else "No")

print(a,sorted_a)