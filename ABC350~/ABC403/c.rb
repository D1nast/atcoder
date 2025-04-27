require 'set'
n,m,q = gets.split.map(&:to_i)
user = Array.new(n){Set.new}
allU = Array.new(n){false} 
q.times do
  query = gets.split.map(&:to_i)
  if query[0] == 1
    user[query[1]-1].add(query[2])
  elsif query[0] == 2
    allU[query[1]-1] = true
  else
    if allU[query[1]-1] || user[query[1]-1].include?(query[2])
      puts "Yes"
    else
      puts "No"
    end
  end
end
# puts user.inspect