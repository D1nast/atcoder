n,t = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

vertical = Array.new(n){0}
horizontal = Array.new(n){0}
leftdiag = n
rightdiag = n

(0...t).each do |i|

  ai = a[i]
  # puts "ai:#{ai}"

  # 縦軸の判定
  if ai % n == 0
    vertical[ai/n-1] += 1
  else
    vertical[ai/n] += 1
  end
  # 横軸の判定
  horizontal[ai%n-1] += 1
  # 対角線軸の判定
  leftdiag  -= 1 if (ai - 1) % (n + 1) == 0 || ai == 1 
  rightdiag -= 1 if ai != n**2 && (ai - n) % (n - 1) == 0 || ai == n

  # puts "left:#{leftdiag} right:#{rightdiag}"
  # ビンゴの判定
  if horizontal[ai%n-1] == n || vertical[ai/n] == n || vertical[ai/n-1] == n || leftdiag == 0 || rightdiag == 0 
    puts i+1
    exit
  end

  # puts "vertical:#{vertical.inspect}"
  # puts "horizontal:#{horizontal.inspect}"
  
end

puts -1



# 以下全てACのコード
# n, t = gets.split.map(&:to_i)  # 盤面のサイズ n とターン数 t
# a = gets.split.map(&:to_i)     # 宣言されたターンの番号を取得

# # 縦、横、対角線のカウンタ
# vertical = Array.new(n, 0)     # 縦軸のカウント
# horizontal = Array.new(n, 0)   # 横軸のカウント
# leftdiag = 0                   # 左上から右下の対角線
# rightdiag = 0                  # 右上から左下の対角線

# # 各ターンごとに処理
# (0...t).each do |i|
#   ai = a[i] - 1  # 1からのインデックスを0ベースに変換
  
#   row = ai / n  # 行のインデックス
#   col = ai % n  # 列のインデックス
  
#   # 縦軸のカウント
#   vertical[col] += 1
#   # 横軸のカウント
#   horizontal[row] += 1
#   # 左上から右下の対角線のカウント
#   leftdiag += 1 if row == col
#   # 右上から左下の対角線のカウント
#   rightdiag += 1 if row + col == n - 1

#   # ビンゴの判定
#   if vertical[col] == n || horizontal[row] == n || leftdiag == n || rightdiag == n
#     puts i + 1
#     exit
#   end
# end

# puts -1  # すべてのターンを終わってもビンゴが達成されなかった場合


