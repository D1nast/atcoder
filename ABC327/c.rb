arr = Array.new(10){[0,0,0,0,0,0,0,0,0,0]}
arr3x3 = Array.new(10){[0,0,0]}
hash = Hash.new()
# 9x9のマス目
(1..9).each do |i| 
  hash[i] = 0
  row = [0] + gets.split.map(&:to_i)
  arr[i] = row
end

#　列と行の要件確認
(1..9).each do |i|
  # 行の確認
  if  arr[i].sum != 45
    puts "No"
    exit
  end
  count = 0

  (1..9).each do |j|
    count += arr[j][i]
    hash[arr[i][j]] += 1
  end

  if count != 45
    puts "No"
    exit
  end

end

(1..9).each do |i|
  sum = 0
  (1..9).each do |j|
    sum += arr[i][j]
    if j % 3 == 0
      arr3x3[i][j/3-1] = sum
      sum = 0
    end
  end
end

# 3x3 を９回繰り返す
[1,4,7].each do |i|
  one = arr3x3[i][0]
  two = arr3x3[i][1]
  three = arr3x3[i][2]
  (i+1...i+3).each do |j|
    one += arr3x3[j][0]
    two += arr3x3[j][1]
    three += arr3x3[j][2]
  end
  if one != 45 || two != 45 || three != 45
    puts "No"
    exit
  end
end

hash.each do |key,value|
  if value != 9
    puts "No"
    exit
  end
end

puts "Yes"