n,t = gets.split.map(&:to_i)
s = gets.split("").map(&:to_i)
x = gets.split.map(&:to_i)

count = 0

n.times do |i|

  if s[i] == 1
    x[i] = x[i] + t*2
    search = x.bsearch_index { |num| num > x[i]}

    if search
      ((i+1)...search).each do |j|
        count += 1 if s[j] == 0
      end
    else
      (i+1...n).each do |k|
        count += 1 if s[k]==0
      end
    end

  end
end

puts count