n = gets.to_i
k = gets.split.map(&:to_i)
ans = 0

(0...(1 << n)).each_with_index do |num,index|
  a = 0
  b = 0
  (0...n).each do |shift|
    if (num >> shift) & 1 == 1
      a += k[shift]
    else
      b += k[shift]
    end
  end

  ans = [a,b].max if index == 0
  ans = [ans,[a,b].max].min

end

puts ans

