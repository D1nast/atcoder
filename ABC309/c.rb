n,k = gets.split.map(&:to_i)
medicine = []
sum = 0
n.times do
  medicine << gets.split.map(&:to_i)
  sum += medicine[-1][1]
end
if sum <= k
  puts 1
  exit
end
medicine.sort.each do |item|
  sum -= item[1]
  if sum <= k
    puts item[0]+1
    exit
  end
end
