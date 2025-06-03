# 3進数で解く
from itertools import product
import math
n, m = map(int, input().split())
c = list(map(int,input().split()))
zoo = [[] for _ in range(n)]
ans = math.inf

for i in range(m):
    value =   list(map(int, input().split()))
    for j in value[1:]:
        zoo[j-1].append(i)
for pair in product([0,1,2],repeat=n):
    sum = 0
    animal = [ 0 for _ in range(m)]
    # print("組み合わせ",pair)
    for index , num in enumerate(pair):
        sum += c[index]*num
        for element in zoo[index]:
            animal[element] += num
    if all(ele >= 2 for ele in animal):
        ans = min([ans,sum])
    # print("料金",sum)
    # print("animal",animal)



print(ans)