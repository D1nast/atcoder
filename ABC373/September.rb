count = 0
i = 0

while i < 12 do
  S = gets.chomp.split("")
  count += 1 if S.length == i+1
  i += 1
end

puts count