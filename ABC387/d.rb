require 'thread'

def bfs(map,start,goal,move,h,w,ans,ind)
  queue = Queue.new()
  visited = Array.new(h){Array.new(w){false}}
  count = 1
  startV,startH = start[0],start[1]
  visited[startV][startH] = true
  queue.push([startV,startH])

  while !queue.empty?
    array = queue.pop
    nextArray = []
    count += 1
    puts array.inspect
    array.each do |element|
      nextV,nextH = element[0],element[1]
      puts "nextV:#{nextV} nextH:#{nextH}"
      if !visited[nextV][nextH] && map[nextV][nextH] != "#"
        visited[nextV][nextH] = true
        # moveが0の時、次の移動は上下　1の時は次の移動は左右
        if move == 0
          [ [0,1],[0,-1] ].each_with_index do |e,index|     
            vertical , horizontal = start[0] , start[1]
            vertical += e[0] if (start[0] + e[0]) >= 0 && (start[0] + e[0] <= h-1)
            horizontal   += e[1] if (start[1] + e[1]) >= 0 && (start[1] + e[1] <= w-1)
            nextArray << [vertical,horizontal] if !visited[vertical][horizontal] && map[vertical][horizontal] != "#"
          end
          move = 1
        else
          [ [1,0],[-1,0] ].each_with_index do |e,index|
            vertical , horizontal = start[0] , start[1]
            vertical += e[0] if (start[0] + e[0]) >= 0 && (start[0] + e[0] <= h-1)
            horizontal   += e[1] if (start[1] + e[1]) >= 0 && (start[1] + e[1] <= w-1)
            nextArray << [vertical,horizontal] if !visited[vertical][horizontal] && map[vertical][horizontal] != "#"
          end
          move = 0
        end
      end
      ans[ind] = count if map[nextV][nextH] == "G"
      puts nextArray.inspect
    end
    break if ans[ind] != Float::INFINITY
    queue.push(nextArray) if !nextArray.empty?
  end
  puts "visited:#{visited.inspect}"
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
# [ 左右,上下 ]
# moveが0の時、次の移動は上下　1の時は次の移動は左右
[ [0,-1],[0,1],[-1,0],[1,0]].each_with_index do |e,index|
  vertical , horizontal = start[0] , start[1]
  vertical += e[0] if (start[0] + e[0]) >= 0 && (start[0] + e[0] <= h-1)
  horizontal += e[1] if (start[1] + e[1]) >= 0 && (start[1] + e[1] <= w-1)
  if map[vertical][horizontal] != "#"
    bfs(map,[vertical,horizontal],goal,0,h,w,ans,index) if index <= 1  
    bfs(map,[vertical,horizontal],goal,1,h,w,ans,index) if index >= 2
  end
end

puts ans.inspect
puts -1
puts map.inspect


