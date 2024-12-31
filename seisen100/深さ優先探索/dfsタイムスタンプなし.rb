def dfs(graph,visited,timestamp,start,time,n)
  visited[start-1] = true
  graph[start-1].each do |nextNode|
    puts "start:#{start} nextNode:#{nextNode}"
      if nextNode > 0 && nextNode <= n && !visited[nextNode-1]
        dfs(graph,visited,timestamp,nextNode,time,n)
      end
  end
  puts "終わり #{start}"
end

n = gets.to_i
input = []
start = 1
time = 1
n.times do
  input << gets.split.map(&:to_i)
end 
graph = Array.new(n,[])
visited = Array.new(n,false)
timestamp = Array.new(n,[-1,-1])
input.each do |item|
  if item[1] == 0
    graph[item[0]-1] = [item[1]]
  else
    graph[item[0]-1] = item[2..-1]
  end
end

(0...n).each do |i|
  dfs(graph,visited,timestamp,start,time,n) if !visited[i]
end

puts graph.inspect

# (0...n).each do |i|
#   dfs(graph,visited,timestamp,start,time,n) unless visited[i]
# end
# 答えの出力
# timestamp.each_with_index do |t,index|
#   puts "#{index+1} #{t[0]} #{t[1]}"
# end 