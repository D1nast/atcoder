n,m = gets.split.map(&:to_i)
count = Array.new(m)
foods = Array.new(n){[]}
ans = 0
m.times do |i|
  input = gets.split.map(&:to_i)
  count[i] = input[0]
  input[1..-1].each do |j|
    foods[j-1] << i
  end
end
b = gets.split.map(&:to_i)
b.each do |i|
  i -= 1
  foods[i].each do |j|
    count[j] -= 1
    ans += 1 if count[j]==0
  end
  puts ans
end