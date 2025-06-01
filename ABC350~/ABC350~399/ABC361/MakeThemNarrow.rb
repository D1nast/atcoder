n,k = gets.split.map(&:to_i)
a = gets.split.map(&:to_i).sort

count = 0

(0...n).each_with_index do |i,index|

  left = i
  right = i + (n-k-1)

  break if a[right] == nil
  count = a[right] - a[left] if index == 0

  count = [ count , a[right]-a[left] ].min

end

puts count

