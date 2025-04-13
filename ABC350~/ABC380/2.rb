s = gets.chomp.split("")
count = 0
ans = []
s.each_with_index do |str,index|

  if str == "|" && index != 0
    ans << count
    count = 0
  end

  count += 1  if str == "-"

end

puts ans.join(" ")