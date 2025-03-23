n,m = gets.split.map(&:to_i)
b = gets.split.map(&:to_i).sort.reverse
w = gets.split.map(&:to_i).sort.reverse
finN = n-1
sum = 0
(0...n).each do |i|
    if b[i] <= 0
        finN = [ i,finN ].min
        break
    else
        sum += b[i]
    end
end

# puts "n終了後:#{sum} finN:#{finN}"

(0...m).each do |i|
    break if i > n-1
    if  w[i] > 0
        if finN > i
            sum += w[i]
        else
            if w[i] + b[i] > 0
                # puts w[i] + b[i]
                sum += (w[i] + b[i])
                finN = i
            else
                break
            end
        end
    else
        break
    end
end

puts sum
# puts b.inspect
# puts w.inspect
# bがマイナスの時は差し引きしてプラスならOK
# wはマイナスになった時点でボールピック中止