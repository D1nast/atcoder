n,q = gets.split.map(&:to_i)
s = " " + gets.chomp
query = Array.new(q+1)
tmp = s[1]
list = Array.new(n+1){0}

(1...s.length).each do |i|
  list[i] = list[i-1]
  next if i == 1
  list[i] += 1 if s[i] == tmp
  tmp = s[i]
end

(q+1).times do |i|
  next if i ==  0
  l,r = gets.split.map(&:to_i)
  query[i] = l,r
end

query.each do |i|
  next if i.nil?
  puts list[i[1]] - list[i[0]]
end