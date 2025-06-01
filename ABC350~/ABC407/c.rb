s = gets.chomp.chars.map(&:to_i)
ans = s.size
ans += s[-1]
list = (1..9).to_a
current = s[0]

(1...s.size).each do |i|
  
  if current - s[i] >= 0
    ans += current - s[i]    
  else
    ans += list[current-s[i]]
  end
  current = s[i]
end
puts ans