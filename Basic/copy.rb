def dfs(graph,v,visited,timestamp,time)

  time[:current] += 1
  timestamp[v][:start] = time[:current]
  visited[v] = true

  graph[v].each do |neighbor|
    dfs(graph,neighbor,visited,timestamp,time) unless visited[neighbor]  
  end

  time[:current] += 1
  timestamp[v][:end] = time[:current]

end


n = gets.to_i

graph = Hash.new{0}
visited = {}
timestamp = Hash.new { |hash,key| hash[key] = {start:nil,end:nil } }  
time = { current:0 }

n.times do
  v = gets.split.map(&:to_i)
  list = []
  (2...(v.size)).each do |i|
    if i >= 2
      list << v[i]
    end
  end
    graph[v[0]] = list
end

# puts graph.inspect
dfs(graph,1,visited,timestamp,time)

puts "output"
puts timestamp.inspect
timestamp.sort.each do |key,time|
  puts "#{key} #{time[:start]} #{time[:end]}"
end

# https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ALDS1_11_B&lang=ja
# ↑問題