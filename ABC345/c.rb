S = gets.chomp.chars
pair = ((S.size-1)**2 + S.size-1 ) /2
hash = Hash.new(0)
duplication = 0

if S.length == 2
  puts 1
  exit
end

S.each do |char|
  hash[char] += 1
end

hash.each do |key,value|
  # puts (((value-1)**2 + value-1) / 2) 
   duplication += (((value-1)**2 + value-1) / 2) 
end
if duplication == 0
  puts pair 
else
  puts pair - duplication+1
end
