INF = Float::INFINITY

# グラフの入力
v, e = gets.split.map(&:to_i)
d = Array.new(v) { Array.new(v, INF) }

# グラフの辺の情報を読み込む
e.times do
  s, t, distance = gets.split.map(&:to_i)  # Dをdistanceに変更
  d[s][t] = distance  # distanceという変数を使う
end

# DP配列の初期化
dp = Array.new(1 << v) { Array.new(v, INF) }
dp[0][0] = 0

# ビット全探索による動的計画法
(0...(1 << v)).each do |i|
  (0...v).each do |j|
    (0...v).each do |k|
      if (i & (1 << k)) == 0
        dp[i | (1 << k)][k] = [dp[i | (1 << k)][k], dp[i][j] + d[j][k]].min
      end
    end
  end
end

# 結果を表示
result = dp[(1 << v) - 1][0]
puts result == INF ? -1 : result
