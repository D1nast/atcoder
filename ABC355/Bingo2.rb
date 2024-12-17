n,t = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

vertical = Array.new(n){0}
horizontal = Array.new(n){0}
leftdiag = n
rightdiag = n

(0...t).each do |i|

  ai = a[i]
  # puts "ai:#{ai}"

  # 縦軸の判定
  if ai % n == 0
    vertical[ai/n-1] += 1
  else
    vertical[ai/n] += 1
  end
  # 横軸の判定
  horizontal[ai%n-1] += 1
  # 対角線軸の判定
  leftdiag  -= 1 if (ai - 1) % (n + 1) == 0 || ai == 1 
  rightdiag -= 1 if ai != n**2 && (ai - n) % (n - 1) == 0 || ai == n

  # puts "left:#{leftdiag} right:#{rightdiag}"
  # ビンゴの判定
  if horizontal[ai%n-1] == n || vertical[ai/n] == n || vertical[ai/n-1] == n || leftdiag == 0 || rightdiag == 0 
    puts i+1
    exit
  end

  # puts "vertical:#{vertical.inspect}"
  # puts "horizontal:#{horizontal.inspect}"
  
end

puts -1

# puts "#{vertical} #{horizontal}"
