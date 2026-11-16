n,m = list(map(int,input().split()))
row = {}
columns = {}


for i in range(m):
    data = list(map(int,input().split()))
    if data[0] in row :
        # 行の値に対応する列の要素を削除してから、行の要素を削除する
        del columns[row[data[0]]]
        del row[data[0]]

    if data[1] in columns:
        # 列の値に対応する行の要素を削除してから、列の要素を削除する
        del row[columns[data[1]]]
        del columns[data[1]]

    row.setdefault(data[0],data[1])
    columns.setdefault(data[1],data[0])

    # print("data",data,"row",row,"columns",columns)

print(len(row))

# 行が削除される時、キーの値が列のキーと対応していれば、列も削除する
# 片方のキーにのみ対応するクエリが出てきた時にも対応できるようにしている