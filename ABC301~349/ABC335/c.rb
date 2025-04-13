n,q = gets.split.map(&:to_i)
query = []
i = 0
queue = Array.new(n){[0,0]}
(1..n).reverse_each do |n|
  queue[i][0] = n
  i += 1
end

q.times do
  one,two = gets.split
  if two.to_i == 0
    query << [one.to_i,two]
  else
    query << [one.to_i,two.to_i]
  end
end
# puts "query:#{query.inspect}"

query.each do |item|
  if item[0] == 1
    arr = queue[-1].dup
    # puts arr.inspect
    case item[1]
    when "U"
      arr[1] += 1
    when "D"
      arr[1] -= 1
    when "R"
      arr[0] += 1
    else
      arr[0] -=1
    end
    queue.push(arr)
  else
    puts "#{queue[-(item[1])][0]} #{queue[-(item[1])][1]}"
  end
end
