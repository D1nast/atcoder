# 文字列の出現回数をマップで管理

n = gets.to_i
hash = Hash.new

n.times do
  data = gets.chomp
  if !hash[data]
    if !hash[data.reverse]
      hash[data] = 1
    else
      hash[data.reverse] = 1      
    end
  end
end


puts hash.size