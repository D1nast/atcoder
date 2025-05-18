def rotate90(grid)
  n = grid.size
  Array.new(n) { |i| Array.new(n) { |j| grid[n - j - 1][i] } }
end

def count_differences(a, b)
  n = a.size
  count = 0
  n.times do |i|
    n.times do |j|
      count += 1 if a[i][j] != b[i][j]
    end
  end
  count
end

# 入力
n = gets.to_i
s = Array.new(n) { gets.chomp.chars }
t = Array.new(n) { gets.chomp.chars }

# 回転4通り試して最小操作数を求める
min_changes = Float::INFINITY
4.times do
  min_changes = [min_changes, count_differences(s, t)].min
  s = rotate90(s)
end

puts min_changes
