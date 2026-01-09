n,m = map(int,input().split())
s = list(input().strip())
t = list(input().strip())
count = [0] * (n+1)

for i in range(m):
    l,r = map(int,input().split())
    l-=1
    r-=1
    count[l] += 1
    count[r+1] -= 1

for i in range(1,n+1):
    count[i] = count[i-1] + count[i]

# print(count)

for i in range(n):
    if count[i] % 2 == 1:
        s[i] = t[i]

print("".join(s))


# いもす法で解けるが、累積和のところで苦戦