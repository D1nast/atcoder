# HiWi x HW
# O(N^2)　全探索
h,w,k = list(map(int,input().split()))
grid = []
sum_grid = [[0]*(w+1)]*(h+1)
for i in range(h):
    s = input()
    grid.append(s)

print(sum_grid)
for i in range(h):
    for j in range(w):
        if i > 0 and j >0:
             d