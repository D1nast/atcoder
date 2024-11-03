m = gets.to_i
list = (0..10).map {|n| 3**n }
ans = []

while m != 0 do
  filter = list.select {|n| n <= m}
  max = filter.max
  ans << max
  m -= max
end

puts ans.size
ans.each do |n|
  base = 3
  value = n
  puts (Math.log(value)/ Math.log(base)).ceil
end

