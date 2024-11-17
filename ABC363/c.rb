require 'set'
n,k = gets.split.map(&:to_i)
s = gets.chomp.chars
set = Set.new
check = []

#回文を作るための宣言 
left =  0
right = -1
part = s[0...k]
dup = part.dup
# 回文作成
(0...part.length).each do 
  part[left] = dup[right]
  left += 1
  right -= 1
end

part = part.join
# Nの階乗で全列挙
s.permutation do |item|
  set.add(item.join)
end

# puts "part:#{part}"
# set.each do |item|
#   # puts "set:#{item}についての処理"
#   (0...n).each do |i|
#    break if i + part.length > s.length 
#   #  puts item[i...(i+part.size)]
#    check << item if item[i...(i+part.size)] == part
#   end
# end

# puts check.inspect
# puts set.inspect
# puts part.inspect

puts set.size - check.size