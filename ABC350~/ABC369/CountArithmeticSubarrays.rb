# N = gets.to_i
# A = gets.chomp.split.map(&:to_i)

# count = A.size + A.size - 1 # 各要素とその隣接要素からなる部分列をカウント
# tmp = 0
# (2...N).each do |i|
#   # 同じ差を持つ部分列の長さを数える
#   tmp = 2 if i == 2
#   puts "tmp初期値#{tmp}"

#   if tmp > i && tmp < N
#     i = tmp
#     while i < N && A[i] - A[i-1] == A[i-1] - A[i-2] do
#       count += 1
#       i += 1
#       puts "while#{i}番目の処理"
#     end
#     tmp = i
#     puts tmp

#   else
    
#     while i < N && A[i] - A[i-1] == A[i-1] - A[i-2] do
#       count += 1
#       i += 1
#       puts "while#{i}番目の処理"
#     end
  
#   end
# end

# puts count

# 計算量：O(N*A)になってしまう

# 4
# 3 6 9 3
# i = 2  9 - 6 == 6 - 3
# i = 3  3 - 9 == 9 - 6 


# パターン
# ①　配列の数分
# ②　配列の数−１のパターン
# ③配列２-配列１（初項）＝公差
# n番目 - n-1番目 = n-1番目 -　n-2番目（n-1番目とn-2番目は交差であることが担保されている）ならcountを増やす
# そうでないなら開始のインデックスを1文字右にずらす

# 以下答え

def f(n)
  n * (n + 1) / 2
end

n = gets.to_i
a = gets.chomp.split.map(&:to_i)
ans = n
pre = 0

(1...n - 1).each do |i|
  if a[i] - a[i - 1] != a[i + 1] - a[i]
    ans += f(i - pre)
    pre = i
  end
end

ans += f(n - 1 - pre)
puts ans

# 4
# 3 6 9 3

# n * (n+1)/2
# 三角関数。1からnまでの合計


# 5
# 1 1 1 1 1

