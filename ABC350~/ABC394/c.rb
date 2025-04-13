s = gets.chomp

(1...s.size).reverse_each do |i|
  if s[i] =="A" && s[i-1] == "W"
    s[i] = "C"
    s[i-1] = "A"
  end
end

puts s