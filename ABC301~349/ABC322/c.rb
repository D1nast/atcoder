# 配列の後ろから数えて、花火が打ち上がらないならカウントを増やす
n,m = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

count = 0
arr = Array.new(n+1){0}
a.each { |i| arr[i] += 1}  

(1..n).reverse_each do |i|
  if arr[i] == 0
    count += 1
    arr[i] = count
  else
    arr[i] = 0 
    count = 0
  end  
end

arr.each_with_index do |i,index|
  next if index == 0
  puts i 
end

