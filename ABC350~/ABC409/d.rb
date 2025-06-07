t = gets.to_i
t.times do
  n = gets.to_i
  s = gets.chomp
  target = s[-1]
  left = -1
  left = 0
  right = n
  prev = s[0]
  fin = 0
  (0...n).each do |i|
    # 削除する文字の判定
    if prev > s[i]
      target = prev
      left = i-1
      # puts "target:#{target} left:#{left}"
      break
    end
    prev = s[i]
  end
  
  if fin == 1
    puts s
    next
  end

  (left+1...n).each do |i|
    if target < s[i]
      # puts "target < s:#{target}<#{s[i]}"
      right = i
      break
    end
    right = n
  end
  # puts "left:#{left} right:#{right}"

  s.insert(right,target)
  s.slice!(left)
  puts s
end

