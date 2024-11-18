require 'set'
n,k = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
set = Set.new
sum = k * (k + 1) / 2

a.each do |num|
  if num <= k
    set.add(num)
  end
end

puts sum - set.sum






