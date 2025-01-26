require 'set'
S = gets.chomp
T = gets.chomp
S1 = []
S2 = []
T1 = []
T2 = []
set = Set.new(["a","t","c","o","d","e","r"])
count = 0
dif = 0
(0...S.size).each do |i|
  # atcoder以外の文字を追加
  if set.include?(S[i]) || S[i] == "@"
    S1 << S[i]
  else
    S2 << S[i]
  end
  if set.include?(T[i]) || T[i] == "@"
    T1 << T[i]
  else
    T2 << T[i]
  end
end

S1.sort!
S2.sort!
T1.sort!
T2.sort!
# puts "S1:#{S1.inspect} S2:#{S2.inspect}"
# puts "T1:#{T1.inspect} T2:#{T2.inspect}"

if S2.size != T2.size
  puts "No"
  exit
else
  (0...S2.size).each do |i|
    if S2[i] != T2[i]
      puts "No"
      exit
    end
  end
  (0...S1.size).each do |i|
    if S1[i] == "@" || T1[i] == "@"
      count += 1
    elsif S1[i] != T1[i]
      dif += 1
    end 
  end

  if dif > count
    puts "No"
    exit
  end
end
puts "Yes"
# @ c c o
# @ a c e
