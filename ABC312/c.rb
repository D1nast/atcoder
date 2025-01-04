n,m = gets.split.map(&:to_i)
sell = gets.split.map(&:to_i).sort
# x円以上なら売っても良い
buy = gets.split.map(&:to_i).sort
# x円以下なら買っても良い
ans = Float::INFINITY

if sell[0] > buy[-1]
  puts buy[-1] + 1
  exit
end

(0...n).each do |i|
  seller = i + 1
  left = 0
  right = m
  while right - left > 1
    mid = ((left + right)/2)
    if  sell[i] >= buy[mid]
      left = mid
    else
      right = mid
    end
  end
  if sell[i] > buy[left]
    ans = [ ans,sell[i] ].min if seller >= m - right 
  else
    ans = [ ans,sell[i] ].min if seller >= m - left
  end
end

puts ans


# 計算量：N × logM
puts "sell:#{sell.inspect} buy:#{buy.inspect}"