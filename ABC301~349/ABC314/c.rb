n,m = gets.split.map(&:to_i)
s = "0" + gets.chomp
c = [0] + gets.split.map(&:to_i)

list = Array.new(m+1){[-1,[]]}

(1..n).each do |i|
  list[c[i]][1] << s[i]
end

(1..n).each do |i|
  # puts list[c[i]][1][list[c[i]][0]].inspect
  s[i] = list[c[i]][1][list[c[i]][0]]
  list[c[i]][0] += 1
end

puts s[1..-1]
