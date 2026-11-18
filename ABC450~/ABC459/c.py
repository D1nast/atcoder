n,q = list(map(int,input().split()))

# 各マスが、どの行までブロックが積まれているか確認する
layer = {}
# ポインタ-1の数だけ行が埋まっている
pointer = 1
# 各マスのブロック数
block = [0]*(n+1)

for i in range(1,3*10**5+500000): layer.setdefault(i,set())
for i in range(q):
    x,y = list(map(int,input().split()))
    if x ==1:
        # ブロックを加えた後、レイヤーにブロック数を追加する
        block[y] += 1
        layer[block[y]].add(y)
        # 全てのマスにブロックが配置された時
        if len(layer[pointer])==n:
            pointer += 1 
    else:
        print( len(layer[y+pointer-1]) )


# キー:set() のデータ構造で、各ブロックのデータ数を管理
# 何ブロックしたから削除されているのかのポインタを用意
# マスのブロックはそのまま置く

# ポインタは、現在揃っていない列の最底辺の位置を示す