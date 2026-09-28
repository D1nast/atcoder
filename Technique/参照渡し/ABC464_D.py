# https://atcoder.jp/contests/abc464/tasks/abc464_d
# 晴れ -> 晴れ, 雨 -> 晴れ
# 晴れ -> 雨, 雨 -> 雨
# 各日iにおいて、それぞれのパターンを動的計画法で解く

# whether = [[0,0] for _ in range(n)]
# これは配列渡しにならず（同じメモリを参照しない）、n回配列が作られている
# [[0, 0]] * n
# これは1個の配列への参照をn個並べる 

t = int(input())

for i in range(t):
    n = int(input())
    s = input()
    x = list(map(int,input().split()))
    y = list(map(int,input().split()))
    ans = 0
    # Sが[i][0] , Rが[i][1]
    
    whether = [[0,0] for _ in range(n)]
    for j in range(n):
        if s[j] == "S":
            whether[j][0] = 0
            whether[j][1] -= x[j]
        else:
            whether[j][0] -= x[j]
            whether[j][1] = 0

    for j in range(1,n):
        # 晴れから晴れ、雨から晴れ        
        whether[j][0] = max(
            whether[j-1][0] + whether[j][0],
            whether[j-1][1] + whether[j][0] + y[j-1],
        )
        # 晴れから雨、雨から雨
        whether[j][1] = max(
            whether[j-1][0] + whether[j][1],
            whether[j-1][1] + whether[j][1],
        )
    print(max(whether[-1][0],whether[-1][1]))
    