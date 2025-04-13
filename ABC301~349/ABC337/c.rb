hash = Hash.new()
ans = []

n = gets.to_i

a = gets.split.map.with_index do |ai,index|
  hash[ai.to_i] = index+1
end

order = hash[-1]
# puts "hash:#{hash.inspect} key:#{order}"

n.times do 
  ans << order
  order = hash[order]
end

puts ans.join(" ")

