require 'thread'

n, m = gets.split.map(&:to_i)
graph = Array.new(n){0}
visited = Array.new(n){false} 
edges = Array.new(n) {[]}       
queue = Queue.new

m.times do
  input = gets.split.map(&:to_i)
  input[0] -= 1
  input[1] -= 1
  edges[input[0]] << input[1]
  edges[input[1]] << input[0]
  graph[input[0]] += 1
  graph[input[1]] += 1
end

if m != n
  puts "No"
  exit
end

visited[0] = true
queue.push(0)

while !queue.empty?
  v = queue.pop
  edges[v].each do |nv|
    next if visited[nv]
    visited[nv] = true
    queue.push(nv)
  end
end

if visited.all? && graph.all? { |deg| deg == 2 }
  puts "Yes"
else
  puts "No"
end
