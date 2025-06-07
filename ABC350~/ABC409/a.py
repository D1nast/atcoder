a = int(input())
t =input()
s=input()

for i in range(a):
    if t[i]=="o" and s[i] =="o":
        print("Yes")
        exit()

print("No")