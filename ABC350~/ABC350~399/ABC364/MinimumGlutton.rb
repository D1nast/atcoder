n,x,y = gets.split.map(&:to_i)
a = gets.split.map(&:to_i).sort.reverse!
b = gets.split.map(&:to_i).sort.reverse!

countX = 0
countY = 0
ans =[0,0]

i = 0
if a.sum <= x
  ans[0] = a.size
else
  while x >= countX do
    countX += a[i]
    ans[0] = i+1
    i += 1
  end
end

i = 0
if b.sum <= y
  ans[1] = b.size
else
  while y >= countY do
    countY += b[i]
    ans[1] = i+1
    i += 1
  end  
end

puts [ans[0],ans[1]].min
