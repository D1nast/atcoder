N = gets.to_i
A = gets.split.map(&:to_i)
hash = Hash.new(){|hash,key| hash[key]=0}
ans = -1
max = 0
A.each do |i|
  hash[i] += 1
end

hash.each do |h,k|
  max = [ max,h ].max if k == 1
end

A.each_with_index do |i,index|
  if max == i
    puts index+1
    exit
  end
end
puts -1