n,s = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
sum = A.sum
targetF = s % sum
targetL = s % sum
first = 0
(0...n).each do |i|
  first += A[i]
  if first == s
    puts "Yes"
    exit
  end
end

puts "target:#{targetL} sum:#{sum}"
(0...n).each do |i|
  targetF -= A[i]
  if targetF == 0
    puts "Yes"
    exit
  end
end
(0...n).reverse_each do |i|
  targetL -= A[i]
  if targetL == 0
    puts "Yes"
    exit
  end
end

puts "No"