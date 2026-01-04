n = int(input())
a = list(map(int,input().split()))
i = [0]*n
j = [0]*n
k = [0]*n

for idx in range(0,n):
    if a[idx] % 7 == 0:
        i[idx] += 1
    if a[idx] % 5 == 0:
        j[idx] += 1
    if a[idx] % 3 == 0: 
        k[idx] += 1

print("i",i,"j",j,"k",k)