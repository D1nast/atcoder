def knapsack(weights, values, capacity)
  n = weights.length
  dp = Array.new(n + 1) { Array.new(capacity + 1, 0) }  # DPテーブルの初期化
  puts "#{weights.inspect} #{values.inspect} #{capacity.inspect} #{dp.inspect}"


  # DPテーブルの計算　1..4 
  (1..n).each do |i|
    (0..capacity).each do |w| #0..5まで w = 0
      if weights[i - 1] <= w
        # 物品iを選ぶ場合と選ばない場合の最大価値を比較
        dp[i][w] = [dp[i - 1][w], dp[i - 1][w - weights[i - 1]] + values[i - 1]].max
      else
        # 物品iを選べない場合
        dp[i][w] = dp[i - 1][w]
      end
    end
  end

  dp[n][capacity]  # 最大価値を返す
end

# 使用例
weights = [2, 3, 4, 5]  # 物品の重量
values = [3, 4, 5, 6]   # 物品の価値
capacity = 5            # ナップサックの最大重量

max_value = knapsack(weights, values, capacity)
puts "最大価値: #{max_value}"  # 出力: 最大価値: 7
