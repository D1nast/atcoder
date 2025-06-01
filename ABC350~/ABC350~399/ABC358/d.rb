n,m = gets.split.map(&:to_i)
a = gets.split.map(&:to_i).sort
b = gets.split.map(&:to_i).sort
sum = 0
left = 0
last = -1

m.times do |i|
  if b[last] > a[last]
    puts -1
    exit
  end
  last -= 1
end


(0...m).each do |mi|
  (left...n).each do |ni|
    if b[mi] <= a[ni]
      sum += a[ni]
      left = ni+1
      break
    end
  end
end


puts sum
