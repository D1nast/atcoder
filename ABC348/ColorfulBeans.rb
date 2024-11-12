n = gets.to_i
map = Hash.new {|hash,key| hash[key] = [] }
max = 0

n.times do |i|
  input = gets.split.map(&:to_i)
  map[input[1]] << input[0]
end

map.each do |key,value|
  value.sort!
  max = [max,value[0]].max
end

puts max

# 各キーの配列を小さい順にソート
# キーを順番に確認する