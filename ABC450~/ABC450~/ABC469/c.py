# 袋のあたりの回数行動ができる
# 食べられるお菓子の個数


n = int(input())
s = input()
xSum = [0]*n
co = []
oSum = [0]*n

for i in range(n):
    if i == 0:
        if s[i]=="o":
            oSum[i]=1
        else:
            xSum[i]=1
            co.append(i)
    else:
        oSum[i] = oSum[i-1]
        xSum[i] = xSum[i-1]
        if s[i]=="o":
            oSum[i] = oSum[i-1]+1
        else:
            xSum[i] = xSum[i-1]+1
            co.append(i)

number = len(co)

for i in range(n):
    if oSum[i]+xSum[i] > number:
        print(n)
    else:
        print(co[oSum[i]+xSum[i]-1]+1)




# i地点でのxの累積和からi地点でのoの累積和を足した数時点での
# xの累積和が示す座標が答え

# oxoxoxxx

# oの累積和:1,1,2,2,3
# xの累積和:0,1,1,2,2
# xが発生する位置を示す座標
# [1,3]
# # 存在しなかったら、一番最後まで行ける

# # 3の場合
# # xの累積和1+oの累積和2=3はxが発生する位置を示す座標に存在しないので最後までいける

# 座標[oの累積和+xの累積和-1]+1