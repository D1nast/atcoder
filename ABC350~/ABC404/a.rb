list = ('a'..'z').to_a
s = gets.chomp.chars

s.each do |str|
  check = list.index(str)
  list.delete_at(check) if !check.nil?
end

puts list[0]
