n, m = gets.split.map(&:to_i)
c = gets.split.map(&:to_i)
a = []

m.times do
  k, *rest = gets.split.map(&:to_i)
  if rest.empty?
    rest = gets.split.map(&:to_i)
  end
  rest = rest[0, k].map { |x| x - 1 }
  a << rest
end

p3 = [1]
n.times { p3 << p3[-1] * 3 }

puts p3.inspect
INF = 10**18
ans = INF

# 0から80まで
(0...p3[n]).each do |s|
  t = Array.new(n)
  n.times { |i| t[i] = (s / p3[i]) % 3 }

  cost = 0
  n.times { |i| cost += c[i] * t[i] }

  a.each do |group|
    cnt = group.sum { |i| t[i] }
    if cnt < 2
      cost = INF
      break
    end
  end

  ans = [ans, cost].min
end

puts ans