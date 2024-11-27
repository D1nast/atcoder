require 'pqueue'

def dijkstra(graph, start)

  # 初期化
  #dist=最短距離格納,graph.eachで全てのノードをInfinity,探索開始ノードは距離を0
  dist = {} 
  graph.each do |node,hash|
    dist[node] = Float::INFINITY
    hash.each {|node| dist[node[0]] = Float::INFINITY}
  end
  dist[start] = 0

  # 優先度付きキューの作成
  pq = PQueue.new
  pq.push([start, 0])  # (頂点, 距離) をキューに入れる

  # キューが空になるまで処理
  while !pq.empty?
    node, d = pq.pop  # 最小距離の頂点を取り出す
    
    # 現在の距離が既に登録された最短距離より大きい場合はスキップ
    next if d > dist[node]

    # 隣接する頂点を調べる
    graph[node].each do |nextNode, cost|
      new_dist = dist[node] + cost  # 新しい距離
      if new_dist < dist[nextNode]  # 距離が短縮される場合のみ更新
        dist[nextNode] = new_dist  # 最短距離を更新
        pq.push([nextNode,new_dist])  # (頂点, 新しい距離) をキューに追加
      end
    end
  end

  return dist

end


initial = gets.split.map(&:to_i)
graph = Hash.new { |hash,key| hash[key] = {} }
initial[1].times do
  node,root,weight = gets.split.map(&:to_i)
  graph[node][root] = weight
end


result = dijkstra(graph, initial[2])

result.each {|key,value| puts value == Float::INFINITY ?  "INF" :  value } 


# https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=GRL_1_A&lang=ja
# ダイクストラ法の典型問題
# AIZUが pqueueに対応していないのか、Runtime Errorになる　ただし、テストケースは通る
