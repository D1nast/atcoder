n = gets.to_i
s = gets.split.map(&:to_i)
q = gets.to_i
t = gets.split.map(&:to_i)
s.uniq!

count = 0

t.each do |n|

  left = 0
  right = s.size

  while (right - left) >1 do
    mid = ((left + right)/2)
    if n >= s[mid]
      left = mid
    else
      right = mid
    end
  end
  count += 1 if s[left] == n || s[right] == n

end

puts count
