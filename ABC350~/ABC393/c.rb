require 'set'
n , m = gets.split.map(&:to_i)
v = []
count = 0
set = Set.new()
m.times do
  v <<  gets.split.map(&:to_i).sort
end

v.each do |node|
  next if node[0] == node[1]
  # puts node.inspect
  set.add(node)
end

puts m - set.size
