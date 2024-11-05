n = gets.to_i
l = Array.new(n)
r = Array.new(n)

n.times do |i|
  l[i], r[i] = gets.split.map(&:to_i)
end

sumL = l.sum
sumR = r.sum

if sumL > 0 || sumR < 0
  puts "No"
  exit
end

puts "Yes"

ans = l.dup
# 足すべき数字を把握
rem = -sumL

# テストケース　
# L[3,-4,-2]
# R[5,1,3]

n.times do |i|
  can_add = r[i] - l[i]
  # 
  if can_add < rem
    ans[i] = r[i]
    rem -= can_add
  else
    ans[i] += rem
    break
  end
end

puts ans.join(' ')
