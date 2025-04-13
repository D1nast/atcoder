def bsearch(dupX,n,search)
  left = -1
  right = n
  while right - left > 1
    mid = left + ( right-left ) / 2 
    if dupX[mid] >= search
      right = mid
    else
      left = mid
    end
  end
  return right
end

n,t = gets.split.map(&:to_i)
s = gets.chomp
x = gets.split.map(&:to_i)
dupX = x.dup
ans = 0
(0...n).each do |i|
  if s[i]=="0"
    dupX[i] -= t * 2
  end
end
dupX.sort!

(0...n).each do |i|
  if s[i] == "0"
    search = x[i]-t*2
    # puts "i:#{i} search:#{search} bsearch:#{bsearch(dupX,n,search)}"
    ans += (i-bsearch(dupX,n,search)).abs
  end
end

puts ans
# puts x.inspect
# puts dupX.inspect