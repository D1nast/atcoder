# Nを３回ループさせれば解ける
n = gets.to_i
s = gets.chomp
q = gets.to_i
last = 0
arr = []

q.times do 
  input = gets.chomp.split
  arr << input
end

(0...q).reverse_each do |i|
  if arr[i][0] == "2" || arr[i][0] == "3"
    last = i
    break
  end
end

(0..last).each do |i|
  s[arr[i][1].to_i - 1 ] = arr[i][2] if arr[i][0] == "1"
  if i == last
    s.downcase! if arr[i][0] == "2"
    s.upcase! if arr[i][0] == "3"
  end
end

(last+1...q).each do |i|
  s[arr[i][1].to_i - 1 ] = arr[i][2] if arr[i][0] == "1"
end

puts s