q = gets.to_i
map = Hash.new(0)
ans = []
q.times do
  query = gets.split.map(&:to_i)
  case query[0]
  when 1
    map[query[1]] +=1
  when 2
    map[query[1]] -= 1 
    map.delete(query[1]) if map[query[1]] == 0
  when 3
    ans << map.size
  end
end

puts ans
