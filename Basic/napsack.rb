# 基本的な動的計画法のコード

N,W = gets.split.map(&:to_i)

dp  = Array.new( N + 1 ) { Array.new( W + 1 ,0) }

(1..N).each do |i|
 wi,vi = gets.split.map(&:to_i)

 (0..W).each do |current_weight|
  if current_weight - wi >= 0
    
    dp[i][current_weight] = [
      dp[i-1][current_weight],
      dp[i-1][current_weight - wi] + vi
   ].max
   puts dp[i].inspect
  else
    dp[i][current_weight] = dp[i-1][current_weight]
    puts dp[i].inspect
  end

 end

end

puts dp[N][W]

