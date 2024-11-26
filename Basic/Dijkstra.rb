require 'pqueue'

def dijkstra(graph,start)
  
  distance = {} # 辺の重みを格納するハッシュマップ
  # 各ノードに∞を入れる
  graph.each do |key,hash|
    # 全てのキーをInfinityに
    distance[key] = Float::INFINITY
    # KeyにはないノードをInfinityに
    hash.each { |value| distance[value[0]] = Float::INFINITY }
  end

  distance[start] = 0 # スタートするノードは重み０  

  puts "初期値 distance:#{distance.inspect}"
  puts "グラフ #{graph.inspect}"

  pq = PQueue.new #優先度付きキューの作成 距離が最小のノードを常に引っ張ってくることができる
  pq.push([0,start]) #引数には[距離,探索開始ノード]

  visited = {}

  while !pq.empty?
    current_distance , current_node = pq.pop
    puts "探索ノード #{current_node} 距離 #{current_distance}"
    next if visited[current_node]
    visited[current_node] = true

    graph[current_node].each do |neighbor,weight| # 0 => { 1=>1 , 2=>4 } の { } をeachで順に取り出す
       # 0から隣接ノードに移動する際は絶対にif文はTRUEになる。なぜなら隣接ノードのdistanceはInfinityだから
       # そうでない場合は、現在探索済の最短距離よりもdistance[current_node] + weightが小さい場合に書き換えられる
      # puts "隣接ノード #{neighbor} 重み #{weight}"
      # puts "現在のノードの距離#{distance[current_node]} 隣接ノードの距離#{distance[neighbor]}"
      # puts "distance[current_node] + weight #{distance[current_node] + weight} distance[neighbor] #{distance[neighbor] }}"
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


result = dijkstra(graph,0)

puts result.inspect


# https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=GRL_1_A&lang=ja
# ダイクストラ法の典型問題
