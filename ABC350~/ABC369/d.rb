n = gets.to_i
a = [0] + gets.split.map(&:to_i)

dpEven = Array.new(n+1){0}
dpOdd = Array.new(n+1){0}
dpEven[0] = 0
dpOdd[0] = -Float::INFINITY

(1..n).each do |i|
  dpEven[i] = [ dpEven[i-1],dpOdd[i-1]+a[i]*2 ].max
  dpOdd[i] = [ dpOdd[i-1],dpEven[i-1]+a[i] ].max
end

puts [dpEven[-1],dpOdd[-1] ].max

