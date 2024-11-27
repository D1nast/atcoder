require 'pqueue'

def dijkstra(graph, start)

  # dist = {} 
  # graph.each do |node,hash|
  #   dist[node] = Float::INFINITY
  #   hash.each {|node| dist[node[0]] = Float::INFINITY}
  # end
  # dist[start] = 0

  # pq = PQueue.new
  # pq.push([start, 0]) 


  # while !pq.empty?
  #   node, d = pq.pop 

  #   next if d > dist[node]

  #   graph[node].each do |nextNode, cost|
  #     new_dist = dist[node] + cost  
  #     if new_dist < dist[nextNode]  
  #       dist[nextNode] = new_dist  
  #       pq.push([nextNode,new_dist]) 
  #     end
  #   end
  # end

  return dist

end


initial = gets.split.map(&:to_i)
graph = Hash.new { |hash,key| hash[key] = {} }
initial[1].times do
  node,root,weight = gets.split.map(&:to_i)
  graph[node][root] = weight
end


result = dijkstra(graph, initial[2])
