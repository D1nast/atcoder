def dfs(graph,visited,i,ans)
  visited[i] = true
  # puts visited.inspect
  graph[i].each do |next_i|
    if !visited[next_i]
      dfs(graph,visited,next_i,ans)
    else
      ans[:current] += 1
    end
  end
end

n,m = gets.split.map(&:to_i)
graph = Array.new(n){[]}
visited = Array.new(n){false}
ans = {current:0}
m.times do
 input = gets.split.map(&:to_i)
 graph[input[0]-1] << input[1]-1
end
# puts graph.inspect
# puts visited.inspect
graph.each_with_index do |next_node,index|
  visited[index] = true
  next_node.each do |i|
    if !visited[i]
      dfs(graph,visited,i,ans)
    end
  end
end

puts ans[:current]