N = gets.to_i
co = [[0,0]]
cost = []

N.times do
  item = gets.chomp.split.map(&:to_i)
  co << item
end

# puts "coの中身#{co.inspect}"

(0..N).each do |i|
  # puts "i:#{i}"
  if i == N
    cost <<  Math.sqrt((co[i][0])** 2 + (co[i][1])** 2)
    break
  else
    ac = (co[i][0] - co[i+1][0])**2
    bd = (co[i][1] - co[i+1][1])**2
    # puts Math.sqrt(ac+bd)
    cost << Math.sqrt(ac+bd)
  end

end

puts cost.sum




# sqrt((a-c)^2+(b-d)^2)
# コスト = Math.sqrt((co[i][0]-co[i+1][0])**2 + (co[i][1]-co[i+1][1])**2)

# puts Math.sqrt((0-1)**2 + (0-2)**2)
# puts Math.sqrt((1 - -1)**2 + (2-0)**2)
