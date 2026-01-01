n,q =  gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
ans = []
box = Array.new(n){0}
index = q

(0...q).each do |i|

  if a[i] == 0

    target = Float::INFINITY
    (0...n).each do |j|
      if target > box[j]
        target = box[j]
        index = j
        # box[j]+= 1
      end
    end
    box[index] += 1
    ans << index+1

  else
    box[a[i]-1] += 1
    ans << a[i]
  end

  # puts box.inspect
  
end

# puts box.inspect
# puts ans.inspect
puts ans.join(" ")