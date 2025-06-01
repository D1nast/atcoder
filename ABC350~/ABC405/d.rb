require 'thread'
h,w = gets.split.map(&:to_i)
grid = []
h.times { grid << gets.chomp }

dist = Array.new(h) { Array.new(w, nil) }
queue = Queue.new

# 非常口を起点に距離0でセットし、キューに入れる
(0...h).each do |i|
  (0...w).each do |j|
    if grid[i][j] == "E"
      dist[i][j] = 0
      queue << [i,j]
    elsif grid[i][j] == "#"
      dist[i][j] = -1  # 壁は-1にする
    end
  end
end

dirs = [[-1,0], [1,0], [0,-1], [0,1]]

while !queue.empty?
  i,j = queue.pop
  dirs.each do |di,dj|
    ni, nj = i+di, j+dj
    next if ni < 0 || ni >= h || nj < 0 || nj >= w
    next if dist[ni][nj] || dist[ni][nj] == 0
    next if grid[ni][nj] == "#"
    dist[ni][nj] = dist[i][j] + 1
    queue << [ni,nj]
  end
end

# 矢印をセットするための配列
ans = Array.new(h) { Array.new(w, "#") }

(0...h).each do |i|
  (0...w).each do |j|
    if grid[i][j] == "#"
      ans[i][j] = "#"
    elsif grid[i][j] == "E"
      ans[i][j] = "E"
    else
      # 最短距離が1つ小さい隣接マスを探す（そこへ向かう矢印を書く）
      dirs.each do |di,dj|
        ni, nj = i+di, j+dj
        next if ni < 0 || ni >= h || nj < 0 || nj >= w
        if dist[ni][nj] && dist[ni][nj] == dist[i][j] - 1
          # i,jからni,njに行く矢印をセット
          if di == -1 && dj == 0
            ans[i][j] = "^"  # 上に行く矢印
          elsif di == 1 && dj == 0
            ans[i][j] = "v"  # 下に行く矢印
          elsif di == 0 && dj == -1
            ans[i][j] = "<"  # 左に行く矢印
          elsif di == 0 && dj == 1
            ans[i][j] = ">"  # 右に行く矢印
          end
          break
        end
      end
    end
  end
end

ans.each { |row| puts row.join }
