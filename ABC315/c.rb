n = gets.to_i
ice = []
sameTaste = 0
diffTaste = 0
max = 0
flavor = 0

n.times do
  input = gets.split.map(&:to_i)
  ice << [-(input[1]),input[0]]
end
ice.sort!
sameTaste,diffTaste = ice[0][0],ice[0][0]
if ice[0][1] != ice[1][1]
  diffTaste += ice[1][0]
  puts diffTaste.abs
  exit
else
  sameTaste += ice[1][0]/2
  max = sameTaste.abs
  flavor = ice[1][1]
end

(2...n).each do |i|
  if ice[i][1] != flavor
    diffTaste += ice[i][0]
    break
  end
end

puts [max,diffTaste.abs].max
# puts ice.inspect