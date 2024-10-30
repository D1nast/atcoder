# Nがマス数、Mがコマ数
N,M = gets.chomp.split.map(&:to_i)
arr = Array.new(N) {Array.new(N,0)}
count = 0
# コマをマス目に配置
M.times do
  # position[0]が行、position[1]が列
  position = gets.chomp.split.map(&:to_i)
  # 当該マスにナイトを配置
  arr[position[0]-1][position[1]-1] = 1   if !arr[position[0]-1][position[1]-1].nil?
  # 負の数でないこと、行がnilではなく、かつ列もnilではないことがコマを配置する条件
  # 下に二行右に一列
  arr[position[0]+1][position[1]]   = 1   if !arr[position[0]+1].nil? && !arr[position[0]+1][position[1]].nil?
  # 下に一行右に2列
  arr[position[0]][position[1]+1]   = 1   if !arr[position[0]].nil? &&!arr[position[0]][position[1]+1].nil?
  # 上に一行右に2列
  arr[position[0]-2][position[1]+1] = 1   if (position[0]-2).positive? && !arr[position[0]-2][position[1]+1].nil?
  # 上に二行右に一列
  arr[position[0]-3][position[1]]   = 1   if (position[0]-3).positive? && !arr[position[0]-3][position[1]].nil?
  # 上に二行左に一列
  arr[position[0]-3][position[1]-2] = 1   if (position[0]-3).positive? && (position[1]-2).positive? && !arr[position[0]-3][position[1]-2].nil?
  # 上に一行左に2列
  arr[position[0]-2][position[1]-3] = 1   if (position[0]-2).positive? && (position[1]-3).positive? && !arr[position[0]-2][position[1]-3].nil?
  # 下に一行左に2列
  arr[position[0]][position[1]-3]   = 1   if  !arr[position[0]].nil? && (position[1]-3).positive? && !arr[position[0]][position[1]-3].nil?
  # 下に二行左に一列
  arr[position[0]+1][position[1]-2]   = 1   if !arr[position[0]+1].nil? && (position[1]-2).positive? && !arr[position[0]+1][position[1]-2].nil?
end

# 7 3~
# 8 3~からエラーが出る

arr.each do |item|
  (0...N).each do |i|
    if item[i] == 0
      count += 1
    end
  end
end

puts arr.inspect
puts count

# 8 6
# 1 4
# 2 1
# 3 8
# 4 5
# 5 2
# 8 3
# テストケース８３でエラー

