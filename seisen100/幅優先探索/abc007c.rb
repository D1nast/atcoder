def bfs(map,vmap,distance,sR,sC,gR,gC,r,c)
  queue = [[[sR,sC]]]
  count = 0
  while !queue.empty?
    row,col = -1,-1
    newQueue = []
    query = queue.shift
    # puts "query:#{query}"

    query.each do |q|
      row,col = q[0],q[1]
      # puts "q:#{q} row:#{row} col:#{col}"
      # スタート位置の設定
      vmap[row][col] = true if row == sR && col == sC

      # 距離が設定されていなければ入力
      if distance[row][col] == -1
        distance[row][col] = count
      end
      # 上[row-1,col] 下[row+1,col] 左[row,col-1] 右[row,col+1]
      nextGrid = [[row-1,col],[row+1,col],[row,col-1],[row,col+1]]
      # 周囲の未探索マスかつ壁でないマスを探す
      nextGrid.each do |item|
        newRow,newCol = item[0],item[1]
        if newRow >= 0 && newRow < r && newCol >= 0 && newCol < c && vmap[newRow][newCol] == false && map[newRow][newCol] == "."
          vmap[newRow][newCol] = true
          newQueue << [newRow,newCol] 
          # puts "newRow:#{newRow} newCol:#{newCol}"
        end
      end
    end
    queue.push(newQueue) if !newQueue.empty?
    count += 1
  end
  return distance[gR][gC]
end
r,c = gets.split.map(&:to_i)
sR,sC = gets.split.map{|num| num.to_i - 1}
gR,gC = gets.split.map{|num| num.to_i - 1}
map = Array.new(r){ gets.chomp }
vmap = Array.new(r) {Array.new(c,false)}
distance = Array.new(r) {Array.new(c,-1)}
puts bfs(map,vmap,distance,sR,sC,gR,gC,r,c)
# puts "map:#{map.inspect}"
# puts  "vmap:#{vmap.inspect}"
# puts  "distance:#{distance.size}"

# 1,1の上下左右
# 上:[0,1],下:[2,1],左:[1,0],右[1,2]