h,w = map(int,input().split())
grid = [ []for _ in range(h)  ]
max = 0
for i in range(h):
    data = list(map(int,input().split()))
    for j in data:
        grid[i].append(j)   
        max = max^j

print(max)