n = gets.to_i
a = gets.split.map(&:to_i)

dp0 = 0 # 偶数
dp1 = -Float::INFINITY # 奇数

a.each do |x|
  tmp = dp0
  dp0 = [dp0, dp1 + 2 * x].max
  dp1 = [dp1, tmp + x].max
end

puts [dp0, dp1].max
