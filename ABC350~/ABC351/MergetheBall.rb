n = gets.to_i
a = gets.split.map(&:to_i)
ball = []

a.each do |num|
  ball << num
  while ball[-2] == ball[-1] && ball.size >= 2
    ball.pop
    ball[-1] += 1
  end
end

puts ball.size


# n = gets.to_i
# a = gets.split.map {|num| 2 ** num.to_i }
# ball = []
# a.each do |num|
#    ball << num
#    while ball[-2] == ball[-1] && ball.size >= 2
#      ball[-2] += ball[-1]
#      ball.pop
#    end
#    puts ball.inspect
# end

# puts ball.size