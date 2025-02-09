n,t = gets.split.map(&:to_i)
query = []
player = Array.new(n){0}
hash = { 0 => n }
hash.default = 0

(0...t).each { |i| query << gets.split.map(&:to_i) }
query.each do |a,b|
  hash[player[a-1]] -= 1
  hash.delete(player[a-1]) if hash[player[a-1]] == 0
  player[a-1] += b
  hash[player[a-1]] += 1
  puts hash.size
end
