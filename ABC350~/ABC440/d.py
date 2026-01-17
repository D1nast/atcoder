import bisect
def main():
    n, q = map(int, input().split())
    a = list(map(int, input().split()))
    a.sort()
    INF = 2001001001
    a.append(INF)

    for _ in range(q):
        x, y = map(int, input().split())

        ai = bisect.bisect_left(a, x)
        print("ai",ai)
        # x から最初の a[ai] までで足りる場合
        if y <= a[ai] - x:
            print(x + y - 1)
            continue

        # 左の区間の処理。x以上y未満の数字で何個使えるか
        y -= a[ai] - x
        x = a[ai] + 1
        print("x",x,"y",y,"a[ai]",a[ai])
        print("a[ai]-x",a[ai]-x)
        
        # 二分探索
        # y以上の区間で、使える数字が何個あるか確認していく
        wa = ai # 左端
        ac = n # 右端
        while wa + 1 < ac:
            wj = (wa + ac) // 2
            # 当該区間に使える数字の個数がY以上であれば、答えはその区間の中にある
            if (a[wj] - a[ai]) - (wj - ai) >= y:
                ac = wj
            else:
                wa = wj

        y -= (a[wa] - a[ai]) - (wa - ai)
        x = a[wa] + 1
        print(x + y - 1)


if __name__ == "__main__":
    main()


# 自力ではわからなかったが回答の仕方としてはこう
# 区間で区切って二分探索
# 

# Aをソートした配列で二分探索
# Y未満、Y以上でAの配列を区切ると答えを求めやすくなる
# 左端の個数はX - (X + Y-1)で求められる
# X ＝１００　Y＝１０なら、100 - 109で 9個
# 右端のインデックスと左端のインデックスの差がY未満の区間で使ってはいけない個数の数


# https://qiita.com/manuo/items/e0bdbc5974800b7bd382 
# bisectライブラリの考え方
# bisect_leftはx以上が最初に現れるインデックスを返す