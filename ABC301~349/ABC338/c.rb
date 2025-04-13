n = gets.to_i
q = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
b = gets.split.map(&:to_i)
ans = 0
turn = Float::INFINITY
upperB = Float::INFINITY

(0...n).each do |i|
  turn = [ q[i]/a[i],turn ].min if a[i] != 0
  upperB = [ upperB,q[i]/b[i] ].min if b[i] != 0
end

(0..turn).each do |i|
  cook = 0
  minB = Float::INFINITY
  (0...n).each do |j|
    if b[j] == 0
      bn = upperB
    else
      bn = ( q[j] - a[j]* i ) / b[j]
      bn = upperB if bn > upperB
    end
    minB = [ minB,bn ].min
  end
  cook = minB + i
  ans = [ ans,cook ].max
end

puts ans

# 計算量：N + N*10^6 = 10^7位