# https://atcoder.jp/contests/abc478/tasks/abc478_d

# 辞書でデータを管理
# LiでXiを追加
# Ri+1でXiを削除
# Li~Riを時刻の幅として捉える

n,q = list(map(int,input().split()))
dict = {}
add_time = [ [] for _ in range(n) ]
del_time = [ [] for _ in range(n) ]
ans = []
for i in range(q):
    query = list(map(int,input().split()))
    add_time[query[0]-1].append(query[2])
    if query[1] < n:
        del_time[query[1]].append(query[2])

for i in range(n):
    if add_time[i]:
        for add in add_time[i]:
            dict.setdefault(add,0)
            dict[add]+=1
    if del_time[i]:
        for dele in del_time[i]:
            dict[dele] -= 1
            if dict[dele] == 0:
                del dict[dele]
    ans.append(len(dict))

print(" ".join(map(str,ans)))
