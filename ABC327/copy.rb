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
[1,4,7].each do |i|
  check = Array.new(10){0}
  3.times do
    (1..3).each do |j|
      check[arr[i][j]] += 1 
    end
    i += 1
  end
  check.each_with_index do |item,index|
    next if index == 0
    if item != 1
      puts "No"
      exit
    end
  end
end
[1,4,7].each do |i|
  check = Array.new(10){0}
  3.times do
    (4..6).each do |j|
      check[arr[i][j]] += 1 
    end
    i += 1
  end
  check.each_with_index do |item,index|
    next if index == 0
    if item != 1
      puts "No"
      exit
    end
  end
end
[1,4,7].each do |i|
  check = Array.new(10){0}
  3.times do
    (7..9).each do |j|
      check[arr[i][j]] += 1 
    end
    i += 1
  end
  check.each_with_index do |item,index|
    next if index == 0
    if item != 1
      puts "No"
      exit
    end
  end
end
puts "Yes"