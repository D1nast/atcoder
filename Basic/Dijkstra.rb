require 'pqueue'

def dijkstra(graph,start)
  
  distance = {} # 辺の重みを格納するハッシュマップ
  # 各ノードに∞を入れる
  graph.keys.each { |node| distance[node] = Float::INFINITY }
  distance[start] = 0 # スタートするノードは重み０

  pq = PQueue.new #優先度付きキューの作成 距離が最小のノードを常に引っ張ってくることができる
  pq.push([0,start])

  visited = {}

  while !pq.empty?
    current_distance , current_node = pq.pop
    
    next if visited[current_node]
    visited[current_node] = true

    graph[current_node].each do |neighbor,weight| # 0 => { 1=>1 , 2=>4 } の { } をeachで順に取り出す
       # 0から隣接ノードに移動する際は絶対にif文はTRUEになる。なぜなら隣接ノードのdistanceはInfinityだから
       # そうでない場合は、現在探索済の最短距離よりもdistance[current_node] + weightが小さい場合に書き換えられる
      if distance[current_node] + weight < distance[neighbor] 
        distance[neighbor] = distance[current_node] + weight
        pq.push([distance[neighbor],neighbor])
      end
    end
  end

  distance

end

# {0=>{1=>1, 2=>4}, 1=>{2=>2, 3=>5}, 2=>{3=>1}}
# 上記のようなデータ構造を取る。[node][root]で 0 => {1=>1,2=>4} にアクセスできる
initial = gets.split.map(&:to_i)
graph = Hash.new { |hash,key| hash[key] = {} }
initial[1].times do
  node,root,weight = gets.split.map(&:to_i)
  graph[node][root] = weight
end


dijkstra(graph,0)

puts graph.inspect


# https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=GRL_1_A&lang=ja
# ダイクストラ法の典型問題
