N = gets.to_i
P = gets.split.map(&:to_i)
check = []
rle = []
ans = 0
count = 0
(1...P.size).each do |i|
  if P[i] >P[i-1]
    check << 0
  else
    check << 1
  end
end
(0...check.size).each do |i|
  if check[i] == 0
    count += 1
  else
    rle << count if count > 0
    count = 0
  end
  rle << count if i==check.size-1 && count > 0
end

(1...rle.size).each do |i|
  ans += rle[i-1]*rle[i]
end

# puts rle.inspect
# puts check.inspect
puts ans