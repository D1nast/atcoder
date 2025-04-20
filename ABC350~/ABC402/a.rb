S = gets.chomp.chars
ans = []
(0...S.size).each do |i|
  char = S[i].upcase
  if S[i] ==  char
    ans << S[i]
  end
end

puts ans.join("")