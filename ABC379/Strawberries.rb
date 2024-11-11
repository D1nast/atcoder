n,k = gets.split.map(&:to_i)
s = gets.chomp.split("")

tmp = 0
count = 0

(0...n).each do |i|
  if s[i] == "O"
    tmp += 1
  else
    tmp = 0
  end
   if tmp == k
      tmp = 0
      count += 1
   end

end
puts count