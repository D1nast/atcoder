n = gets.to_i
s = gets.split.map(&:to_i)
s.sort!
ans = 0


(1..n).each do |i|

  left = 0
  right = n-1

  while right - left >1
    mid = (left+right)/2
    if s[mid] >= i
      right = mid
    else
      left = mid
    end
  end

  if s[left]==i
    ans = left+1
  else
    ans 
  end
end