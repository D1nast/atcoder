n = gets.to_i
a = [0] + gets.split.map(&:to_i)
arr = Array.new(n+1){0}
ans = []

(1..n*3).each do |i|
  arr[a[i]] += 1
  if arr[a[i]] == 2
    ans << a[i]
  end
end

puts ans