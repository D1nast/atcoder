# https://atcoder.jp/contests/abc466/tasks/abc466_c
# 各Lにつき、R-Lを求める
# Li,RiがNoだった場合は、Lを一つ右にズラす
# Yesだった場合は、右をズラす。右端に到達している場合はLを右にズラす

n = int(input())
point = [0]*(n+1)
l = 1
r = 2
ans = 0
while l < n:
    # 重なっていたらスキップ
    if l==r:
        r +=1
        continue

    # クエリを出力
    print("?",l,r)

    if input() == "Yes":
        # 右を広げられるなら広げる
        if r != n:
            r += 1
        # 右端に到達しているなら左を縮める
        else:
            point[l] = r-l
            l += 1
    else:
        # 左を縮める
        point[l] = r-1-l
        l += 1

for i in range(1,n+1):ans += point[i]

print("!",ans)
exit()