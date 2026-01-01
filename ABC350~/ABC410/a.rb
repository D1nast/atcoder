n= gets.to_i
a = gets.split.map(&:to_i)
k=gets.to_i
ans = 0

a.each do |u|
  if u >=k
    ans +=1
  end
end

puts ans