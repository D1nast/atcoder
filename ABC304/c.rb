def dfs(infected,start,people,d,i,n)

  (0...n).each do |j|
    next if i == j
    euclid = (start[0] - people[j][0])**2 + (start[1] - people[j][1])**2

    if Math.sqrt(euclid) <= d && infected[j] == false
      infected[j] = true
      dfs(infected,people[j],people,d,i,n)
    end
  end

end

n,d = gets.split.map(&:to_i)
people = []
infected = Array.new(n){false}
infected[0] = true

n.times do
  people << gets.split.map(&:to_i)
end

(0...n).each do |i|
  start = people[i]
  dfs(infected,start,people,d,i,n) if infected[i] == true
end

infected.each do |i|
  if i == true
    puts "Yes"
  else
    puts "No"
  end
end

# 深さ優先探索