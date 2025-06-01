# N = gets.to_i
# X = gets.chomp.split.map(&:to_i)
# P = gets.chomp.split.map(&:to_i)
# Q = gets.to_i
# LR = Q.times.map {gets.chomp.split.map(&:to_i)}

# LR.each do |query|
#   head = X.bsearch_index { |x| x >= query[0]}
#   tail = X.bsearch_index { |x| x > query[1]}
#   # 二分探索で配列から指定の範囲の頭のインデックスとケツから一つ隣のインデックスを取得
#   if tail.nil?
#     tail = -1
#   # tailがnilだった場合（右端の数字がクエリよりも小さかった場合）最後尾の要素を取得
#   else
#     tail -= 1
#   end
#   puts P[head..tail].sum
# end


# 入力の受け取り
n = gets.to_i
x = gets.chomp.split.map(&:to_i)
p = gets.chomp.split.map(&:to_i)

# 累積和の計算
s = Array.new(n + 1, 0)
(0...n).each do |i|
  s[i + 1] = s[i] + p[i]
end

# r に対して累積和を求める関数
f = lambda do |r|
  pos = x.bsearch_index { |val| val > r } || n
  s[pos]
end

# クエリの処理
q = gets.to_i
(0...q).each do
  l, r = gets.chomp.split.map(&:to_i)
  ans = f.call(r) - f.call(l - 1)
  puts ans
end
