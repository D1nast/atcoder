def seller(sell,n,i)
  left = -1
  right = n
  while right - left > 1
    mid = left + ( right-left ) / 2 
    if sell[mid] >= sell[i]
      right = mid
    else
      left = mid
    end
  end
  # その価格で売る人数を返す
  return right + 1
end

def buyer(sell,buy,m,i)
  left = -1
  right = m
  while right - left > 1
    mid = left + ( right-left ) / 2
    if buy[mid] >= sell[i]
      right = mid
    else
      left = mid
    end
  end
  # 買い手の人数を返す
  return m - right
end

n,m = gets.split.map(&:to_i)
sell = gets.split.map(&:to_i).sort
buy = gets.split.map(&:to_i).sort
ans = 1000000001

if sell[0] > buy[-1]
    puts buy[-1] + 1
    exit 
end 

(0...n).each do |i|
  if seller(sell,n,i) >= buyer(sell,buy,m,i)
    ans = [ans,sell[i]].min
  end
end

puts ans
# 計算量：N × logM
# 本コードの二分探索は left以上right未満
# puts "sell:#{sell.inspect} buy:#{buy.inspect}"