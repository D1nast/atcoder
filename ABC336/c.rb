n = gets.to_i - 1
list = []
ans = ""
while n != 0 
  list << (n % 5).to_s
  n /= 5
end
puts list.inspect
list.reverse_each {|a| ans = ans + a }
ans = ans.to_i
puts ans*2