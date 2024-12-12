n = gets.to_i
a = gets.split.map(&:to_i)
list = Array.new(a.max + 1){[]}
ans = []

list[1] =  a.sort { |a,b| b <=> a }
(0...list[1].size).reverse_each do |i|
  break if list[1][i] > 1
  list[1].pop
end

# puts list[1].inspect
# puts list.inspect

(2...a.max).each do |i|
  # puts "i = #{i}"
  list[i] = list[i-1].dup
  # puts "list[i]= #{list[i]}"
  list[i].reverse_each do |j|
    break if j > i
    list[i].pop
  end
end

a.each {|i| ans << list[i].sum }

puts ans.join(" ")