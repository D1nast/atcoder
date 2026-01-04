n = gets.to_i
if n == 1
  puts "Yes"
  exit
end


digits = []
ans = 0
while n > 0
  digits << n % 10
  n /= 10
  # puts n
end


while digits.size != 1
  ans = 0
  (0...digits.size).each do |i|
    shift = digits[i]
    ans += shift**2
  end
  
  if ans !=1
    digits=[]
    while ans > 0
      digits << ans % 10
      ans /= 10
    end
    # puts digits.inspect
  else
    puts "Yes"
    exit
  end 

end

puts "No"
