require 'pqueue'

def dijkstra(graph,start)
  
  distance = {} # 辺の重みを格納するハッシュマップ
  # 各ノードに∞を入れる
  graph.keys.each { |node| distance[node] = Float::INFINITY }
  distance[start] = 0 # スタートするノードは重み０

  pq = PQueue.new #優先度付きキューの作成
  pq.push([0,start])



end




# https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=GRL_1_A&lang=ja
# ダイクストラ法の典型問題