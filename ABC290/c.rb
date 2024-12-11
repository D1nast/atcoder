hash = Hash.new()
n,k = gets.split.map(&:to_i)
a = gets.split.map do |num|
  hash[num.to_i] = num.to_i
end

(0...k).each do |i|
  if !hash[i]
    puts i
    exit
  end
end

puts k
