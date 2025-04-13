N = gets.to_i
ans = []

(1..1000000).each do |i|
  num = i ** 3
  digit = num.to_s
  len = digit.length
  if len == 1
    ans << num
    next
  end
  if len.even?
    ans << num if digit[0..(len/2-1)] == digit[(len/2)..-1].reverse
  else
    ans << num if digit[0..(len/2-1)] == digit[(len/2+1)..-1].reverse
  end
end

ans.reverse.each do |num|
  if N >= num
    puts num
    exit
  end
end 
# 回文 前から見ても１から見ても同じ
# 立方数　x^3 = K