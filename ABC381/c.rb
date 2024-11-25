n = gets.to_i
s = gets.chomp.chars
rle = []
str = []
ans = 1
count = 1

(1...n).each do |i|
  if s[i-1] == s[i]
    count += 1
  else  
    rle << count
    str << s[i-1]
    count = 1
  end
end

rle << count
str << s[n-1]

# puts "n:#{n}"
# puts rle.inspect
# puts str.inspect

(0...rle.size).each do |i|
  # 文字の並びが1/2であること、真ん中のスラッシュが１であること
  if (str[i] == "1" && str[i+1] == "/" && str[i+2] == "2") && rle[i+1] == 1
    max = [rle[i],rle[i+2]].max
    (max - (rle[i]-rle[i+2]).abs)
    ans = [ans, (max - (rle[i]-rle[i+2]).abs) * 2 + 1 ].max
  end
end

puts ans