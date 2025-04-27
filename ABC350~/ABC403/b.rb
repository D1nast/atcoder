T = gets.chomp
U = gets.chomp
list = []
l = 0
r = U.size-1

while r < T.size
  str = T[l..r]
  list << str
  l += 1
  r += 1
end
# puts list.inspect
list.each do |arr|
  # puts arr
  calc = 0
  (0...U.size).each do |i|
    calc +=1 if arr[i] != "?" && arr[i] != U[i]
  end
  if calc == 0
    puts "Yes"
    exit
  end
end

puts "No"