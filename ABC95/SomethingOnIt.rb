input = gets.chomp.split("")
# puts input.inspect
i = 0 
count = 0
while i < input.size do
  if input[i] == "o"
    count += 1
  end
  i += 1
end

puts 700 + count*100