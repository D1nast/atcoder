n = gets.chomp.split.map(&:to_i)
t = gets.chomp.split.map(&:to_i)

# puts n.inspect
# puts t.inspect

count = 0
tmp = 0
t.each_with_index do |num, index|
  if index == 0
    count += 1
    tmp = num
  elsif tmp + n[1] <= num
    count += 1
    tmp = num
  end
end

puts count