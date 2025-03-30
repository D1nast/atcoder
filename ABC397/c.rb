require 'set'
n = gets.to_i
a = gets.split.map(&:to_i)

l = []
lset = Set.new()
r = []
rset = Set.new()
position = -1
ans = 0
(0...n-1).each do |i|
  lset.add(a[i])
  l << lset.size
end

(1...n).reverse_each do |i|
  rset.add(a[i])
  r << rset.size
  ans = [ ans, rset.size+l[position] ].max
  position -= 1
end 


#  puts l.inspect
#  puts r.inspect
 puts ans