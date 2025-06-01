def dfs(map,visited,row,col,h,w,k,count,ans)
  visited[row][col] = true
  udlf = [[row-1,col],[row+1,col],[row,col-1],[row,col+1]]
  count[:k]+=1
  if count[:k] <= k
  udlf.each do |r,c|
    if r >= 0 && r < h && c >= 0 && c < w && !visited[r][c] && map[r][c] == "."
      newRow,newCol = r,c
      puts "newRow:#{newRow} newCol:#{newCol} count#{count} visited:#{visited.inspect}"
      dfs(map,visited,newRow,newCol,h,w,k,count,ans)
    end
  end
  end
  ans[:count] += 1 if count[:k] > k
  count[:k] -= 1
end
# 3回ループが回る

h,w,k = gets.split.map(&:to_i)
map = Array.new(h) {gets.chomp}
# 3次元配列
visited = Array.new(h*w){ Array.new(h) { Array.new(w) {false} } }
times = 0
ans = {count:0}
count = {k:0}

(0...h).each do |i|
  (0...w).each do |j|
    row,col = i,j
    if map[row][col] == "." && times < h*w && !visited[times][row][col]
      puts "dfs start times:#{times}"
      dfs(map,visited[times],row,col,h,w,k,count,ans)
      puts "dfs finish count:#{count} ans#{ans} visited[times]:#{visited[times].inspect}"
    end
    times += 1
  end  
end
# puts "map:#{map.inspect}"
# puts "ans:#{ans.inspect}"
puts ans[:count]