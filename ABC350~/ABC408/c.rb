n,m = gets.split.map(&:to_i)
arr = Array.new(n+1){0}
current = 0
ans = Float::INFINITY
m.times do
  l,r = gets.split.map(&:to_i)
  l -= 1
  arr[l] += 1
  arr[r] -= 1
end

(0...n).each do |i|
  arr[i] = arr[i] + current
  current = arr[i]
end

(0...n).each do |i|
  ans = [ans,arr[i]].min
end
# puts arr.inspect
puts ans