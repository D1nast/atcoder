h, w, k = gets.split.map(&:to_i)
s = Array.new(H) { gets.chomp }
ans = 0
visited = Array.new(H) { Array.new(W, false) }
puts visited.inspect

# k 回移動してマス (i, j) にいる状態から探索を開始する
def rec(i, j, k, h, w, k_max, s, visited, ans)
  if k == k_max
    # K 回移動することができたら，答えに 1 を足して探索を終了
    ans += 1
    return ans
  end
  # (i, j) を訪問済として記録する
  visited[i][j] = true
  # 隣接する 4 マスへの移動を試す
  directions = [[1, 0], [0, 1], [-1, 0], [0, -1]]
  directions.each do |di, dj|
    ni, nj = i + di, j + dj
    # 移動先がマス目の中にあり，空きマスであり，まだ訪れていないならば，そこへ移動し再帰的に探索する
    if ni >= 0 && ni < h && nj >= 0 && nj < w && s[ni][nj] == "." && !visited[ni][nj]
      ans = rec(ni, nj, k + 1, h, w, k_max, s, visited, ans)
    end
  end
  # (i, j) を訪れなかったことにする
  visited[i][j] = false
  return ans
end

# (i0, j0) をすべて試す
for i in 0...h
  for j in 0...w
    if s[i][j] == "."
      ans = rec(i, j, 0, h, w, k, s, visited, ans)
    end
  end
end

puts ans
