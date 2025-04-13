N = gets.to_i
query = []
count = 0
logg = false
N.times do
  query << gets.chomp
end

query.each do |i|
  if i == "login"
    logg = true
  elsif i == "logout"
    logg = false
  end

  count += 1 if !logg && i == "private" 

end

puts count