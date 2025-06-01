t = gets.to_i
list = []
t.times do
  n = gets.to_i
  s = gets.chomp.chars
  zero = []
  one = []
  current = s[0]
  count = 1
  one_sec = 0
  zero_sec = 0
  ans = Float::INFINITY
  (1...n).each do |i|
    if s[i] == current
      count += 1
    else
      if current == "1"
        one << count
      else
        zero << count 
      end
      count = 1
    end
    if i == n-1
      if s[i] == "1"
        one << count
      else
        zero << count 
      end
    end
    current = s[i]
  end

  if one.size == 0 || zero.size == 0 || (one.size == 1 && zero.size==1)
    list << 0
  else
    one_sec , zero_sec = one.size - 1 , zero.size - 1 
    ans = [ one.sum , zero.sum ].min
    ans = [one[0...one_sec].sum , ans ].min if one_sec != 0  
    ans = [zero[0...zero_sec].sum , ans ].min if zero_sec != 0  
    list << ans
  end
  # puts "one:#{one.inspect} zero:#{zero.inspect}"
end

list.each {|item| puts item}
# puts list.inspect