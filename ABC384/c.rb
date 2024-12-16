point = gets.split.map(&:to_i)
list = []
listToNumber = Hash.new

# 全ての組み合わせを試す
(1...(1 << 5)).each do |i|
  ans = Array.new(5){0}
  (0...i).each do |shift|
    # puts "#{i}回目のshift:#{shift}"
    if (i >> shift ) & 1 == 1
      # puts "#{i}回目 #{shift}"
      ans[shift] = point[shift]
    end
  end
  list << ans
end

list.each_with_index do |item,index|
  listToNumber[index] = item.sum
end

sorted = listToNumber.sort_by { |_, v| -v }.to_h
puts sorted.inspect
puts list.inspect
# listToNumber.sort!


# list.each do |num|
#   str = ""

#   num.each_with_index do |n,index|
#     if n != 0
#       case index
#       when 0 then
#         str += "A"
#       when 1 then
#         str += "B"
#       when 2 then
#         str += "C"
#       when 3 then
#         str += "D"
#       else
#         str += "E"
#       end
#     end
#   end

#   aaa << str

# end

# puts aaa.inspect

