def dfs(graph, v, visited, timestamp, time)
  # ノードvを訪問
  time[:current] += 1
  timestamp[v][:start] = time[:current]
  visited[v] = true

  # 隣接ノードを訪問
  graph[v].sort.each do |neighbor|  # 隣接ノードをソートして訪問順を調整
    dfs(graph, neighbor, visited, timestamp, time) unless visited[neighbor]
  end

  # ノードvの訪問が終了
  time[:current] += 1
  timestamp[v][:end] = time[:current]

end

n = gets.to_i

graph = Hash.new { [] }  # 空の配列をデフォルトとして使用
visited = {}  # 各ノードの訪問状態
timestamp = Hash.new { |hash, key| hash[key] = {start: nil, end: nil} }
time = { current: 0 }

# グラフの読み込み
n.times do
  v = gets.split.map(&:to_i)
  node = v[0]
  neighbors = v[2..-1]  # 2番目の要素以降が隣接ノード
  graph[node] = neighbors
end

# puts graph.inspect
# すべてのノードに対して訪問済み状態を初期化
(1..n).each { |i| visited[i] = false }

# すべてのノードについてDFSを開始
(1..n).each do |i|
  dfs(graph, i, visited, timestamp, time) unless visited[i]
end

# 出力
timestamp.sort.each do |key, time|
  puts "#{key} #{time[:start]} #{time[:end]}"
end

# https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ALDS1_11_B&lang=ja
# ↑問題
# 深さ優先探索の典型問題。行けるところまで行って戻ってくる