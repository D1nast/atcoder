d = gets.to_i
ans = Float::INFINITY

x1 = Math.sqrt(d).floor
y1 = Math.sqrt(d-x1**2).floor
ans = [ ans,d-x1**2-y1**2].min
puts "x1:#{x1} y1:#{y1}"
puts ans
puts d%4