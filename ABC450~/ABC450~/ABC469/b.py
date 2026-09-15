n = int(input())
s = input()
ans =0 

if n == 1:
    if s[0]=="x":
        print(1)
    else:
        print(0)
    exit()

if n==2:
    for i in range(2):
        if s[i]== "o":
            print(0)
        exit()
    print(2)
    exit()


for i in range(n):
    if i==0 or i==n-1:
        if i==0 and s[i] == s[i+1]=="x":
            ans += 1
        elif i == n-1 and s[i]==s[i-1]=="x":
            ans += 1
    else:
        if s[i] == s[i+1] == s[i-1] == "x":
            ans += 1

print(ans)
