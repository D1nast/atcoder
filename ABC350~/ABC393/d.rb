n = gets.to_i
s = gets.chomp

p = []
s.chars.each_with_index { |c, i| p << i if c == '1' }

k = p.size
p.each_with_index { |x, i| p[i] = x - i }

med = p[k / 2]
ans = p.sum { |x| (med - x).abs }

puts ans
