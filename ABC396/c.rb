n,m = gets.split.map(&:to_i)
b = gets.split.map(&:to_i).sort.reverse
w = gets.split.map(&:to_i).sort.reverse
sum = 0
(0...n).each do |i|
    if b[i] > 0
        sum += b[i]
        sum += w[i] if !(w[i].nil?) && w[i] > 0 
    else
        break if w[i].nil?
        if b[i] + w[i] > 0
            sum += (b[i]+w[i])
        else
            break
        end
    end
end

puts sum
puts b.inspect
puts w.inspect