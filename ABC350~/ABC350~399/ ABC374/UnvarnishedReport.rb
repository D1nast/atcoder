S = gets.chomp.split("").map(&:to_s)
T = gets.chomp.split("").map(&:to_s)

# puts "#{S}#{T}"
count = 0
(0...[S,T].max.size).each do |i|

  if S[i] == nil || T[i] == nil
    puts i+1
    exit
  end

  if S[i] != T[i]
    puts i+1
    exit
  end
end

puts 0 if count == 0



