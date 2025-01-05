require 'set'
n = gets.to_i
q = gets.to_i
query = []
box = Array.new(n+1){[]}
ans3 = Hash.new { |hash,key| hash[key]= Set.new()}
q.times do
  query << gets.split.map(&:to_i)
end
# puts "以下クエリ"
query.each do |que|
  if que[0] == 1
    box[que[2]] << que[1]
    ans3[que[1]] << que[2] # query3用の答え
  elsif que[0] == 2
    puts box[que[1]].sort.join(" ")
  else
    puts ans3[que[1]].sort.join(" ")
  end
end

# puts box.inspect
# puts query.inspect