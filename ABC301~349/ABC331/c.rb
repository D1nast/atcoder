n = gets.to_i
a = gets.split.map(&:to_i)
list = Array.new(a.max + 1){0}
ans = []
tmp = 0

a.each { |i| list[i] += 1  }

(1...list.size).reverse_each do |i|
  tmp = list[i+1] if i != list.size - 1
  list[i] = list[i] * i + tmp
end

a.each do |i|
  if list[i+1].nil?
    ans << 0
  else
    ans << list[i+1]
  end
end

puts ans.join(" ")