n,q = gets.split.map(&:to_i)
query = []
pigeon = Array.new(n)
(0...n).each {|i| pigeon[i] = i }
nest = Array.new(n){1}
q.times do 
  query << gets.split.map(&:to_i)
end

query.each do |direction|
  if direction[0] == 2
    puts 
  else

  end
end



# puts pigeon.inspect