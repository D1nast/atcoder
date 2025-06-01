n = gets.to_i
a = gets.split.map(&:to_i)
ans = []
check = [*1..n]

a.each_with_index do |num,index|
  while num != check[index] do
    ans << [index+1,num]
    a[index],a[num-1] = a[num-1],a[index]
    num = a[index]
  end
end


puts ans.size
ans.each { |item| puts "#{item[0]} #{item[1]}" }

