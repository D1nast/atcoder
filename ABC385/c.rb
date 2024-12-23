hash = Hash.new()
max = 1

n = gets.to_i

h = gets.split.map.with_index do |hi,index|
  hash[hi.to_i] = index+1
end

puts hash.inspect