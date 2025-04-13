n = gets.to_i
grid = Array.new(n+1){Array.new(n+1)}
startT = (n+1) / 2
grid[startT][startT] = "T" 
init = [1,1]
times = []
(1..n).each do |num|
  if num <= n
    init[1] = num
    grid[init[0]][init[1]] = num
    next
  end
end
# 残りの処理順を配列化
(2..n-1).reverse_each do |num|
  times << [num,num]
  times << [1] if num == 2
end
times.each_with_index do |arr,index1|
  num = grid[init[0]][init[1]]
  num += 1
  arr.each_with_index do |i,index2|
    if index1.even?
      case index2
      when 0 then
        i.times do
          init[0] += 1
          grid[init[0]][init[1]] = num
          num += 1
        end
      when 1 then
        i.times do
          init[1] -=1
          grid[init[0]][init[1]] = num
          num += 1
        end
      end
    else
      case index2
      when 0 then
        i.times do
          init[0] -= 1
          grid[init[0]][init[1]] = num
          num += 1
        end
      when 1 then
        i.times do
          init[1] += 1
          grid[init[0]][init[1]] = num
          num += 1
        end
      end
    end
  end
end

grid.each_with_index do |item,index|
  next if index == 0
  puts item[1..-1].join(" ")
  # puts item[1..-1].inspect
end
# puts grid.inspect
# puts times.inspect
# 1 2 3 4 5
# 16 17 18 19 6
# 15 24 T 20 7
# 14 23 22 21 8
# 13 12 11 10 9
# 5,4,4,3,3,2,2,1

# 1 2 3
# 8 T 4
# 7 6 5
# 3,2,2,1