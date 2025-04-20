require 'thread'  # Queueはこの中にある
q = gets.to_i
query = Queue.new
list = []
q.times do
  list << gets.split.map(&:to_i)
end


(0...q).each do |i|
  if list[i][0] == 1
    query.push(list[i])
  else
    ans = query.pop
    puts ans[1]
  end   
end


