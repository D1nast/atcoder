require 'set'

n , s = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
sum = a.sum
target = s%sum
cumulative = Array.new(n*2)
set = Set.new()
set.add(0)

(0...n*2).each do |i|
  if i < a.size
    cumulative[i] = a[i] if i == 0
    cumulative[i] = a[i] + cumulative[i-1] if i != 0
  else
    cumulative[i] = a[i-a.size] + cumulative[i-1]
  end
end

cumulative.each { |element| set.add(element) }

cumulative.each do |e|
  if set.include?(e-target)
    puts "Yes"
    exit
  end
end  
puts "No"
# puts cumulative.inspect
# puts target