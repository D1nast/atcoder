# def intersectionOfArraysRepeats(intList1,intList2)
#   # 関数を完成させてください
#   i = 0
#   arr =[]
#   intList1.each do |a|
#     if intList2.index(a)
#       arr << a
#       intList2.delete_at(intList2.index(a))
#     end
#     i += 1
#   end
#   return arr.sort
# end

# intersectionOfArraysRepeats([3,2,2,2,1,10,10],[3,2,10,10,10])
# 
#
def intersectionOfArraysRepeats(intList1,intList2)
  # 関数を完成させてください
  hash = Hash.new(0)
  intList2.each do |num|
      hash[num] += 1
  end
  result = []

  intList1.each do |num|
    if hash[num] > 0
      result << num
      hash[num] -= 1
    end
  end
  puts result
end

intersectionOfArraysRepeats([3,2,2,2,1,10,10],[3,2,10,10,10])