S=gets.chomp.to_s
if S.slice(-3..-1) == "san"
  puts "Yes"
else
  puts "No"
end