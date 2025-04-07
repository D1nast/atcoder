require 'thread'
def bfs(map,nextNode,start,goal,move,h,w,ans,ind)
  # puts "nextNode:#{nextNode.inspect}"
  queue = Queue.new()
  count = 1
  visited = Array.new(h){Array.new(w){false}}
  visited[start[0]][start[1]] = true
  queue.push([[nextNode[0],nextNode[1]]])
  vector = move

  while !queue.empty?
    # 初期位置の隣のマスからスタート。まずはそのマスを訪問済に
    array = queue.pop
    # puts "array:#{array.inspect} vector:#{vector}"
    nextArr = []
    # puts "隣接ノードの訪問開始"
    array.each do |element|
      # puts "arr:#{element}"
      nextV,nextH = element[0],element[1]
      visited[nextV][nextH] = true
      if map[nextV][nextH] == "G"
        ans[ind] = count 
        break
      end
      # moveが0の時、次の移動は上下　1の時は次の移動は左右
      if vector == 1
        [ [0,-1],[0,1] ].each do |e|
          # puts "e0:#{e[0]} e1:#{e[1]}"
          nextArr << [nextV,nextH+e[1]] if nextH+e[1] >= 0 && nextH+e[1] <= w-1 && map[nextV][nextH+e[1]] != "#" &&
            visited[nextV][nextH+e[1]] != true
        end
      else
        [ [-1,0],[1,0] ].each do |e|
          # puts "e[0]:#{e[0]} e[1]:#{e[1]}"
          nextArr << [nextV+e[0],nextH] if nextV+e[0] >= 0 && nextV+e[0] <= h-1 && map[nextV+e[0]][nextH] != "#" &&
            visited[nextV+e[0]][nextH] != true
        end
      end
    end
    if vector == 1
      vector = 0
    else
      vector = 1
    end
    count += 1
    break if ans[ind] != Float::INFINITY
    # puts "count:#{count}の訪問完了 nextArr:#{nextArr.inspect}"
    queue.push(nextArr) if !nextArr.empty?
  end
end

h,w = gets.split.map(&:to_i)
map = []
start,goal = [1001,1001],[1001,1001]
ans = Array.new(4){Float::INFINITY}
h.times do
  map << gets.chomp
end
# スタートとゴール位置把握
(0...h).each do |i|
  (0...w).each do |j|
    start[0],start[1] = i,j if map[i][j] == "S"
    goal[0],goal[1] = i,j if map[i][j] == "G"
  end
end

# puts "start:#{start.inspect} goal:#{goal.inspect}"
# [ 左右,上下 ]
# moveが0の時、次の移動は上下　1の時は次の移動は左右
[ [0,-1],[0,1],[-1,0],[1,0]].each_with_index do |e,index|
  vertical , horizontal = start[0] , start[1]
  vertical += e[0] if (start[0] + e[0]) >= 0 && (start[0] + e[0] <= h-1)
  horizontal += e[1] if (start[1] + e[1]) >= 0 && (start[1] + e[1] <= w-1)
  # puts "map:#{map[vertical][horizontal]}"
  if map[vertical][horizontal] != "#" && (start[0] != vertical || start[1] != horizontal)
    bfs(map,[vertical,horizontal],start,goal,0,h,w,ans,index) if index <= 1  
    bfs(map,[vertical,horizontal],start,goal,1,h,w,ans,index) if index >= 2
  end
end

ans.sort!
# puts ans.inspect
if ans[0] == Float::INFINITY
  puts -1
else
  puts ans[0]
end


