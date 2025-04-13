n = gets.to_i
s = gets.chomp.chars

hash = Hash.new(0)
count = 0
tmp = ""
ans = 0

s.each.with_index do |str,index|

  tmp = str if index == 0
  
  if tmp == str
    count += 1
    hash[tmp] = [hash[tmp],count].max
  else
    hash[tmp] = [hash[tmp],count].max
    count = 1
  end
  
  tmp = str

end

hash.each { |key,value| ans += value }
puts ans