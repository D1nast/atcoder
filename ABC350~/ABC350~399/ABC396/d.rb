require 'set'

def dfs(start,visited,graph,ans,x,n)
  visited[start] = true
  if start == n-1
    ans.add(x)
    return 
  end
  # puts "visited:#{visited.inspect}"
  graph[start].each do |nTo,nWeight|
    next if visited[nTo]
    dfs(nTo,visited.clone,graph,ans,x^nWeight,n)
  end

end

n,m = gets.split.map(&:to_i)
graph = Array.new(n){[]}
visited = Array.new(n){false}
ans = Set.new()
m.times do
  from , to , weight = gets.split.map(&:to_i)
  from -= 1
  to -= 1
  graph[from] << [to,weight]
  graph[to] << [from,weight]
end

# puts graph.inspect
dfs(0,visited,graph,ans,0,n)

puts ans.min