# HxWのマス上をN回移動
h,w,n = gets.split.map(&:to_i)
t = gets.chomp 
grid = Array.new(h+1)
ans = 0
# グリッドの設定
(1..h).each do |i|
  s = " " + gets.chomp
  grid[i] = s
end

(2...h).each do |i|
  (2...w).each do |j|
    next if grid[i][j] == "#"
    init = [i,j]
    (0...n).each do |move|
      case t[move]
      when "L" then
        init[1] -= 1
      when "R" then
        init[1] += 1
      when "U" then
        init[0] -= 1
      when "D" then
        init[0] += 1
      end
      break if grid[init[0]][init[1]] == "#"
    end
    next if grid[init[0]][init[1]] == "#"
    ans += 1
  end
end

puts ans
# 2,2からh-1,w-1まで
# 解法を見たところ、時間計算量と構文は同じっぽいので問題ないが
# O(HWN)が10^8くらいになるのでRubyだと間に合わない