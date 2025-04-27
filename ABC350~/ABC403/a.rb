N = gets.to_i
num = [0] + gets.split.map(&:to_i)
ans = 0
(1..N).each do |i|
  ans += num[i] if i.odd?
end
puts ans