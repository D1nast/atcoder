n,k = gets.split.map(&:to_i)
s = gets.split("").map(&:to_i)

count1 = 0
list = []
kIndex = 0
check = k-1
ans =[]
s.each_with_index do |num,index|
  if num == 1
    count1 += 1
  end
  if num == 0 && count1 > 0
    kIndex+=1
    list << count1
    count1 = 0
  end

  if kIndex == k-1 && check > 0
    
  end
end

kIndex = 0
count1 = 0
decrease = list[k-1]

s.each_with_index do |num,index|
  count1 += 1 if num == 1
  if num == 0 && count1 > 0
    kIndex += 1
    count1 = 0
  end
  if kIndex == k-1 && list[k-1] > 0
    s[index] = 1
    list[k-1] -= 1
  end

end

puts s.inspect