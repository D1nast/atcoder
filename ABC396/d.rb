require 'pqueue'

def dijkstra(graph,start,finish)
  # 以下訪問ノード作成
  dist = {}
  graph.each do |node,hash|
    # puts "node:#{node} hash:#{hash}"
    # 全訪問予定ノードを作成する
    dist[node] = Float::INFINITY
    # 次の訪問先がないノードもカバーする
    hash.each {|node| dist[node[0]] = Float::INFINITY}
  end
  # puts "dist:#{dist.inspect}"
  dist[start] = 0

  # 以下ダイクストラのアルゴリズム実行
  pq = PQueue.new
  pq.push([start, 0])  # (頂点, 距離) をキューに入れる
  
  while !pq.empty?
    node, weight = pq.pop  # 最小距離の頂点を取り出す
    # puts "PQ処理 node:#{node} weight:#{weight}"
    # 現在の距離が既に登録された最短距離より大きい場合はスキップ
    next if weight > dist[node]

    # 隣接する頂点を調べる　
    graph[node].each do |nextNode, nextWeight|
      # puts "nextNode:#{nextNode} nextWeight:#{nextWeight}"
      nodeBinary = (dist[node]).to_s(2)
      nextBinary = nextWeight.to_s(2)
      len = [nodeBinary.size , nextBinary.size].max
      if nodeBinary.size > nextBinary.size
        nextBinary.prepend("0"*(len-nextBinary.size))
      elsif nextBinary.size > nodeBinary.size
        nodeBinary.prepend("0"*(len-nodeBinary.size))
      end
      nextW = ""
      nextwSize = [ nodeBinary.size,nextBinary.size ].max - 1
      sum = 0
      (0...nodeBinary.size).each do |i|
        # puts "nodeB:#{nodeBinary} nextB:#{nextBinary}"
        if (nodeBinary[i] == "1" && nextBinary[i] == "1") || (nodeBinary[i] == "0" && nextBinary[i] == "0")
          nextW += "0"
        else
          nextW += "1"
        end
      end
      # puts "nextW:#{nextW}"
      (0...nextW.size).each do |i|
        # puts "2 ** nextwSize#{2**nextwSize}"
        sum += 2**nextwSize if nextW[i] == "1"
        nextwSize -= 1
      end
      # puts "sum:#{sum}"
      # new_dist = dist[node] + nextWeight
      new_dist = sum
      # 距離が短縮される場合のみ更新
      if new_dist < dist[nextNode]  
        dist[nextNode] = new_dist 
        pq.push([nextNode,new_dist]) # 優先度付きキューを２回目以降入れる時は(new_dist,nextNode)の方が自然かも
      end
    end
  end
  return dist[finish]
end

n,m = gets.split.map(&:to_i)
graph = Hash.new(){ |hash,key| hash[key]={} }
m.times do
  from , to , weight = gets.split.map(&:to_i)
  graph[from][to] = weight
end

result = dijkstra(graph,1,n)
# puts "graph.inspect:#{graph.inspect}"

puts result



# https://www.youtube.com/watch?v=X1AsMlJdiok