n = gets.to_i
sum = 0
arr = []
arr << n


while !arr.empty?
  number = arr.pop
  sum += number
  arr <<  (number.to_f / 2).floor if ( number.to_f / 2).floor != 1
  arr <<  (number.to_f / 2).ceil if ( number.to_f / 2).ceil != 1
end


puts sum


