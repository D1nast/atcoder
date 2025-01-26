require 'bigdecimal'
require 'bigdecimal/util'
n = gets.to_i
cointos = []
ans = []
map = Hash.new{|hash,key| hash[key] = []}
n.times do
  cointos << gets.split.map(&:to_i)
end
(0...n).each do |i|
  map["#{(cointos[i][0])}".to_d / (cointos[i].sum)] << i+1
end
map.sort.reverse_each do |hash,value|
  value.sort.each {|num| ans << num }
end
# puts map.sort.inspect
puts ans.join(" ")
