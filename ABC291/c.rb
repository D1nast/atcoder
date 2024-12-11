n = gets.to_i
s = gets.chomp.chars

hash = Hash.new(0)
hash["0,0"] += 1
coordinate = [0,0]

s.each do |str|

  case str

  when "R" then
    coordinate[0] += 1
  when "L" then
    coordinate[0] -= 1
  when "U" then
    coordinate[1] += 1
  when "D" then
    coordinate[1] -= 1
  end

  key = coordinate.join(",")
  hash[key] += 1

end

hash.each do |key,value|
  if value > 1
    puts "Yes"
    exit
  end
end

puts "No"


# ハッシュのキーを配列にすると予期しない動作が生じる
# 