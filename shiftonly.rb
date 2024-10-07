N=gets.to_i
numbers = gets.chomp.split(" ").map(&:to_i)

def Shiftonly(numbers)
  count = 0
  counts=[]
  numbers.each do |num|
    while num % 2 == 0 do
      num = num/2
      count = count+1
    end
    counts = counts.push(count)
    count = 0
  end
  p counts.min
end

Shiftonly(numbers)

#ex) N=3 An=[10,20,40]
# https://atcoder.jp/contests/abs/tasks/abc081_b