import bisect

n,k = map(int,input().split())
b=[]
check =[]
area = []

for i in range(n):
    get=list(map(int,input().split()))
    check.append(get[0])
    b.append(get[1:])

c = list(map(int,input().split()))

for i in range(n):
    if i==0:
        area.append(check[i]*c[i])
    else:
        area.append(area[-1]+check[i]*c[i])

pos = bisect.bisect(area,k-1)

if pos==0:
    print(b[pos][k%check[0]-1])
else:
    print(b[pos][abs(area[pos-1]-k)%check[pos]-1])


# 区間で並べてkの値で二分探索
    # 使う配列のインデックスを取得したら、そこから何番目かを把握する
        # インデックスが0ならそのまま
        # インデックスが1以上なら左隣の値-二分探索で見つけた値の絶対値
        # k%要素数
# (k - 二分探索の値).abs

# 二分探索の中身の処理がわからない
# 値が右端以上の時は最後のインデックス＋１になる
# 値が境界とイコールの時は境界のインデックス＋１


# (左隣の値-二分探索で見つけた値の絶対値)%列の要素数-1