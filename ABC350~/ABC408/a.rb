n,s = gets.split.map(&:to_i)
t = gets.split.map(&:to_i)
current = 0

(0...n).each do |i|
  if !(t[i] - current <= s)
    puts "No"
    exit
  end
  current = t[i]
end

puts "Yes"