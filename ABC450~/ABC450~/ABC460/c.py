n,m = map(int,input().split())
a = list(map(int,input().split()))
b = list(map(int,input().split()))
a.sort()
b.sort()
index=0
ans =0
# Aがシャリ、Bがネタ
# ネタ＞＝2シャリ
# print(a,b)

for rice in a:
    if index > m-1:
        print(ans)
        exit()
    if b[index] <= rice*2:
        ans += 1
        index+=1
print(ans)    


