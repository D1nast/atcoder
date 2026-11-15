q = int(input())
s = input()
t = input()
query = [] 
ans = [ 0 for _ in range(len(s))]
for i in range(q): query.append(list(map(int,input().split())))
r = len(t)

for l in range(len(s)-len(t)+1):
    # print("l",l,"s[l:r]",s[l:l+r])
    if s[l:l+r] == t:
        ans[l]=1
for i in range(1,len(s)): ans[i] = ans[i] + ans[i-1]


for l, r in query:
    l -= 1
    r -= 1
    hi = r - len(t) + 1                 # T が始められる一番右の位置
    left = ans[l - 1] if l > 0 else 0   # l より前の個数
    print("Yes" if hi >= l and ans[hi] - left >= 1 else "No")

# for l,r in query:
#     l-=1
#     r-=1
#     print("Yes" if ans[r-len(t)] - ans[l-1] >= 1 else "No")

# print(ans)

