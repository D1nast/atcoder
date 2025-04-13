n,m = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
b = gets.split.map(&:to_i)

min = 0
list = []
indList = []

a.each_with_index do |ai,index|
  if index == 0
    list << ai
    indList << index
    min = ai
  else
    if min > ai
      list << ai
      indList << index
      min = ai
    end
  end
end


# puts list.inspect
# puts indList.inspect

# 降順の二分探索
b.each do |sushi|

  left = 0
  right = list.size - 1

  while (right - left) >1 do
    mid = ((left + right)/2)
    if sushi >= list[mid]
      right = mid
    else
      left = mid
    end
  end

  if sushi >= list[left]
    puts indList[left] + 1
  elsif sushi >= list[right]
    puts indList[right] + 1
  else
    puts -1
  end


end

