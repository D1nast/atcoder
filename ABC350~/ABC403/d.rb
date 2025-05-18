n,d = gets.split.map(&:to_i)
hash = Hash.new(){|hash,key| hash[key] = Hash.new(){|hash,key|hash[key]=0}}
a = gets.split.map(&:to_i)
ans = 0
(0...n).each do |i|
  hash[a[i]][i]+=1
end
(0...n).each do |i|
  count = 0
  next if !hash.has_key?(a[i])
  up,down = (a[i]+d).abs , (a[i]-d).abs
  if hash.has_key?(up) || hash.has_key?(down)
    count += hash[up].size if hash.has_key?(up)
    count += hash[down].size if hash.has_key?(down)
    if count > hash[a[i]].size
      ans += hash[a[i]].size
      hash.delete(a[i])
      puts hash.inspect
    else
      ans += count
      hash.delete(up) if  hash.has_key?(up)
      hash.delete(down) if hash.has_key?(down)
    end
  end
end

puts ans
puts hash.inspect