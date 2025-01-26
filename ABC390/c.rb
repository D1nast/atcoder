h,w = gets.split.map(&:to_i)
grid = []
upper = 1001
lower = nil
left = 1001
right = 0
h.times do
  grid << gets.chomp
end
# 黒塗りマスの左端と黒塗りマスのうち一番上の行を探索
(0...h).each do |i|
  (0...w).each do |j|
    if grid[i][j] == "#"
      left = [ left,j ].min
      upper = i if upper == 1001
      break
    end
  end
end
# 黒塗りマスの右端を探索
(0...h).reverse_each do |i|
  (0...w).reverse_each do |j|
    if grid[i][j] == "#"
      right = [ right,j ].max
      lower = i if lower.nil?
      break
    end
  end
end


(upper..lower).each do |i|
  (left..right).each do |j|
    if grid[i][j] == "."
      puts "No"
      exit
    end
  end
end

puts 'Yes'
# puts "upper:#{upper} lower:#{lower}"
# puts "left:#{left} right:#{right}"
# puts grid.inspect