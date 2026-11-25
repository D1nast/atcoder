n,q = list(map(int,input().split()))
query = []
pointer = -1
tracking = -1
server = [""]

for i in range(q):
    get = list(map(str,input().split()))
    if get[0] == "3":
        pointer = i
        tracking = get[1]
    query.append(get)

for i in reversed(range(pointer)):
    if query[i][0] == "1":
        if query[i][1] == tracking:
            tracking = "-1"
    elif query[i][0] == "2":
        if tracking == query[i][1]:
            server.append(query[i][2][::-1])
    else:
        if tracking == "-1":
            tracking = query[i][1]

# クエリ１が来た場合は、次の３を探す
# クエリ2の場合は、追跡中のサーバーなら確認
# クエリ３が来たら、追跡中のサーバーを変更する
print("".join(server)[::-1])

# 追跡先が変わるのは、
# 追跡中でないクエリ１が来ても、変わらない