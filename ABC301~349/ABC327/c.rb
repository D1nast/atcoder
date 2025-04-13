arr = Array.new(10){[0,0,0,0,0,0,0,0,0,0]}
# 9x9のマス目
(1..9).each do |i| 
  row = [0] + gets.split.map(&:to_i)
  arr[i] = row
end
# 行の確認
arr.each_with_index do |item,index|
  next if index == 0
  check = Array.new(10){0}
  (1..9).each { |i|check[item[i]] += 1 }
  check.each_with_index do |i,index|
    next if index == 0
    if i != 1
      puts "No"
      exit
    end
  end
end
# 列確認
(1..9).each do |i|
  check = Array.new(10){0}
  (1..9).each { |j| check[arr[j][i]] += 1 }
  check.each_with_index do |item,index|
    next if index == 0
    if item != 1
      puts "No"
      exit
    end
  end
end

# 3x3確認
# 4重ループで3*3のブロックを探索
[1,4,7].each do |i|
  [1,4,7].each do |j|
    check = Array.new(10){0}
    [0,1,2].each do |ni|
      [0,1,2].each do |nj|
        row,column =  i + ni, j + nj
        check[arr[row][column]] += 1
      end
    end
    check.each_with_index do |item,index|
      next if index == 0
      if item != 1
        puts "No"
        exit
      end
    end
  end
end
puts "Yes"