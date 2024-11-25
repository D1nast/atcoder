n = gets.to_i
s = gets.chomp

first = ((n + 1)/2) -2
mid = (n+1)/2-1
last = (n + 1) /2

if n.even?
  puts "No"
  exit
else
  (0..first).each do |i|
    if s[i] != "1"
      puts "No"
      exit
    end
  end
  if s[mid] != "/"
    puts "No"
    exit
  end
  (last..n).each do |i|
    if s[i] != "2"
      puts "No"
      exit
    end
  end  
end


puts "Yes"

