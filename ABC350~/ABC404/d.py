n, m = map(int, input().split())
c = map(int,input().split())
zoo = [[] for _ in range(n)]
animal = [[]for _ in range(m)]

for i in range(m):
    value =   list(map(int, input().split()))
    for j in value[1:]:
        # j -= 1
        zoo[j-1].append(i)
        animal[i].append(j-1)


print (animal)
print (zoo)



