n = gets.to_i
a = gets.split.map(&:to_i)
k = (a[1]+0.0) / a[0]
current = a[0]

(0...n).each do |i|
  next if i == 0
  if current * k == a[i]
    current = a[i]
  else
    puts "No"
    exit
  end
end

puts "Yes"
# puts k
