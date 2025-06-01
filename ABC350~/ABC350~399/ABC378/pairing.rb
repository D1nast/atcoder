A = gets.chomp.split.map(&:to_i)
count = Array.new(4,0)
ans = 0

A.each do |n|
  if n == 1
    count[0] = count[0]+1
  elsif n == 2
    count[1] = count[1]+1
  elsif n == 3
    count[2] = count[2]+1
  else
    count[3] = count[3]+1
  end
end

count.each do |n|
  ans += n/2
end

puts ans