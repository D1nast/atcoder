N = gets.to_i
P = [0] + gets.split.map(&:to_i)
Q = [0] + gets.split.map(&:to_i)
query = []
ans = []
(1..N).each do |i|
  arr = [Q[i],P[i]]
  query << arr
end

query.sort.each do |qi,pi|
  ans << Q[pi]
end

puts ans.join(" ")