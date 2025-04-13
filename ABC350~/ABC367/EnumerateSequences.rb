N,K = gets.chomp.split.map(&:to_i)
R = gets.chomp.split.map(&:to_i)

# R[0]からR[-1]までを乗算する。組み合わせパターンの計算
cal = 0
(R[0]..R[-1]).each_with_index do |num,index|
  if index == 0
    cal = num
  else
    cal = cal * num
  end
end
# 全ての組み合わせパターン数の配列を作成
arr = Array.new(cal) { Array.new(N,0) }

