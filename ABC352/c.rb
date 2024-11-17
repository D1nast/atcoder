n = gets.to_i
max = 0
a = []
b = []
index = 0

# i : 0~n-1回
n.times do |i|
  ai,bi = gets.split.map(&:to_i)
  a << ai
  b << bi
  max = [max,(ai-bi).abs].max
  if (ai-bi).abs == max
    index = i
  end
end

# puts a.inspect
# puts index

a.delete_at(index)

puts a.sum + b[index]

