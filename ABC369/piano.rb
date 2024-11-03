n = gets.to_i
l = 0
r = 0
tired = 0
(0...n).each do |i|

  piano = gets.split
  piano[0] = piano[0].to_i
 
  if piano[1] == "L"
    tired += (l - piano[0]).abs if l != 0
    l = piano[0]
  else
    tired += (r - piano[0]).abs if r != 0
    r = piano[0]
  end
end

puts tired