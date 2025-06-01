l,r = gets.split
ls = l.size
rs = r.size
start = r[0].to_i
ans = 0
check = r[0]
while rs > 1
  # 各桁数のヘビ数探索
  while start > 0
    if start == 1
      ans += 1
    else
      # puts "start:#{start}"
      # puts "(rs - 1)**start:#{(rs-1)**start}"
      # 
      ans += (rs-1)**start
    end
    start -= 1
  end
  rs -= 1
  start = 9
end

puts "ls#{ls} rs:#{rs}"
puts ans
# 桁数-1　上一桁の数字-1 
