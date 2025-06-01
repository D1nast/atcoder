require 'set'
m = gets.to_i
c = gets.split.map(&:to_i)
set = Set.new()
ans = []

(0...m).each do |i|
  set.add(c[i])
end

set.sort.each do |str|
  ans << str
end

puts set.size
puts ans.join(" ")