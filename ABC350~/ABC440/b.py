N = int(input())
T = list(map(int, input().split()))
Ti = []

for i in range(N):
    Ti.append([T[i],i])

Ti.sort()
print(Ti[0][1]+1,Ti[1][1]+1,Ti[2][1]+1)
