require 'set'

n = gets.to_i
set = Set.new

list = [1,11,111,1111,11111,111111,1111111,11111111,111111111,1111111111,11111111111,111111111111]

list.each do |i|
  list.each do |j|
    list.each do |k|
      set.add(i+j+k)
    end
  end
end

ans = set.sort
puts ans[n-1]