require 'thread'

h,w,d = gets.split.map(&:to_i)
visited = Array.new(h) {Array.new(w){false}}
moisted = Array.new(h) {Array.new(w){false}}
map = []
queue = Queue.new()
ans = 0
h.times do
  map << gets.chomp
end

(0...h).each do |i|
  (0...w).each do |j|
    if map[i][j] == "H"
      moisted[i][j] = true
      visited[i][j] = true
      queue.push([i,j,0]) 
    end
  end
end

while !queue.empty?

  element = queue.pop

  [ [1,0],[-1,0],[0,1],[0,-1] ].each do |ny,nx|
    y,x,nd = element[0]+ny , element[1]+nx , element[2]+1
    if y >= 0 && y < h && x >= 0 && x < w && !visited[y][x] && nd <= d
      visited[y][x] = true
      if map[y][x] == "."
        moisted[y][x] = true
        queue.push([ y,x,nd ])
      end
    end
  end

end

moisted.each do |array|
  (0...w).each do |i|
    ans += 1 if array[i]
  end
end
puts ans
