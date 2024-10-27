S = gets.chomp.chars
T = gets.chomp.chars
X = []

list = Array.new( S.size ) {Array.new( 2 )}
# S個の連想配列を作る。配列の要素は２つ

if S == T
  puts 0
  exit
else
  (0...S.size).each do |i|
    if S[i] > T[i]
       S[i]=T[i]
       X.push(S.join(""))
    elsif S[i]<T[i]
      list[i][0] =  i
      list[i][1] = T[i]
    end
  end
  #O(N)
end

list.reverse_each do |item|
  if item[0] == nil
    next
  else
    S[item[0]] = item[1]
    X.push(S.join(""))
  end
end

puts X.size
X.each do |element|
  puts element
end

#オーダーは３N