n,m = gets.split.map(&:to_i)
s = gets.chomp.split("").map(&:to_i)

countN = 0
count2 = 0

maxN = 0
max2 = 0

s.each do |number|

  if number == 0
    maxN = [countN,maxN].max
    max2 = [count2,max2].max
    countN = 0
    count2 = 0
    next
  end

  countN += 1 if number == 1 || number == 2
  count2 += 1 if number == 2
end

maxN = [countN,maxN].max
max2 = [count2,max2].max

if maxN - m < max2
  puts maxN - m + max2 - (maxN - m)
else
  puts maxN - m
end


# puts maxN
# puts max2